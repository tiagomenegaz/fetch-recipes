require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject { described_class }

  describe 'validations' do
    context 'with all required fields' do
      let(:params) do
        {
          title: "Recipe Title",
          image: "link/to/image",
          description: "Recipe Description",
        }
      end
      it { expect(subject.new(params).valid?).to be_truthy }
    end

    context 'with missing required fields' do
      it { expect(subject.new.valid?).to be_falsey }
    end
  end
end
