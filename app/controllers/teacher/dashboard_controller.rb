class Teacher::DashboardController < ApplicationController
	before_action :authenticate_teacher!
	layout 'teacher'
	def index; end

	def edit
		@teacher = Teacher.find(params[:id])
	end

	def update
		@teacher = Teacher.find(params[:id])
		if @teacher.update(profile_params)
			sign_in @teacher, bypass: true
			redirect_to teacher_dashboard_index_path
		else
			flash[:notice] = "Profile not update"
			render :edit
		end
	end
	
	def show_teaching_course
		@courses = current_teacher.sections
	end
	def show_history
		@sections = current_teacher.sections
	end
	private

	def profile_params
		params.require(:teacher).permit(:first_name, :last_name, :Date_of_Birth, :email, :password, :image)
	end
end
