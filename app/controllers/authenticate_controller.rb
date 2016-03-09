class AuthenticateController < ApplicationController
  def login
    if request.post?
      teacher = Teacher.find_by(email: params[:email])
      if teacher && teacher.authenticate(params[:password])
        session[:teacher_id] = teacher.id
        redirect_to teachers_path, notice: "Login Successful."
      else
        flash[:notice] = "You Must Be a Teacher At Hogwarts to Login!"
      end
    end
  end

  def logout
    session[:teacher_id] = nil
    redirect_to authenticate_login_path, notice: "Logged out successfully."
  end
end
