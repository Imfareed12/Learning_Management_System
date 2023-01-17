class Teacher::DashboardController < ApplicationController
    before_action :authenticate_teacher!

    def index; end
    
    def show_course
        @courses = current_teacher.sections
    end
    def show_section
        @sections = current_teacher.sections
    end
end
