class FishSocket
  module Listener
    # This module assigned to processing all promo-codes
    module Promos
      def validate(code)
        return true if code =~ /^1[a-zA-Z]*0$/
        false
      end

      module_function(
          :validate
      )
    end
  end
end
