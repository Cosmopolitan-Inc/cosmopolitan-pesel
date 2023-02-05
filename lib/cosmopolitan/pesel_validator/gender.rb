# frozen_string_literal: true

module Cosmopolitan
  module PeselValidator
    class Gender
      def initialize(value)
        @value = value
      end

      def call
        return 'female' if gender_digit.even?
        'male'
      end

      private

      attr_reader :value

      def gender_digit
        value.to_s.split('')[9].to_i
      end
    end
  end
end
