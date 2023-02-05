# frozen_string_literal: true

require_relative 'pesel_validator/check_digit'
require_relative 'pesel_validator/validate_value_format'
require_relative 'pesel_validator/version'

module Cosmopolitan
  module PeselValidator
    def self.check_digit?(value)
      ValidateValueFormat.new(value).call
      CheckDigit.new(value).call
    end
  end
end
