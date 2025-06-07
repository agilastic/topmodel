module TopModel
  module Callbacks
    module ClassMethods
      def create
        run_callbacks :create do
          super
        end
      end

      def save
        run_callbacks :save do
          super
        end
      end

      def update
        run_callbacks :update do
          super
        end
      end

      def destroy
        run_callbacks :destroy do
          super
        end
      end
    end

    extend ActiveSupport::Concern

    included do
      instance_eval do
        extend ActiveModel::Callbacks
        define_model_callbacks :create, :save, :update, :destroy
      end

      class_eval do
        prepend TopModel::Callbacks::ClassMethods
      end
    end
  end
end
