class FishSocket
  # This module assigned to creating InlineKeyboardButton
  module Inline_Button
    GET_ACCOUNT = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Получить account', callback_data: 'get_account')
    HAVE_PROMO = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Есть промокод?', callback_data: 'force_promo')
    ADDITION_MENU = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Ништяки', callback_data: 'advanced_menu')
  end
end
