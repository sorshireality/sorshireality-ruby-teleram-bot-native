class FishSocket
  module Listener
    # This module assigned to processing all callback messages
    module CallbackMessages
      attr_accessor :callback_message

      def process
        self.callback_message = Listener.message.message
        case Listener.message.data
        when 'get_account'
          Listener::Response.std_message('Нету аккаунтов на данный момент')
        when 'force_promo'
          Listener::Response.force_reply_message('Отправьте промокод')
        when 'advanced_menu'
          Listener::Response.inline_message('Дополнительное меню:', Listener::Response.generate_inline_markup([
              Inline_Button::HAVE_PROMO
          ]), true)
        end
      end

      module_function(
          :process,
          :callback_message,
          :callback_message=
      )
    end
  end
end
