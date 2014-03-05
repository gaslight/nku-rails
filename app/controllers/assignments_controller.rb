class AssignmentsController < ApplicationController
  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.create!(assignment_params)
    if @assignment.save
      redirect_to root_path, notice: "Assignment created"
    else
      render :new
    end
  end

  private

  def assignment_params
    params.require(:assignment).permit!
  end
end
