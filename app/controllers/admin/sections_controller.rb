class Admin::SectionsController < Admin::MainController

	before_action :find_section, only: %i[edit update destroy]

	def index
		@sections = Section.all
		respond_to do |format|
			format.turbo_stream {
				render turbo_stream: turbo_stream.update('main', template: 'admin/sections/index')
			}
		end
	end
	
	def new
		@section = Section.new
	end

	def create
		@section = Section.new(section_params)
		if @section.save
			redirect_to admin_sections_path
			flash[:notice] = "Section created successfully"
		else
			render :new, status: :unprocessable_entity
			flash[:alert] = "Section not create"
		end
	end

	def edit;	end

	def update
		if @section.update(section_params)
			redirect_to admin_sections_path
			flash[:notice] = "Section updated successfully"
		else
			render :edit, status: :unprocessable_entity
			flash[:alert] = "Section not update"
		end
	end

	def destroy
		if @section.destroy
			redirect_to admin_sections_path, status: :see_other
			flash[:notice] = "Section deleted successfully"
		else
			redirect_to admin_sections_path, status: :see_other
			flash[:alert] = "Section not delete"
		end
	end

	private
	def section_params
		params.require(:section).permit(:course_id,:teacher_id,:semester_id,:section_name)
	end
	def find_section
		@section = Section.find(params[:id])
	end
end
