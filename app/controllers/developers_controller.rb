class DevelopersController < ApplicationController
  expose(:developer, attributes: :developer_params)

  def create
    if developer.save
      sign_in developer
      redirect_to root_path
    else
      flash[:alert] = developer.errors.full_messages
      render :new
    end
  end

  private

  def developer_params
    params.require(:developer).permit :password, :password_confirmation, :email, :username
  end
end
