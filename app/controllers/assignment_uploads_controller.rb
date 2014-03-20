class AssignmentUploadsController < ApplicationController
  def create
    result = AssignmentImporter.import(params[:file])
    redirect_to assignments_path, notice: "Created #{result.created_count} new assignments"
  end
end
