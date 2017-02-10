require 'rails_helper'

RSpec.describe Question, type: :model do
  describe '#correct_answer?' do
    subject { build_stubbed(:question).correct_answer?('one') }
    before { expect_any_instance_of(Answer).to receive(:correct_with?).with('one') }
    it { is_expected }
  end
end
