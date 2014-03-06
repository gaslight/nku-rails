require 'spec_helper'

describe Assignment do
  describe "#percentage" do
    let(:assignment) { create(:assignment, score: 5, total: 10)}
    specify do
      expect(assignment.percentage).to eq(50)
    end
  end
end
