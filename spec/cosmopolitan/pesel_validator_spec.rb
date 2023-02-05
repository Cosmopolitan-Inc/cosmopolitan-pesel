# frozen_string_literal: true

RSpec.describe Cosmopolitan::PeselValidator do
  it 'returns version equal to 0.1.0' do
    expect(Cosmopolitan::PeselValidator::VERSION).to eq('0.1.0')
  end

  describe '#check_digit?' do
    subject { described_class.check_digit?(value) }

    context 'when value is neither of integer or string type' do
      let(:value) { 12345678910.0 }

      it 'raises InvalidValueError with "Value must be of a type integer or string" message' do
        expect { subject }.to raise_error(InvalidValueError, 'Value must be of a type integer or string')
      end
    end

    context 'when value is of integer type' do
      context 'when value length is not equal to 11 characters' do
        context 'when value length is higher than 11 characters' do
          let(:value) { 1234567891011 }

          it 'raises InvalidValueError with "Value length must be equal to 11 characters" message' do
            expect { subject }.to raise_error(InvalidValueError, 'Value length must be equal to 11 characters')
          end
        end

        context 'when value length is lower than 11 characters' do
          let(:value) { 12345 }

          it 'raises InvalidValueError with "Value length must be equal to 11 characters" message' do
            expect { subject }.to raise_error(InvalidValueError, 'Value length must be equal to 11 characters')
          end
        end
      end

      context 'when value length is equal to 11 characters' do
        let(:value) { 12345678916 }

        it 'returns check digit in integer type for provided PESEL value' do
          expect(subject).to eq(6)
        end
      end
    end

    context 'when value is of string type' do
      context 'when value length is not equal to 11 characters' do
        context 'when value length is higher than 11 characters' do
          let(:value) { '1234567891011' }

          it 'raises InvalidValueError with "Value length must be equal to 11 characters" message' do
            expect { subject }.to raise_error(InvalidValueError, 'Value length must be equal to 11 characters')
          end
        end

        context 'when value length is lower than 11 characters' do
          let(:value) { '12345' }

          it 'raises InvalidValueError with "Value length must be equal to 11 characters" message' do
            expect { subject }.to raise_error(InvalidValueError, 'Value length must be equal to 11 characters')
          end
        end
      end

      context 'when value length is equal to 11 characters' do
        context 'when value contains letters' do
          let(:value) { '12345a78916' }

          it 'raises InvalidValueError with "Value must contain only digits" message' do
            expect { subject }.to raise_error(InvalidValueError, 'Value must contain only digits')
          end
        end

        context 'when value contains only digits' do
          let(:value) { '12345678916' }

          it 'returns check digit in string type for provided PESEL value' do
            expect(subject).to eq('6')
          end
        end
      end
    end
  end
end
