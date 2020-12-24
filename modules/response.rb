class FishSocket
  module Listener
    # This module assigned to responses from bot
    module Response
      def std_message(message, chat_id = false )
        chat = (defined?Listener.message.chat.id) ? Listener.message.chat.id : Listener.message.message.chat.id
        chat = chat_id if chat_id
        Listener.bot.api.send_message(
          parse_mode: 'html',
          chat_id: chat,
          text: message
        )
      end

      def inline_message(message, inline_markup, editless = false, chat_id = false)
        chat = (defined?Listener.message.chat.id) ? Listener.message.chat.id : Listener.message.message.chat.id
        chat = chat_id if chat_id
        if editless
          return Listener.bot.api.edit_message_text(
            chat_id: chat,
            parse_mode: 'html',
            message_id: Listener.message.message.message_id,
            text: message,
            reply_markup: inline_markup
          )
        end
        Listener.bot.api.send_message(
          chat_id: chat,
          parse_mode: 'html',
          text: message,
          reply_markup: inline_markup
        )
      end

      def generate_inline_markup(kb, force = false)
        Telegram::Bot::Types::InlineKeyboardMarkup.new(
          inline_keyboard: kb
        )
      end

      def force_reply_message(text, chat_id = false)
        chat = (defined?Listener.message.chat.id) ? Listener.message.chat.id : Listener.message.message.chat.id
        chat = chat_id if chat_id
        Listener.bot.api.send_message(
          parse_mode: 'html',
          chat_id: chat,
          text: text,
          reply_markup: Telegram::Bot::Types::ForceReply.new(
            force_reply: true,
            selective: true
          )
        )
      end

      module_function(
        :std_message,
        :generate_inline_markup,
        :inline_message,
        :force_reply_message
      )
    end
  end
end
