class FishSocket
  module Listener
    # This module assigned to processing all standart messages
    module StandartMessages
      def process
        case Listener.message.text
        when '/get_account'
          Response.std_message 'Very sorry, нету аккаунтов на данный момент'
        when '/start'
          Response.inline_message 'Привет, выбери из доступных действий', Response::generate_inline_markup(
            [
                Inline_Button::GET_ACCOUNT,
                Inline_Button::ADDITION_MENU
            ]
          )
        else
          unless Listener.message.reply_to_message.nil?
            case Listener.message.reply_to_message.text
            when /Отправьте промокод/
              return Listener::Response.std_message 'Промокод существует, вот бесплатный аккаунт :' if Promos::validate Listener.message.text

              return Listener::Response.std_message 'Промокод не найден'
            end
          end
          Response.std_message 'Первый раз такое слышу, попробуй другой текст'
        end
      end

      module_function(
        :process
      )
    end
  end
end
