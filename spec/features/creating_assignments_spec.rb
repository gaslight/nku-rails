require 'spec_helper'

feature "Creating assignments" do
  let!(:admin) { create(:admin) }
  let!(:student) { create(:student) }
  let(:new_assignment_page) { NewAssignmentPage.new }
  let(:new_assignment) { build(:assignment, student: student) }

  before { sign_in admin }

  scenario do
    new_assignment_page.visit_page
    new_assignment_page.fill_form(new_assignment)
    new_assignment_page.submit
    expect(new_assignment_page).to be_successful
    expect(Assignment.last.student).to eq(student)
  end
end
