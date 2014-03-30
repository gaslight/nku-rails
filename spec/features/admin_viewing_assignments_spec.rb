require 'spec_helper'

feature "admin viewing assignments" do
  let(:admin_assignments_index_page) { AdminAssignmentsIndexPage.new }
  let!(:assignment) { create(:assignment) }
  let(:admin) { create(:admin) }
  before { sign_in admin }
  scenario do
    admin_assignments_index_page.visit_page
    expect(admin_assignments_index_page).to have_assignment(assignment)
  end
end
