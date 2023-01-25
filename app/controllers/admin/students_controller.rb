class Admin::StudentsController < Admin::MainController
  before_action :find_student, only: %i[edit update destroy]

  def index
    @students = Student.all
    respond_to do |format|
			format.turbo_stream {
				render turbo_stream: turbo_stream.update('main', template: 'admin/students/index')
			}
		end
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.semester_type = params[:semester_type]
    @student.semester_no = params[:semester_no]
    @student.enroll_year = params[:enroll_year]
    if @student.save
      UserMailer.student_welcome_email(@student).deliver
      redirect_to admin_students_path
      flash[:notice] = "Student created successfully"
    else
      render :new
      flash[:alert] = "Student not create"
    end
  end

  def edit;  end

  def update
    @student.semester_type = params[:semester_type]
    @student.semester_no = params[:semester_no]
    @student.enroll_year = params[:enroll_year]
    if @student.update(student_params)
      redirect_to admin_students_path
      flash[:notice] = "Student updated successfully"
    else
      render :edit, status: :unprocessable_entity
      flash[:alert] = "Student not update"
    end
  end

  def destroy
    if @student.destroy
      redirect_to admin_students_path, status: :see_other
      flash[:notice] = "Student deleted successfully"
    else
      redirect_to admin_students_path, status: :see_other
      flash[:alert] = "Student not delete"
    end
  end

  def dashboard; end

  def edit_profile
    @student = Student.find(params[:id])
		@student.update(profile_params)
		redirect_to student_dashboard_index_path
  end

  def search
    if params[:search].blank?
      redirect_to admin_students_path and return
    else
      @parameter = params[:search].downcase
      @results = Student.all.where("lower(first_name) LIKE :search OR lower(last_name) LIKE :search OR lower(email) LIKE :search", search: "%#{@parameter}%")
    end
  end

  protected

  def student_params
    params.require(:student).permit(:email, :password, :first_name, :last_name, :Date_of_Birth, :section, :roll_no, :semester)
  end
  def find_student
    @student = Student.find(params[:id])
  end
end
