class FishSocket
  module Listener
    # Module for checks
    module Security
      def message_is_new(start_time, message)
        message_time = (defined? message.date) ? message.date : message.message.date
        message_time.to_i > start_time
      end

      def message_too_far
        message_date = (defined? Listener.message.date) ? Listener.message.date : Listener.message.message.date
        message_delay = Time.now.to_i - message_date.to_i
        # if message delay less then 5 min then processing message, else ignore
        message_delay > (5 * 60)
      end
      module_function :message_is_new, :message_too_far
    end
  end
end
