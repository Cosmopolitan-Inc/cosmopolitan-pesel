# frozen_string_literal: true

module Cosmopolitan
  module PeselValidator
    class CheckDigit
      def initialize(value)
        @value = value
      end

      def call
        @value.is_a?(Integer) ? last_digit.to_i : last_digit
      end

      private

      attr_reader :value

      def last_digit
        @value.to_s.split('').last
      end
    end
  end
end
