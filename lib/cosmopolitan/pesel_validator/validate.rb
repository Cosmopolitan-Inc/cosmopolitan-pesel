# frozen_string_literal: true

module Cosmopolitan
  module PeselValidator
    class Validate
      def initialize(value)
        @value = value
      end

      def call
        return true if (checksum + check_digit) % 10 == 0
        false
      end

      private

      attr_reader :value

      def checksum
        Checksum.new(value.to_i).call
      end

      def check_digit
        CheckDigit.new(value.to_i).call
      end
    end
  end
end
