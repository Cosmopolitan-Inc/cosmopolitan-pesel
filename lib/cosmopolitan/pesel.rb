# frozen_string_literal: true

require_relative 'pesel/check_digit'
require_relative 'pesel/checksum'
require_relative 'pesel/gender'
require_relative 'pesel/validate'
require_relative 'pesel/validate_value_format'
require_relative 'pesel/version'

module Cosmopolitan
  module Pesel
    def self.check_digit?(value)
      ValidateValueFormat.new(value).call
      CheckDigit.new(value).call
    end

    def self.checksum?(value)
      ValidateValueFormat.new(value).call
      Checksum.new(value).call
    end

    def self.gender?(value)
      ValidateValueFormat.new(value).call
      Gender.new(value).call
    end

    def self.valid?(value)
      ValidateValueFormat.new(value).call
      Validate.new(value).call
    end
  end
end
