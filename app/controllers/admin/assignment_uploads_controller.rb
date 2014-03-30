class Admin::AssignmentUploadsController < ApplicationController
  before_filter :require_administrator

  def create
    import = AssignmentImport.new(params[:file])
    import.run
    redirect_to admin_assignments_path, notice: "Created #{import.created_count} new assignments"
  end
end
