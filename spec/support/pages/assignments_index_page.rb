class AssignmentsIndexPage
  include Capybara::DSL

  def visit_page
    visit "/assignments"
  end

  def has_assignment?(assignment)
    has_css?("#assignment_#{assignment.id}")
  end
end
