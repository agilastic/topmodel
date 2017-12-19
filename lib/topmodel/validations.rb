module TopModel
  module Validations
    extend  ActiveSupport::Concern
    include ActiveModel::Validations

    module InstanceMethods
      def save(options = nil)
        perform_validation = case options
        when Hash
          options[:validate] != false
        when NilClass
          true
        else
          options
        end

        if perform_validation && valid? || !perform_validation
          super()
          true
        else
          false
        end
      rescue InvalidRecord => error
        false
      end
    end

    included do
      prepend TopModel::Validations::InstanceMethods
    end
  end
end

require "topmodel/validations/uniqueness"
