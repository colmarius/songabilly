require 'active_support/concern'

module JsonLike
  module Document
    extend ActiveSupport::Concern

    included do
      def self.payload_name(name=nil)
        if name
          @payload_name = name.to_sym
        else
          @payload_name ||= :payload
        end
      end

      def self.field(name, options={})
        payload_name = self.payload_name
        self.send(:define_method, name) do
          payload = self.__send__("#{payload_name}")
          payload[name]
        end
        self.send(:define_method, "#{name}=") do |value|
          payload = self.__send__("#{payload_name}")
          payload[name] = value
        end
      end
    end
  end
end
