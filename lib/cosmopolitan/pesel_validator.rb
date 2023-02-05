# frozen_string_literal: true

require_relative 'pesel_validator/check_digit'
require_relative 'pesel_validator/version'

module Cosmopolitan
  module PeselValidator
    def self.check_digit?(value)
      CheckDigit.new(value).call
    end
  end
end
