module TopModel
  module Callbacks
    extend ActiveSupport::Concern

    included do
      instance_eval do
        extend ActiveModel::Callbacks
        define_model_callbacks :create, :save, :update, :destroy
      end

      # Callback Fixes https://raw.githubusercontent.com/locomotivapro/topmodel/33d952c5082245465f9f063a55a743b88df7558d/lib/topmodel/callbacks.rb
      class_eval(<<-EOS, __FILE__, __LINE__ + 1)
        def create_with_callbacks(*args, &block)
          run_callbacks :create do
            # Your create action methods here
            create_without_callbacks(*args, &block)
          end
        end
        alias_method_chain(:create, :callbacks)

        def save_with_callbacks(*args, &block)
          run_callbacks :save do
            # Your save action methods here
            save_without_callbacks(*args, &block)
          end
        end
        alias_method_chain(:save, :callbacks)

        def update_with_callbacks(*args, &block)
          run_callbacks :update do
            # Your update action methods here
            update_without_callbacks(*args, &block)
          end
        end
        alias_method_chain(:update, :callbacks)

        def destroy_with_callbacks(*args, &block)
          run_callbacks :destroy do
            # Your destroy action methods here
            destroy_without_callbacks(*args, &block)
          end
        end
        alias_method_chain(:destroy, :callbacks)
      EOS
      
    end
  end
end