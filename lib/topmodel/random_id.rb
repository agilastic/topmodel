module TopModel
  module RandomID
    protected
      def generate_id
        #ActiveSupport::SecureRandom.hex(13)
        SecureRandom.hex(13)
      end
  end
end