# frozen_string_literal: true

require_relative 'errors/invalid_value_error'

module Cosmopolitan
  module PeselValidator
    class ValidateValueFormat
      def initialize(value)
        @value = value
      end

      def call
        raise InvalidValueError, 'Value must be of a type integer or string' unless value.is_a?(Integer) || value.is_a?(String)
        raise InvalidValueError, 'Value length must be equal to 11 characters' unless value.to_s.split('').length == 11
        raise InvalidValueError, 'Value must contain only digits' if value.is_a?(String) && value.count("a-zA-Z") > 0
      end

      private

      attr_reader :value
    end
  end
end
