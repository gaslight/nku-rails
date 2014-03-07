require 'spec_helper'

describe Assignment do
  describe "#percentage" do
    let(:assignment) { create(:assignment, score: 5, total: 10)}
    specify do
      expect(assignment.percentage).to eq(50)
    end
  end

  describe ".average" do
    let!(:assignment1) { create(:assignment, score: 4, total: 10)}
    let!(:assignment2) { create(:assignment, score: 8, total: 10)}
    specify do
      expect(Assignment.average_percentage).to eq(60)
    end
  end
end
