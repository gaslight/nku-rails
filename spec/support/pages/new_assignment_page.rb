class NewAssignmentPage
  include Capybara::DSL

  def visit_page
    visit "/assignments/new"
  end

  def enter_grade(grade)
    fill_in "Name", with: grade.name
    fill_in "Score", with: grade.score
    fill_in "Total", with: grade.total
  end

  def submit
    click_button "Create assignment"
  end

  def successful?
    has_content? "Assignment created"
  end
end
