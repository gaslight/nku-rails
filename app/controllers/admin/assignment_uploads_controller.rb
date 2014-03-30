class Admin::AssignmentUploadsController < ApplicationController
  before_filter :require_administrator

  def create
    result = AssignmentImporter.import(params[:file])
    redirect_to admin_assignments_path, notice: "Created #{result.created_count} new assignments"
  end
end
