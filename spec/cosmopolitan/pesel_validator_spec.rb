# frozen_string_literal: true

RSpec.describe Cosmopolitan::PeselValidator do
  it 'version is equal to 0.1.0' do
    expect(Cosmopolitan::PeselValidator::VERSION).to eq('0.1.0')
  end

  describe '#check_digit?' do
    subject { described_class.check_digit?(value) }

    context 'when provided value is of integer type' do
      let(:value) { 1234567891 }

      it 'returns check digit in integer type for provided PESEL value' do
        expect(subject).to eq(1)
      end
    end

    context 'when provided value is of string type' do
      let(:value) { '1234567891' }

      it 'returns check digit in string type for provided PESEL value' do
        expect(subject).to eq('1')
      end
    end
  end
end
