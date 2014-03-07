class AssignmentsController < ApplicationController
  def index
    @assignments = current_student.assignments
  end
end
