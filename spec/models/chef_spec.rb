require 'rails_helper'

RSpec.describe Chef, type: :model do
  subject { described_class }

  describe 'validations' do
    context '#name' do
      context 'with all required fields' do
        it { expect(subject.new(name: 'name').valid?).to be_truthy }
      end

      context 'with missing required fields' do
        it { expect(subject.new.valid?).to be_falsey }
      end
    end

    context 'uniqueness' do
      before do
        subject.create(name: 'Jamie Oliver')
      end

      it { expect(subject.new(name: 'Jamie Oliver').valid?).to be_falsey }
      it { expect(subject.new(name: 'Alex Atala').valid?).to be_truthy }
    end
  end
end
