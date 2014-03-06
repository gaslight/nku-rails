require 'spec_helper'

feature "Creating assignments" do
  let(:new_assignment_page) { NewAssignmentPage.new }
  let(:new_assignment) { build(:assignment, student: student) }

  context "as an admin" do
    let!(:admin) { create(:admin) }
    let!(:student) { create(:student) }
    before { sign_in admin }
    scenario do
      sign_in admin
      new_assignment_page.visit_page
      new_assignment_page.fill_form(new_assignment)
      new_assignment_page.submit
      expect(new_assignment_page).to be_successful
      expect(Assignment.last.student).to eq(student)
    end
  end

  context "as a non-admin" do
    let(:flash_section) { FlashSection.new }
    let!(:student) { create(:student) }
    before { sign_in student }
    scenario do
      new_assignment_page.visit_page
      expect(flash_section).to have_message("Unauthorized")
    end
  end
end
