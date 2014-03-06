require "spec_helper"

feature "Viewing my assigments" do
  let(:assignments_index_page) { AssignmentsIndexPage.new }
  let!(:student) { create(:student) }
  let!(:assignment) { create(:assignment, student: student) }

  before { sign_in student }

  scenario do
    assignments_index_page.visit_page
    expect(assignments_index_page).to have_assignment(assignment)
  end
end
