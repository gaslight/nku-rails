require 'spec_helper'

describe AssignmentImport do
  let(:file) { Pathname.new("spec/fixtures/assignments.csv") }

  describe "#import" do
    it "creates assignments and students for each row" do
      AssignmentImport.new(file).run

      expect(Assignment.count).to eq(2)
      first_assignment = Assignment.first
      expect(first_assignment.student.email).to eq("test1@example.com")
      expect(first_assignment.total).to eq(15)
      expect(first_assignment.score).to eq(8)
    end

    it "dosen't create duplicate assignments" do
      2.times { AssignmentImport.new(file).run }

      expect(Assignment.count).to eq(2)
    end

    context "when one record is updated and one is created" do
      let!(:student) { create(:student, email: "test1@example.com") }
      let!(:assignment) { create(:assignment, student: student, name: "assignment1") }

      it "keeps track of the number of records created" do
        import = AssignmentImport.new(file)
        import.run
        expect(import.created_count).to eq(1)
      end
    end
  end
end

