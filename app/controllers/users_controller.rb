class UsersController < ApplicationController
  def new
    render 'new.html.erb'
  end
  def create
    user = User.new(
        name: params[:name],
        email: params[:email],
        admin: true,
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/'
    else
      flash[:warning] = 'Welp, somethin went wrong'
      redirect_to '/signup'
    end
  end
end
