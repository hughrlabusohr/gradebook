class SessionsController < ApplicationController
  def new
  end

  def create
    teacher = Teacher.find_by_email(params[:email])
    student = Student.find_by_email(params[:email])
    parent = Parent.find_by_email(params[:email])
    if session[:user_type] = "Teacher"
      if teacher && teacher.authenticate(params[:password])
        session[:user_id] = teacher.id
        redirect_to root_path, notice: "You have succesfully logged in!"
      else
        flash.now[:alert] = "Login failed: invalid email or password."
        render "new"
      end
    elsif session[:user_type] = "Student"
      if student && student.authenticate(params[:password])
        session[:user_id] = student.id
        redirect_to root_path, notice: "You have succesfully logged in!"
      else
        flash.now[:alert] = "Login failed: invalid email or password."
        render "new"
      end
    else session[:user_type] = "Parent"
      if parent && parent.authenticate(params[:password])
        session[:user_id] = parent.id
        redirect_to root_path, notice: "You have succesfully logged in!"
      else
        flash.now[:alert] = "Login failed: invalid email or password."
        render "new"
      end
    end

    def destroy
      session[:user_id] = nil
      session[:user_type] = nil
      redirect_to root_path, notice: "You have logged out."
    end
  end
end
