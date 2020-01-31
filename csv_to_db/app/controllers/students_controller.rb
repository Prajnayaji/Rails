class StudentsController < ApplicationController

    def index
        @students = Student.all
    end

    def upload
        csv_path = params[:csv_file]
        StudentWorker.perform_async(csv_path.read)
        #AddStudentJob.perform_later(csv_path.read)
        flash[:notice] = "Students getting added to db"
        redirect_to students_path
    end
end
