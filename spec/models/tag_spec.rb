require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject { described_class }

  describe 'validations' do
    context 'with all required fields' do
      it { expect(subject.new(name: 'name').valid?).to be_truthy }
    end

    context 'with missing required fields' do
      it { expect(subject.new.valid?).to be_falsey }
    end
  end
end
