//META{"name":"Citador"}*//

class Citador {
  
  /** LOCALE **/
  
  get local() {
    switch (document.documentElement.getAttribute('lang').split('-')[0]) {
      case 'pt':
        return {
          description: "Cita alguém no chat",
          startMsg: "Iniciado",
          quoteTooltip: "Citar",
          deleteTooltip: "Excluir",
          noPermTooltip: "Sem permissão para citar",
          noChatTooltip: "Sem permissão para enviar mensagens",
          attachment: "Anexo",
          settings: {
            mentionUser: {
              title: 'Mencionar o usuário citado',
              description: 'Mencionar ou não o usuário que se está citando. Você pode clicar no avatar dele no preview para adicionar a menção à mensagem.'
            },
            useFallbackCodeblock: {
              title: "Usar citação em formato de bloco de código",
              choices: ["Nunca", "Sempre", "Somente quando sem permissão"]
            },
            disableServers: {
              title: "Desabilitar citação em embed para servidores específicos",
              description: "Clique em um servidor para desabilitar citações em embed para ele. Clique novamente para habilitar.</br>Você também pode clicar com o botão direito em um servidor e habilitar ou desabilitar por lá.",
              context: "Citação em embed"
            },
            reset: 'Redefinir configurações'
          }
        };
      case 'de': 
        return {
          description: "Zitiert jemanden im Chat mithilfe von eingebetten Nachrichten",
          startMsg: "Gestartet",
          quoteTooltip: "Zitieren",
          deleteTooltip: "Löschen",
          noPermTooltip: "Keine Rechte zum Zitieren",
          noChatTooltip: "Keine Rechte Nachrichten zu senden",
          attachment: "Anhang",
          settings: {
            mentionUser: {
              title: 'Mention the quoted user',
              description: 'Whether to mention the quoted user or not. You can also click their avatar to attach their mention to your message.'
            },
            useFallbackCodeblock: {
              title: "Im Code-Format senden",
              choices: ["Niemals", "Immer", "Nur, falls keine Berechtigung"]
            },
            disableServers: {
              title: "Deaktiviere Zitate für spezielle Server",
              description: "Klicke auf einen Server um Zitate zu deaktivieren. Klicke erneut zum Aktivieren.</br>Du kannst auch auf einen Server rechtsklicken zum Umschalten.",
              context: "Zitate einbetten"
            },
            reset: 'Einstellungen zurücksetzten'
          }
        };
      case 'ru': 
        return {
          description: "Позволяет цитировать сообщения",
          startMsg: "Запущен",
          quoteTooltip: "Цитировать",
          deleteTooltip: "Удалить",
          noPermTooltip: "Нет прав для цитирования",
          noChatTooltip: "Нет прав для отправки сообщений",
          attachment: "Вложение",
          settings: {
            mentionUser: {
              title: 'Упоминать цитируемого пользователя',
              description: 'Переключает упоминание пользователя при цитировании. Вы так же можете нажать на аватарку цитируемого пользователя, чтобы упомянуть его.'
            },
            useFallbackCodeblock: {
              title: "Форматировать цитаты блоками кода",
              choices: ["Никогда", "Всегда", "Только если нет нужных прав"]
            },
            disableServers: {
              title: "Отключить встраивание цитат для отдельных серверов",
              description: "Нажмите на иконку сервера, чтобы отключить встраивание. Нажмите снова, чтобы включить.</br>Вы так же можете нажать ПКМ по иконке, чтобы изменить настройки оттуда.",
              context: "Встраивание цитат"
            },
            reset: 'Сбросить настройки'
          }
        };
      case 'ja': 
        return {
          description: "チャットメッセージを引用します。",
          startMsg: "起動完了",
          quoteTooltip: "引用",
          deleteTooltip: "削除",
          noPermTooltip: "引用する権限がありません",
          noChatTooltip: "このチャンネルでメッセージを送信する権利がありません",
          attachment: "添付ファイル",
          settings: {
            mentionUser: {
              title: '引用されたユーザーにメンションを飛ばす',
              description: '引用されたユーザーにメンションを送るかどうかの設定です。アバターアイコンをクリックしてもメンションを追加できます。'
            },
            useFallbackCodeblock: {
              title: "引用にコードブロックを使用する",
              choices: ["絶対に行わない", "常に行う", "権限が無いときのみ使用する"]
            },
            disableServers: {
              title: "指定したサーバーでEmbedの引用を無効化します",
              description: "サーバーをクリックするとEmbedの引用が無効になります。もう一度クリックすることで再度有効になります。</br>ギルドを右クリックすることで切り替えることもできます。",
              context: "Embedの引用"
            },
            reset: '設定をリセット'
          }
        };
      case 'fr':
        {
          return {
            description: "Cite un message du chat",
            startMsg: "Lancé",
            quoteTooltip: "Citer",
            deleteTooltip: "Supprimer",
            noPermTooltip: "Vous n'avez pas la permission de citer",
            noChatTooltip: "Vous n'avez pas la permission d'envoyer un message",
            attachment: "Message attaché",
            settings: {
              mentionUser: {
                title: 'Mentionner l\'utilisateur cité',
                description: 'Choisir de mentionner l\'utilisateur ou non. Vous pouvez aussi cliquer sur l\'avatar de l\'utilisateur cité.'
              },
              useFallbackCodeblock: {
                title: "Utiliser le format \"codeblock\"",
                choices: ["Jamais", "Toujours", "Seulement quand je n'ai pas les permissions"]
              },
              disableServers: {
                title: "Désactiver les citations en embed pour certains serveurs",
                description: "Cliquez sur un serveur pour désactiver les citation en embed. Re-cliquez pour les réactiver.</br>Vous pouvez aussi faire un click droit pour basculer.",
                context: "Embed quotes"
              },
              reset: 'Remettre à zéro'
            }
          };
        };
      default: 
        return {
          description: "Quotes somebody in chat",
          startMsg: "Started",
          quoteTooltip: "Quote",
          deleteTooltip: "Delete",
          noPermTooltip: "No permission to quote",
          noChatTooltip: "No permission to send messages",
          attachment: "Attachment",
          settings: {
            mentionUser: {
              title: 'Mention the quoted user',
              description: 'Whether to mention the quoted user or not. You can also click their avatar to attach their mention to your message.'
            },
            useFallbackCodeblock: {
              title: "Use codeblock quote format",
              choices: ["Never", "Always", "Only when without permission"]
            },
            disableServers: {
              title: "Disable embed quotes for specific servers",
              description: "Click a server to disable embed quotes for it. Click again to enable.</br>You can also right-click a guild and toggle it.",
              context: "Embed quotes"
            },
            reset: 'Reset settings'
          }
        };
    };
  }
  
  /** BD FUNCTIONS **/
  
  getName         () { return "Citador";            }
  getDescription  () { return this.local.description}
  getVersion      () { return "1.7.5";              }
  getAuthor       () { return "Nirewen";            }
  unload          () { this.deleteEverything();     }
  stop            () { this.deleteEverything();     }
  load            () {                              }
  start           () {
    let libraryScript = this.inject('script', {
      type: 'text/javascript',
      id: 'zeresLibraryScript',
      src: 'https://rauenzi.github.io/BetterDiscordAddons/Plugins/PluginLibrary.js'
    });
    this.inject('link', {
      type: 'text/css',
      id: 'citador-css',
      rel: 'stylesheet',
      href: 'https://cdn.rawgit.com/nirewen/Citador/master/Citador.styles.css'
    });

    if (typeof window.ZeresLibrary !== "undefined") 
      this.initialize();
    else 
      libraryScript.addEventListener("load", () => { this.initialize(); });
  }
  
  initialize() {
    let self = this;
    PluginUtilities.checkForUpdate(this.getName(), this.getVersion(), "https://raw.githubusercontent.com/nirewen/Citador/master/Citador.plugin.js");
    PluginUtilities.showToast(`${this.getName()} ${this.getVersion()} ${this.local.startMsg.toLowerCase()}`);
    this.switchObserver    = PluginUtilities.createSwitchObserver(this);
    this.MessageParser     = InternalUtilities.WebpackModules.findByUniqueProperties(["createBotMessage"]);
    this.MessageQueue      = InternalUtilities.WebpackModules.findByUniqueProperties(["enqueue"]);
    this.MessageController = InternalUtilities.WebpackModules.findByUniqueProperties(["sendClydeError"]);
    this.EventDispatcher   = InternalUtilities.WebpackModules.findByUniqueProperties(["dispatch"]);
    this.MainDiscord       = InternalUtilities.WebpackModules.findByUniqueProperties(["ActionTypes"]);
    this.HistoryUtils      = InternalUtilities.WebpackModules.findByUniqueProperties(['transitionTo', 'replaceWith', 'getHistory']);
    this.moment            = InternalUtilities.WebpackModules.findByUniqueProperties(['parseZone']);
    this.initialized       = true;
    this.quoteURL          = 'https://github.com/nirewen/Citador?';
    this.CDN_URL           = 'https://cdn.discordapp.com/avatars/';
    this.ASSETS_URL        = 'https://discordapp.com';
  
    this.loadSettings();
    this.patchExternalLinks();
    
    $(document).on("mouseover.citador", function(e) {
      var target = $(e.target);
      if (target.parents(".message").length > 0) {
        $('.messages .message-group')
          .on('mouseover', function() {
            if ($(this).find('.citar-btn').length == 0) {
              $('.messages .message-group').hasClass('compact') 
                ? $(this).find('.timestamp').first().prepend('<span class="citar-btn"></span>') 
                : $(this).find($('.messages .message-group .comment .body h2')).append('<span class="citar-btn"></span>');
                
              new PluginTooltip.Tooltip($(this).find('.citar-btn'), self.local.quoteTooltip);
              $(this).find('.citar-btn')
                .on('mousedown.citador', () => false)
                .click(function() {
                  self.attachParser();
                  
                  let message   = $(this).parents('.message-group'),
                    mInstance = ReactUtilities.getOwnerInstance($(".messages-wrapper")[0]),
                    channel   = mInstance.props.channel,
                    range;
                  
                  self.quoteProps = $.extend(true, {}, ReactUtilities.getOwnerInstance(message[0]).props);
                    
                  if (window.getSelection && window.getSelection().rangeCount > 0)
                    range = window.getSelection().getRangeAt(0);
                  else if (document.selection && document.selection.type !== 'Control')
                    range = document.selection.createRange();
                    
                  var thisPost = $(this).closest('.comment');
                  
                  this.createQuote = function() {
                    var messageElem = $(message).clone().hide().appendTo(".quote-msg");
                    self.quoteMsg = $(".quote-msg");
                    
                    $('.quote-msg').find('.citar-btn').toggleClass('hidden');
                    
                    $('.quote-msg').find('.embed').each(function() {
                      $(this).closest('.accessory').remove();
                    });
                    
                    $('.quote-msg').find('.markup').each(function() {
                      if (0 === $(this).text().length + $(this).children().length + $(this).closest(".message").find('.accessory').length) {
                        $(this).closest('.message-text').remove();
                      }
                    });
                    $('.quote-msg').find('.message-content').each(function() {
                      if (0 === $(this).text().length + $(this).children().length + $(this).closest(".message").find('.accessory').length) {
                        $(this).closest('.message-text').remove();
                      }
                    });

                    $('.quote-msg').find('.markup').before('<div class="delete-msg-btn"></div>');
                    $('.quote-msg').find('.edited, .btn-option, .btn-reaction').remove();
                    
                    $('.quote-msg .message-group').append('<div class="quote-close"></div>');
                    $('.quote-msg').find('.quote-close').click(() => self.cancelQuote());
                    
                    // define a função de clique, pra deletar uma mensagem que você não deseja citar
                    $('.quote-msg').find('.delete-msg-btn')
                      .click(function() {
                        self.removeQuoteAtIndex($('.quote-msg .message').index($('.quote-msg .message').has(this)), () => deleteTooltip.remove());
                      })
                      .each(function() {
                        new PluginTooltip.Tooltip($(this), self.local.deleteTooltip);
                      });
                      
                    $('.quote-msg').find('.avatar-large')
                      .click(function () {self.attachMention(self.quoteProps.messages[0].author)});
                    
                    if (self.settings.mentionUser) {
                      self.attachMention(self.quoteProps.messages[0].author);
                    }

                    if (range) {
                      var startPost = $(range.startContainer).closest('.message'),
                        endPost   = $(range.endContainer).closest('.message');
                        
                      if (thisPost.has(startPost) && thisPost.has(endPost) && startPost.length && endPost.length) {
                        var startI   = thisPost.find(".message").index(startPost),
                          endI     = thisPost.find(".message").index(endPost);
                        
                        if(range.startOffset != range.endOffset || startI != endI) {
                          self.selectionP = {
                            start: {
                              index: startI,
                              offset: range.startOffset
                            },
                            end: {
                              index: endI,
                              offset: range.endOffset
                            }
                          };
                        
                          self.quoteProps.messages.forEach((m, i) => {
                            var msg = $($('.quote-msg .message')[i]).find(".markup");
                            if(endI == startI) msg.text(m.content.substring(range.startOffset, range.endOffset));
                            else if(i == startI) msg.text(m.content.substring(range.startOffset));
                            else if(i == endI) msg.text(m.content.substring(0, range.endOffset));
                            if(i < startI || i > endI) self.removeQuoteAtIndex(i);
                          });
                        }
                      }
                    }

                    $('.quote-msg').find(".message")
                      .on('mouseover.citador', function() {
                        $(this).find('.delete-msg-btn').fadeTo(5, 0.4);
                      })
                      .on('mouseout.citador', function() {
                        $(this).find('.delete-msg-btn').fadeTo(5, 0);
                      });                 
                    
                    if (!self.canChat()) {
                      $('.quote-msg').find('.citar-btn.hidden:not(.cant-embed)').toggleClass('hidden cant-embed');
                      new PluginTooltip.Tooltip($('.quote-msg').find('.citar-btn'), self.local.noChatTooltip, 'red');
                    }
                    else if (!self.canEmbed() && self.settings.useFallbackCodeblock == 0) {
                      $('.quote-msg').find('.citar-btn.hidden:not(.cant-embed)').toggleClass('hidden cant-embed');
                      new PluginTooltip.Tooltip($('.quote-msg').find('.citar-btn'), self.local.noPermTooltip, 'red');
                    }
                    
                    messageElem.slideDown(150);
                  };
                  
                  if ($('.quote-msg .message-group').length > 0)
                    $('.quote-msg .message-group').remove();
                  else
                    $('.channelTextArea-1LDbYG').prepend('<div class="quote-msg"></div>');
                  
                  this.createQuote();
                  $('.channelTextArea-1LDbYG').focus();
                });
            }
          })
          .on('mouseleave',function() {
            if ($(this).find('.citar-btn').length == 1)
              $(this).find('.citar-btn').empty().remove();
          });
      }
    });
    this.log(this.local.startMsg, "info");
  }
  
  onChannelSwitch () {
    if (this.quoteProps) {
      this.attachParser();
      
      $('.channelTextArea-1LDbYG').prepend(this.quoteMsg);
      
      if (!this.canChat()) {
        $('.quote-msg').find('.citar-btn.hidden:not(.cant-embed)').toggleClass('hidden cant-embed');
        new PluginTooltip.Tooltip($('.quote-msg').find('.citar-btn'), this.local.noChatTooltip, 'red');
      }
      else if (!this.canEmbed() && this.settings.useFallbackCodeblock == 0) {
        $('.quote-msg').find('.citar-btn.hidden:not(.cant-embed)').toggleClass('hidden cant-embed');
        new PluginTooltip.Tooltip($('.quote-msg').find('.citar-btn'), this.local.noPermTooltip, 'red');
      } else
        $('.quote-msg').find('.citar-btn:not(.hidden).cant-embed').toggleClass('hidden cant-embed');
    }
  }
  
  getSettingsPanel() {
    let panel = $("<form>").addClass("form citador").css("width", "100%");
    if (this.initialized) this.generateSettings(panel);
    return panel[0];
  }
  
  attachParser() {
    var el = $('.channelTextArea-1LDbYG');
    if (el.length == 0) return;
    
    const handleKeypress = (e) => {
      var code = e.keyCode || e.which;
      if (code !== 13) return;
      
      try {
        if (this.settings.useFallbackCodeblock == 1 || !this.canEmbed() && this.settings.useFallbackCodeblock == 2 || this.settings.disabledServers.includes(PluginUtilities.getCurrentServer() ? PluginUtilities.getCurrentServer().id : null))
          this.sendTextQuote(e);
        else
          this.sendEmbedQuote(e);
      } catch (e) {
        this.log(e, "warn");
      }
    };
    
    el[0].addEventListener("keydown", handleKeypress, false);
    el[0].addEventListener("keyup", (e) => {
      if (e.keyCode == 27 && this.quoteProps) this.cancelQuote();
    }, false);
  }
  
  attachMention(user) {
    if (!$('form')[0]) return;
    ReactUtilities.getOwnerInstance($('form')[0]).setState({
      textValue: ReactUtilities.getOwnerInstance($('form')[0]).state.textValue + `@${user.username}#${user.discriminator} `
    });
  }
  
  sendEmbedQuote(e) {
    var props = this.quoteProps;
    if (props) {
      if (e.shiftKey || $('.autocomplete-1TnWNR').length >= 1) return;
    
      var messages  = props.messages.filter(m => !m.deleted),
          guilds    = this.guilds,
          msg       = props.messages[0],
          cc        = ReactUtilities.getOwnerInstance($("form")[0]).props.channel,
          msgC      = props.channel,
          msgG      = guilds.filter(g => g.id == msgC.guild_id)[0],
          
          author    = msg.author,
          avatarURL = author.getAvatarURL(),
          color     = parseInt(msg.colorString ? msg.colorString.slice(1) : 'ffffff', 16),
          msgCnt    = this.MessageParser.parse(cc, $('.channelTextArea-1LDbYG textarea').val()),
          text      = messages.map(m => m.content).join('\n'),
          atServer  = msgC.guild_id && msgC.guild_id != cc.guild_id ? ` at ${msgG.name}` : '',
          chName    = msgC.isDM() ? `@${msgC._getUsers()[0].username}` : msgC.isGroupDM() ? `${msgC.name}` : `#${msgC.name}`;
          
      if (this.selectionP) {
        var start = this.selectionP.start,
          end = this.selectionP.end;
        
        props.messages.forEach((m, i) => {
          text = '';
          if(!m.deleted) {
            var endText = m.content;
            if(end.index == start.index) endText = m.content.substring(start.offset, end.offset);
            else if(i == start.index) endText = m.content.substring(start.offset);
            else if(i == end.index) endText = m.content.substring(0, end.offset);
            if(i >= start.index && i <= end.index) text += `${endText}\n`;
          }
        });
      }
      
      let embed = {
          author: {
            name: msg.nick || author.username,
            icon_url: avatarURL.startsWith(this.CDN_URL) ? avatarURL : `${this.ASSETS_URL}${avatarURL}`,
            url: `${this.quoteURL}${msgG ? `guild_id=${msgG.id}&` : ''}channel_id=${msgC.id}&message_id=${msg.id}`,
          },
          description: text,
          footer: {
            text: `in ${chName}${atServer}`
          },
          color,
          timestamp: msg.timestamp.toISOString(),
        },
        attachments = messages.map(m => m.attachments).reduce((a, b) => a.concat(b));
            
      if (attachments.length >= 1) {
        var imgAt = attachments.filter(a => a.width);
        if(imgAt.length >= 1)
          embed.image = {url: attachments[0].url};
        
        var otherAt = attachments.filter(a => !a.width);
        if (otherAt.length >= 1) {
          embed.fields = [];
          otherAt.forEach((at, i) => {
            var emoji = '📁';
            if (/(.apk|.appx|.pkg|.deb)$/.test(at.filename)) emoji = '📦';
            if (/(.jpg|.png|.gif)$/.test(at.filename)) emoji = '🖼';
            if (/(.zip|.rar|.tar.gz)$/.test(at.filename)) emoji = '📚';
            if (/(.txt)$/.test(at.filename)) emoji = '📄';
            
            embed.fields.push({name: `${this.local.attachment} #${i+1}`, value: `${emoji} [${at.filename}](${at.url})`});
          });
        }
      }
      
      var msg = this.MessageParser.createMessage(cc.id, msgCnt.content);
      
      this.MessageQueue.enqueue({
        type: "send",
        message: {
          channelId: cc.id,
          content: msgCnt.content,
          tts: false,
          nonce: msg.id,
          embed
        }
      }, r => {
        r.ok ? (this.MessageController.receiveMessage(cc.id, r.body)) : (r.status >= 400 && r.status < 500 && r.body && this.MessageController.sendClydeError(cc.id, r.body.code),
        this.EventDispatcher.dispatch({
          type: this.MainDiscord.ActionTypes.MESSAGE_SEND_FAILED,
          messageId: msg.id,
          channelId: cc.id
        }))
      });
          
      ReactUtilities.getOwnerInstance($('form')[0]).setState({textValue: ''});
    
      this.cancelQuote();
      e.preventDefault();
      e.stopPropagation();
      return;
    }
  }
  
  sendTextQuote(e) {
    var props = this.quoteProps;
    if (props) {
      if (e.shiftKey || $('.autocomplete-1TnWNR').length >= 1) return;
    
      var messages  = props.messages.filter(m => !m.deleted),
        guilds    = this.guilds,
        msg      = props.messages[0],
        cc        = ReactUtilities.getOwnerInstance($("form")[0]).props.channel,
        msgC      = props.channel,
        msgG      = guilds.filter(g => g.id == msgC.guild_id)[0],
        
        author    = msg.author,
        color     = parseInt(msg.colorString ? msg.colorString.slice(1) : 'ffffff', 16),
        content   = this.MessageParser.parse(cc, $('.channelTextArea-1LDbYG textarea').val()).content,
        text      = messages.map(m => m.content).join('\n'),
        atServer  = msgC.guild_id && msgC.guild_id != cc.guild_id ? ` at ${msgG.name}` : '',
        chName    = msgC.isDM() ? `@${msgC._getUsers()[0].username}` : msgC.isGroupDM() ? `${msgC.name}` : `#${msgC.name}`;
          
      if (this.selectionP) {
        var start = this.selectionP.start,
          end = this.selectionP.end;
        
        props.messages.forEach((m, i) => {
          text = '';
          if(!m.deleted) {
            var endText = m.content;
            if(end.index == start.index) endText = m.content.substring(start.offset, end.offset);
            else if(i == start.index) endText = m.content.substring(start.offset);
            else if(i == end.index) endText = m.content.substring(0, end.offset);
            if(i >= start.index && i <= end.index) text += `${endText}\n`;
          }
        });
      }
      
      const format = 'DD-MM-YYYY HH:mm';
      content     += `\n${'```'}\n${this.MessageParser.unparse(text, cc.id).replace(/\n?(```((\w+)?\n)?)+/g, '\n').trim()}\n${'```'}`;
      content     += `\`${msg.nick || author.username} - ${this.moment(msg.timestamp).format(format)} | ${chName}${atServer}\``;
      content      = content.trim();
          
      this.MessageController.sendMessage(cc.id, { content });
          
      ReactUtilities.getOwnerInstance($('form')[0]).setState({textValue: ''});
    
      this.cancelQuote();
      e.preventDefault();
      e.stopPropagation();
      return;
    }
  }
  
  patchExternalLinks() {
    let LinkComponent = InternalUtilities.WebpackModules.find(InternalUtilities.Filters.byCode(/trusted/));
    this.cancel = InternalUtilities.monkeyPatch(LinkComponent.prototype, "render", {before: ({thisObject}) => {
        if (thisObject.props.href.startsWith(this.quoteURL)) {
          thisObject.props.trusted = true;
            thisObject.props.onClick = (e) => {
                e.preventDefault();
                const querystring = require('querystring');
                const {guild_id, channel_id, message_id} = querystring.parse(thisObject.props.href.substring(this.quoteURL.length));
                if (!guild_id || this.guilds.find(g => g.id == guild_id))
                  this.HistoryUtils.transitionTo(this.MainDiscord.Routes.MESSAGE(guild_id, channel_id, message_id));
                else
                  ReactUtilities.getOwnerInstance($('.app')[0]).shake();
            };
        }
    }});
  }
  
  removeQuoteAtIndex(i) {
    if (this.quoteProps) {
      if (this.quoteProps.messages.filter(m => !m.deleted).length < 2)
        this.cancelQuote();
      else {
        let deleteMsg = $($('.quote-msg .message')[i]);                
        deleteMsg.find('.message-text, .accessory').hide();    
        this.quoteProps.messages[i].deleted = true;
      }
    } else
      this.cancelQuote();
  }
  
  cancelQuote() {
    $('.quote-msg').slideUp(300, () => $('.quote-msg').remove());
    this.quoteMsg   = null;
    this.quoteProps.messages.forEach(m => m.deleted = null);
    this.quoteProps = null;
    this.selectionP = null;
  }
  
  observer(e) {
    if (!e.addedNodes.length || !(e.addedNodes[0] instanceof Element) || !e.addedNodes[0].classList) return;
    let elem  = e.addedNodes[0],
      context = elem.classList.contains('contextMenu-uoJTbz') ? elem : elem.querySelector('.contextMenu-uoJTbz');
    if (!context) return;
    
    let {guild, target} = ReactUtilities.getReactProperty(context, "return.memoizedProps");
    
    if (!guild || target.className !== "avatar-small") return;
    
    let {id} = guild;
    $(context).find('.item-1XYaYf').first().after(
      $(new PluginContextMenu.ToggleItem(this.local.settings.disableServers.context, !this.settings.disabledServers.includes(id), {
        callback: e => {
          if (this.settings.disabledServers.includes(id))
            this.settings.disabledServers.splice(this.settings.disabledServers.indexOf(id), 1);
          else
            this.settings.disabledServers.push(id);
          this.saveSettings();
        }
      }).getElement())
    );
  }
  
  /** UTILS **/
  
  canEmbed() {
    const channel = ReactUtilities.getOwnerInstance($(".messages-wrapper")[0]);
    return channel.props.channel.isPrivate() || channel.can(0x4000, {channelId: channel.props.channel.id});
  }
  
  canChat() {
    const channel = ReactUtilities.getOwnerInstance($(".messages-wrapper")[0]);
    return channel.props.channel.isPrivate() || channel.can(0x800, {channelId: channel.props.channel.id});
  }
  
  log(message, method = 'log') {
    console[method](`[${this.getName()}]`, message)
  }
  
  inject(name, options) {
    let element = document.getElementById(options.id);
    if (element) element.parentElement.removeChild(element);
    element = document.createElement(name);
    for (let attr in options)
      element.setAttribute(attr, options[attr]);
    document.head.appendChild(element);
    return element;
  }
  
  remove(element) {
    let elem = document.getElementById(element);
    if (elem)
      elem.parentElement.removeChild(elem);
  }
  
  deleteEverything() {
    $(document).off("mouseover.citador");
    $('.messages .message-group').off('mouseover');
    $('.messages .message-group').off('mouseleave');
    this.remove("citador-css");
    this.switchObserver.disconnect();
    this.initialized = false;
    this.cancel();
  }
  
  get guilds () { 
    return ReactUtilities.getOwnerInstance($(".guilds-wrapper")[0]).state.guilds.map(o => o.guild);
  }
  
  get defaultSettings() {
    return {
      useFallbackCodeblock: 0,
      mentionUser: false,
      disabledServers: []
    }
  }
  
  getIconTemplate(guild) {
    let disabled = this.settings.disabledServers.includes(guild.id) ? ' disabled' : '';
    return guild.icon
      ? `<a class="avatar-small ${disabled}" style="background-image: url(https://cdn.discordapp.com/icons/${guild.id}/${guild.icon}.webp)"></a>`
      : `<a class="avatar-small ${disabled}">${guild.acronym}</a>`;
  }
  
  saveSettings() {
    PluginUtilities.saveSettings(this.getName(), this.settings);
  }

  loadSettings() {
    this.settings = PluginUtilities.loadSettings(this.getName(), this.defaultSettings);
  }
  
  resetSettings(panel) {
    this.settings = this.defaultSettings;
    this.saveSettings();
    panel.empty();
    this.generateSettings(panel);
  }
  
  generateSettings(panel) {
    const defaultForm = 
      `<div class="citador ui-form-item flexChild-1KGW5q">
        <h5 class="h5 h5-18_1nd"></h5>
        <div class="description"></div>
      </div>`;
    panel.append(
      $(defaultForm)
        .css('padding-top', '10px')
        .find('.h5')
        .toggleClass('title-3sZWYQ size12-3R0845 height16-2Lv3qA weightSemiBold-NJexzi defaultMarginh5-2mL-bP marginBottom8-AtZOdT')
        .html(this.local.settings.mentionUser.title)
        .parent()
        .find('.description')
        .html(this.local.settings.mentionUser.description)
        .toggleClass('description-3_Ncsb formText-3fs7AJ marginBottom8-AtZOdT modeDefault-3a2Ph1 primary-jw0I4K')
        .append(
          new PluginSettings.Checkbox(this.local.settings.mentionUser.title, this.local.settings.mentionUser.description, this.settings.mentionUser, value => {
            this.settings.mentionUser = value;
            this.saveSettings();
          }).getElement().find('.input-wrapper')
        )
        .parent(),
      $(defaultForm)
        .find('.h5')
        .toggleClass('title-3sZWYQ size12-3R0845 height16-2Lv3qA weightSemiBold-NJexzi defaultMarginh5-2mL-bP marginBottom8-AtZOdT')
        .html(this.local.settings.useFallbackCodeblock.title)
        .parent()
        .append(
          $('<div class="radioGroup-1GBvlr">')
          .append(
            this.local.settings.useFallbackCodeblock.choices.map((choice, i) =>
              this.Checkbox(choice, this.settings.useFallbackCodeblock, i)
            )
          )
        ),
      $(defaultForm)
        .css('padding-top', '10px')
        .find('.h5')
        .toggleClass('title-3sZWYQ size12-3R0845 height16-2Lv3qA weightSemiBold-NJexzi defaultMarginh5-2mL-bP marginBottom8-AtZOdT')
        .html(this.local.settings.disableServers.title)
        .parent()
        .find('.description')
        .html(this.local.settings.disableServers.description)
        .toggleClass('description-3_Ncsb formText-3fs7AJ marginBottom8-AtZOdT modeDefault-3a2Ph1 primary-jw0I4K')
        .parent()
        .append(
          $('<div class="citador-guilds">').append(
            this.guilds.map(guild => {
              let guildEl = this.GuildElement(guild);
              return guildEl
                .click(() => {
                  if (this.settings.disabledServers.includes(guild.id)) {
                    this.settings.disabledServers.splice(this.settings.disabledServers.indexOf(guild.id), 1);
                    guildEl.find('.avatar-small')
                      .toggleClass('disabled');
                  } else {
                    this.settings.disabledServers.push(guild.id);
                    guildEl.find('.avatar-small')
                      .toggleClass('disabled');
                  }
                  this.saveSettings();
                });
            })
          )
        ),
      $(defaultForm)
        .css('padding-top', '10px')
        .append(
          $(`<button type="button">`)
            .toggleClass('button-38aScr lookFilled-1Gx00P colorRed-1TFJan sizeMedium-1AC_Sl grow-q77ONN')
            .css({
              'margin': '0 auto'
            })
            .html(this.local.settings.reset)
            .click(() => this.resetSettings(panel))
        )
    );
  }
  
  Checkbox(value, setting, type) {
    let checkbox = $(`<div class="item-26Dhrx marginBottom8-AtZOdT horizontal-2EEEnY flex-1O1GKY directionRow-3v3tfG cardPrimaryEditable-3KtE4g card-3Qj_Yx" style="padding: 10px;">
      <label class="checkboxWrapper-SkhIWG">
        <input type="checkbox" class="inputDefault-3JxKJ2 input-3ITkQf">
        <div class="checkbox-1ix_J3 flexCenter-3_1bcw flex-1O1GKY justifyCenter-3D2jYp alignCenter-1dQNNs box-mmYMsp">
          <svg name="Checkmark" width="18" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
            <g fill="none" fill-rule="evenodd">
              <polyline stroke="transparent" stroke-width="2" points="3.5 9.5 7 13 15 5"></polyline>
            </g>
          </svg>
        </div>
      </label>
      <div class="info-3LOr12">
        <div class="title-3BE6m5">${value}</div>
      </div>
    </div>`);
    if (setting == type) {
      checkbox
        .css({
          'border-color': 'rgb(114, 137, 218)',
          'background-color': 'rgb(114, 137, 218)'
        })
        .find('.checkbox-1ix_J3')
        .toggleClass('checked-3_4uQ9')
        .css('border-color', 'rgb(114, 137, 218)')
      checkbox
        .find('polyline')
        .attr('stroke', '#7289da')
      checkbox
        .find('.title-3BE6m5')
        .toggleClass('titleChecked-2wg0pd')
        .css('color', 'rgb(255, 255, 255)');
      return checkbox;
    } else {
      return checkbox
        .on('click.citador', () => {
          this.settings.useFallbackCodeblock = type;
          this.saveSettings();
          checkbox.parent().empty().append(
            this.local.settings.useFallbackCodeblock.choices.map((choice, i) => 
              this.Checkbox(choice, this.settings.useFallbackCodeblock, i)
            )
          );
        });
    }
  }
  
  GuildElement(guild) {
    const guildEl = $(
    `<div class="guild">
       <div>
         <div class="guild-inner">
           ${this.getIconTemplate(guild)}
         </div>
       </div>
     </div>`);
    new PluginTooltip.Tooltip(guildEl.find('.avatar-small'), guild.name);
    return guildEl;
  }
}
