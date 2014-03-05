require 'spec_helper'

feature "Creating assignments" do
  let(:admin) { create(:admin) }
  let(:student) { create(:student) }
  let(:new_assignment_page) { NewAssignmentPage.new }
  let(:new_assignment) { build(:assignment) }

  before { sign_in admin }

  scenario do
    new_assignment_page.visit_page
    new_assignment_page.enter_grade(new_assignment)
    new_assignment_page.submit
    expect(new_assignment_page).to be_successful
  end
end
