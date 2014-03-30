class AssignmentsIndexPage
  include Capybara::DSL

  def visit_page
    visit "/assignments"
  end

  def has_assignment?(assignment)
    has_css?("#assignment_#{assignment.id}")
  end

  def has_no_assignment?(assignment)
    has_no_css?("#assignment_#{assignment.id}")
  end

  def total_percentage
    find(".total__percentage").text
  end
end
