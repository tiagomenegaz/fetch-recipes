require 'rails_helper'

RSpec.describe Tags::Creator, type: :model do
  subject { described_class }

  describe '#call' do
    context 'with all required fields' do
      it "changes tag count by 1" do
        service = subject.new(fields: { name: 'name' })
        expect { service.call }.to change { Tag.count }.by(1)
      end
    end

    context 'with missing required fields' do
      it "raises error" do
        service = subject.new(fields: { })
        expect { service.call }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank")
      end
    end
  end
end
