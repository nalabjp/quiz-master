require 'rails_helper'

RSpec.describe Answer do
  describe '#correct_with?' do
    subject { Answer.new(value).correct_with?(input) }

    context 'Answer is `1` and Input is `1`' do
      let(:value) { 1 }
      let(:input) { '1' }
      it { is_expected.to be_truthy }
    end

    context 'Answer is `1` and Input is `one`' do
      let(:value) { 1 }
      let(:input) { 'one' }
      it { is_expected.to be_truthy }
    end

    context 'Answer is `one` and Input is `1`' do
      let(:value) { 'one' }
      let(:input) { '1' }
      it { is_expected.to be_truthy }
    end

    context 'Answer is `one` and Input is `one`' do
      let(:value) { 'one' }
      let(:input) { 'one' }
      it { is_expected.to be_truthy }
    end

    context 'Answer is `21` and Input is `21`' do
      let(:value) { 21 }
      let(:input) { '21' }
      it { is_expected.to be_truthy }
    end

    context 'Answer is `21` and Input is `twenty-one`' do
      let(:value) { 21 }
      let(:input) { 'twenty-one' }
      it { is_expected.to be_truthy }
    end

    context 'Answer is `twenty-one` and Input is `21`' do
      let(:value) { 'twenty-one' }
      let(:input) { '21' }
      it { is_expected.to be_truthy }
    end

    context 'Answer is `twenty-one` and Input is `twenty-one`' do
      let(:value) { 'twenty-one' }
      let(:input) { 'twenty-one' }
      it { is_expected.to be_truthy }
    end

    context 'Answer is `0.21` and Input is `0.21`' do
      let(:value) { 0.21 }
      let(:input) { '0.21' }
      it { is_expected.to be_truthy }
    end

    context 'Answer is `0.21` and Input is `zero point twenty-one`' do
      let(:value) { 0.21 }
      let(:input) { 'zero point twenty-one' }
      it { is_expected.to be_truthy }
    end

    context 'Answer is `0.21` and Input is `zero point two one`' do
      let(:value) { 0.21 }
      let(:input) { 'zero point two one' }
      it { is_expected.to be_truthy }
    end

    context 'Answer is `zero point twenty-one` and Input is `0.21`' do
      let(:value) { 'zero point twenty-one' }
      let(:input) { '0.21' }
      it { is_expected.to be_truthy }
    end

    context 'Answer is `zero point twenty-one` and Input is `zero point twenty-one`' do
      let(:value) { 'zero point twenty-one' }
      let(:input) { 'zero point twenty-one' }
      it { is_expected.to be_truthy }
    end

    context 'Answer is `zero point two one` and Input is `21`' do
      let(:value) { 'zero point two one' }
      let(:input) { '0.21' }
      it { is_expected.to be_truthy }
    end

    context 'Answer is `zero point two one` and Input is `zero point two one`' do
      let(:value) { 'zero point two one' }
      let(:input) { 'zero point two one' }
      it { is_expected.to be_truthy }
    end

    context 'Answer is `foo` and Input is `foo`' do
      let(:value) { 'foo' }
      let(:input) { 'foo' }
      it { is_expected.to be_truthy }
    end

    context 'Answer is `foo` and Input is `bar`' do
      let(:value) { 'foo' }
      let(:input) { 'bar' }
      it { is_expected.to be_falsey }
    end
  end
end
