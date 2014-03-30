require 'spec_helper'

describe AssignmentImporter do
  let(:file) { Pathname.new("spec/fixtures/assignments.csv") }

  describe "#import" do
    it "creates assignments and students for each row" do
      AssignmentImporter.new(file).import

      expect(Assignment.count).to eq(2)
      first_assignment = Assignment.first
      expect(first_assignment.student.email).to eq("test1@example.com")
      expect(first_assignment.total).to eq(15)
      expect(first_assignment.score).to eq(8)
    end

    it "dosen't create duplicate assignments" do
      2.times { AssignmentImporter.new(file).import }

      expect(Assignment.count).to eq(2)
    end
  end
end

