class Admin::TeachersController < Admin::MainController

	before_action :find_teacher, only: %i[edit update destroy]

	def index
		@teachers = Teacher.all
		respond_to do |format|
			format.turbo_stream {
				render turbo_stream: turbo_stream.update('main', template: 'admin/teachers/index')
			}
		end
	end

	def new
		@teacher = Teacher.new
	end

	def create
		@teacher = Teacher.new(teacher_params)
		if params[:course_ids]
			courses = params[:course_ids].map {|x| x.to_i}
			@teacher.course_ids = courses
		else
			flash[:notice] = "Select experties"
			render :new and return
		end
		if @teacher.save
			UserMailer.teacher_welcome_email(@teacher).deliver
			redirect_to admin_path
			flash[:notice] = "Teacher created successfully"
		else
			render :new
			flash[:notice] = "Teacher not create"
		end
	end
	
	def edit;	end

	def update
    @teacher.course_ids = params[:course_ids]
		if @teacher.update(teacher_params)
			redirect_to admin_path
			flash[:notice] = "Teacher updated successfully"
		else
			render :edit, status: :unprocessable_entity
			flash[:alert] = "Teacher not update"
		end
	end

	def destroy
		if @teacher.destroy
			redirect_to admin_teachers_path, status: :see_other
			flash[:notice] = "Teacher deleted successfully"
		else
			redirect_to admin_teachers_path, status: :see_other
			flash[:alert] = "Teacher not delete"
		end
	end

	def search
		if params[:search].blank?
		  redirect_to admin_teachers_path and return
		else
		  @parameter = params[:search].downcase
		  @results = Teacher.all.where("lower(first_name) LIKE :search OR lower(last_name) LIKE :search OR lower(email) LIKE :search", search: "%#{@parameter}%")
		end
	end

	protected

	def teacher_params
		params.require(:teacher).permit(:email, :password, :first_name, :last_name, :Date_of_Birth)
	end
	def find_teacher
		@teacher = Teacher.find(params[:id])
	end
end
