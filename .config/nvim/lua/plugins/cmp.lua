return {
	"hrsh7th/nvim-cmp",
	version = false,
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"https://codeberg.org/FelipeLema/cmp-async-path",
		"hrsh7th/cmp-git",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp-document-symbol",
		"lukas-reineke/cmp-under-comparator",
		-- "hrsh7th/cmp-nvim-lsp-signature-help",
		{ "dcampos/cmp-snippy", dependencies = { "dcampos/nvim-snippy" } },
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local snippy = require("snippy")
		local cmp_buffer = require("cmp_buffer")

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and
			vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local lspkind_comparator = function(conf)
			local lsp_types = require("cmp.types").lsp
			return function(entry1, entry2)
				if entry1.source.name ~= "nvim_lsp" then
					if entry2.source.name == "nvim_lsp" then
						return false
					else
						return nil
					end
				end
				local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
				local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

				local priority1 = conf.kind_priority[kind1] or 0
				local priority2 = conf.kind_priority[kind2] or 0
				if priority1 == priority2 then
					return nil
				end
				return priority2 < priority1
			end
		end

		local label_comparator = function(entry1, entry2)
			return entry1.completion_item.label < entry2.completion_item.label
		end

		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					snippy.expand_snippet(args.body) -- For `snippy` users.
				end,
			},
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif snippy.can_expand_or_advance() then
						snippy.expand_or_advance()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif snippy.can_jump(-1) then
						snippy.previous()
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "snippy" },
				{ name = "nvim_lsp" },
			}, {
				{
					name = "buffer",
					-- https://github.com/hrsh7th/cmp-buffer#visible-buffers
					option = {
						get_bufnrs = function()
							local bufs = {}
							for _, win in ipairs(vim.api.nvim_list_wins()) do
								bufs[vim.api.nvim_win_get_buf(win)] = true
							end
							return vim.tbl_keys(bufs)
						end,
					},
				},
			}),
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					menu = {
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						cmp_git = "[Git]",
						snippy = "[Snippy]",
						async_path = "[Path]",
						cmdline = "[CMD]",
						nvim_lsp_document_symbol = "[Symbol]",
					},
					before = function(entry, vim_item)
						if entry.source.name == "nvim_lsp" then
							-- vim_item.dup = 0
						end
						return vim_item
					end,
				}),
			},
			view = {
				entries = { name = "custom", selection_order = "near_cursor" },
			},
			-- https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques#disabling-completion-in-certain-contexts-such-as-comments
			-- enabled = function()
			-- 	local context = require("cmp.config.context")
			-- 	-- complete as normal in command mode
			-- 	if vim.api.nvim_get_mode().mode == "c" then
			-- 		return true
			-- 	else
			-- 		-- if not in command mode disable when writing a comment or in telescope
			-- 		return not context.in_treesitter_capture("comment")
			-- 		    and not context.in_syntax_group("Comment")
			-- 		    and vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
			-- 	end
			-- end,
			enabled = function()
				-- disable completion in comments
				local context = require("cmp.config.context")
				-- keep command mode completion enabled when cursor is in a comment
				if vim.api.nvim_get_mode().mode == "c" then
					return true
				else
					return not context.in_treesitter_capture("comment") and
					not context.in_syntax_group("Comment")
				end
			end,
			sorting = {
				comparators = vim.tbl_deep_extend("keep", {
					require("cmp-under-comparator").under,
					function(...)
						return cmp_buffer:compare_locality(...)
					end,
					--[[ lspkind_comparator({
						kind_priority = {
							Field = 11,
							Property = 11,
							Constant = 10,
							Enum = 10,
							EnumMember = 10,
							Event = 10,
							Function = 10,
							Method = 10,
							Operator = 10,
							Reference = 10,
							Struct = 10,
							Variable = 9,
							File = 8,
							Folder = 8,
							Class = 5,
							Color = 5,
							Module = 5,
							Keyword = 2,
							Constructor = 1,
							Interface = 1,
							Snippet = 0,
							Text = 1,
							TypeParameter = 1,
							Unit = 1,
							Value = 1,
						},
					}), ]]
					label_comparator,
				}, require("cmp.config.default")().sorting.comparators),
			},
		})

		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
			}, {
				{ name = "buffer" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "nvim_lsp_document_symbol" },
			}, {
				{ name = "buffer" },
			}),
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "async_path" },
			}, {
				{ name = "cmdline" },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
		})
	end,
}
