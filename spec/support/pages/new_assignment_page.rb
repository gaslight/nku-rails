class NewAssignmentPage
  include Capybara::DSL

  def visit_page
    visit "/assignments/new"
  end

  def fill_form(assignment)
    select assignment.student.name
    fill_in "Name", with: assignment.name
    fill_in "Score", with: assignment.score
    fill_in "Total", with: assignment.total
  end

  def submit
    click_button "Create assignment"
  end

  def successful?
    has_content? "Assignment created"
  end
end
