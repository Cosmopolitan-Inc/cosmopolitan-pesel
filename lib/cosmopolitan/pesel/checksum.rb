# frozen_string_literal: true

module Cosmopolitan
  module Pesel
    class Checksum
      def initialize(value)
        @value = value
      end

      def call
        checksum_value =
          checksum_digits[0] * 1 +
          checksum_digits[1] * 3 +
          checksum_digits[2] * 7 +
          checksum_digits[3] * 9 +
          checksum_digits[4] * 1 +
          checksum_digits[5] * 3 +
          checksum_digits[6] * 7 +
          checksum_digits[7] * 9 +
          checksum_digits[8] * 1 +
          checksum_digits[9] * 3

        value.is_a?(String) ? checksum_value.to_s : checksum_value
      end

      private

      attr_reader :value

      def checksum_digits
        value.to_s.split('').map(&:to_i)[0..9]
      end
    end
  end
end
