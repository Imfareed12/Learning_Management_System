class Admin::EnrollmentsController < Admin::MainController

	before_action :find_enrollment, only: %i[edit update destroy]

	def index
		@enrollments = Enrollment.all
		respond_to do |format|
			format.turbo_stream {
				render turbo_stream: turbo_stream.update('main', template: 'admin/enrollments/index')
			}
		end
	end
	def new
		@enrollment = Enrollment.new
	end
	def create
		semester_id = Section.find(params[:enrollment][:section_id]).semester_id
		@enrollment = Enrollment.new(enrollment_params)
		@enrollment.semester_id = semester_id
		if @enrollment.save
			redirect_to admin_enrollments_path
			flash[:notice] = "Enrollment created successfully"
		else
			render :new
			flash[:notice] = "Enrollment not create check the logs."
		end
	end
	def edit;	end

	def update
		semester_id = Section.find(params[:enrollment][:section_id]).semester_id
		@enrollment.semester_id = semester_id
		if @enrollment.update(enrollment_params)
			redirect_to admin_enrollments_path
			flash[:notice] = "Enrollment updated successfully."
		else
			render :edit, status: :unprocessable_entity
			flash[:alert] = "Enrollment not update."
		end
	end

	def destroy
		if @enrollment.destroy
			redirect_to admin_enrollments_path, status: :see_other
			flash[:notice] = "Enrollment deleted successfully."
		else
			redirect_to admin_enrollments_path, status: :see_other
			flash[:alert] = "Enrollment not delete."
		end
	end

	private
	
	def enrollment_params
		params.require(:enrollment).permit(:student_id,:section_id,:grade_id)
	end
	def find_enrollment
		@enrollment = Enrollment.find(params[:id])
	end
end
