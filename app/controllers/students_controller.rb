class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
    render :index
  end

  def show
    @student = Student.find(params[:id])
    @status = ""
    if @student.active == false
      @status = 'inactive.'
    else
      @status = 'active.'
    end
    render :show
  end

  def activate
    @student = Student.find(params[:id])
    if @student.active == false
      @student.active = true
    else
      @student.active = false
    end
    @student.save
    redirect_to "/students/#{@student.id}"
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
