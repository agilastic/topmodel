module TopModel
  module Dirty
    extend ActiveSupport::Concern
    include ActiveModel::Dirty

    module ClassMethods
      def create(*args, &block)
        result = super(*args, &block)
        save_previous_changes
        result
      end

      def update(*args, &block)
        result = super(*args, &block)
        save_previous_changes
        result
      end
    end

    included do
      class_eval do
        prepend ClassMethods

        def save_previous_changes
          @previously_changed = changes
          @changed_attributes.clear
        end
      end
    end
  end
end
