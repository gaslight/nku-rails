require "spec_helper"

feature "Viewing my assigments" do
  let(:assignments_index_page) { AssignmentsIndexPage.new }
  let!(:student) { create(:student) }
  let!(:my_assignment) { create(:assignment, student: student, score: 5, total: 10) }
  let!(:not_my_assignment) { create(:assignment, score: 10, total: 10) }

  before { sign_in student }

  scenario do
    assignments_index_page.visit_page
    expect(assignments_index_page).to have_assignment(my_assignment)
    expect(assignments_index_page).to have_no_assignment(not_my_assignment)
    expect(assignments_index_page.total_percentage).to eq("50%")
  end
end
