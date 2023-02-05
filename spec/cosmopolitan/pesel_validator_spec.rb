# frozen_string_literal: true

RSpec.describe Cosmopolitan::PeselValidator do
  it 'returns version equal to 0.1.0' do
    expect(Cosmopolitan::PeselValidator::VERSION).to eq('0.1.0')
  end

  # -----------------------------------------------------------------------------------------------------

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

  # -----------------------------------------------------------------------------------------------------

  describe '#gender?' do
    subject { described_class.gender?(value) }

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
        context 'when gender digit (10th) is even' do
          context 'when gender digit is 0' do
            let(:value) { 12345678906 }

            it 'returns female value' do
              expect(subject).to eq('female')
            end
          end

          context 'when gender digit is 2' do
            let(:value) { 12345678926 }

            it 'returns female value' do
              expect(subject).to eq('female')
            end
          end

          context 'when gender digit is 4' do
            let(:value) { 12345678946 }

            it 'returns female value' do
              expect(subject).to eq('female')
            end
          end

          context 'when gender digit is 6' do
            let(:value) { 12345678966 }

            it 'returns female value' do
              expect(subject).to eq('female')
            end
          end

          context 'when gender digit is 8' do
            let(:value) { 12345678986 }

            it 'returns female value' do
              expect(subject).to eq('female')
            end
          end
        end

        context 'when gender digit (10th) is odd' do
          context 'when gender digit is 1' do
            let(:value) { 12345678916 }

            it 'returns male value' do
              expect(subject).to eq('male')
            end
          end

          context 'when gender digit is 3' do
            let(:value) { 12345678936 }

            it 'returns male value' do
              expect(subject).to eq('male')
            end
          end

          context 'when gender digit is 5' do
            let(:value) { 12345678956 }

            it 'returns male value' do
              expect(subject).to eq('male')
            end
          end

          context 'when gender digit is 7' do
            let(:value) { 12345678976 }

            it 'returns male value' do
              expect(subject).to eq('male')
            end
          end

          context 'when gender digit is 9' do
            let(:value) { 12345678996 }

            it 'returns male value' do
              expect(subject).to eq('male')
            end
          end
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
          context 'when gender digit (10th) is even' do
            context 'when gender digit is 0' do
              let(:value) { '12345678906' }

              it 'returns female value' do
                expect(subject).to eq('female')
              end
            end

            context 'when gender digit is 2' do
              let(:value) { '12345678926' }

              it 'returns female value' do
                expect(subject).to eq('female')
              end
            end

            context 'when gender digit is 4' do
              let(:value) { '12345678946' }

              it 'returns female value' do
                expect(subject).to eq('female')
              end
            end

            context 'when gender digit is 6' do
              let(:value) { '12345678966' }

              it 'returns female value' do
                expect(subject).to eq('female')
              end
            end

            context 'when gender digit is 8' do
              let(:value) { '12345678986' }

              it 'returns female value' do
                expect(subject).to eq('female')
              end
            end
          end

          context 'when gender digit (10th) is odd' do
            context 'when gender digit is 1' do
              let(:value) { '12345678916' }

              it 'returns male value' do
                expect(subject).to eq('male')
              end
            end

            context 'when gender digit is 3' do
              let(:value) { '12345678936' }

              it 'returns male value' do
                expect(subject).to eq('male')
              end
            end

            context 'when gender digit is 5' do
              let(:value) { '12345678956' }

              it 'returns male value' do
                expect(subject).to eq('male')
              end
            end

            context 'when gender digit is 7' do
              let(:value) { '12345678976' }

              it 'returns male value' do
                expect(subject).to eq('male')
              end
            end

            context 'when gender digit is 9' do
              let(:value) { '12345678996' }

              it 'returns male value' do
                expect(subject).to eq('male')
              end
            end
          end
        end
      end
    end
  end

  # -----------------------------------------------------------------------------------------------------

  describe '#checksum?' do
    subject { described_class.checksum?(value) }

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
        let(:value) { 12345678910 }

        it 'returns checksum value in integer type' do
          expect(subject).to eq(220)
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
          let(:value) { '12345678910' }

          it 'returns checksum value in string type' do
            expect(subject).to eq('220')
          end
        end
      end
    end
  end

  # -----------------------------------------------------------------------------------------------------

  describe '#valid?' do
    subject { described_class.valid?(value) }

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
        context 'when modulo10 of sum of value checksum and check digit is not equal to 0' do
          let(:value) { 13345678912 }

          it 'returns false' do
            expect(subject).to eq(false)
          end
        end

        context 'when modulo10 of sum of value checksum and check digit is equal to 0' do
          let(:value) { 13345678917 }

          it 'returns true' do
            expect(subject).to eq(true)
          end
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
          context 'when modulo10 of sum of value checksum and check digit is not equal to 0' do
            let(:value) { '13345678912' }

            it 'returns false' do
              expect(subject).to eq(false)
            end
          end

          context 'when modulo10 of sum of value checksum and check digit is equal to 0' do
            let(:value) { '13345678917' }

            it 'returns true' do
              expect(subject).to eq(true)
            end
          end
        end
      end
    end
  end

  # -----------------------------------------------------------------------------------------------------
end
