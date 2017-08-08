class SessionsController < ApplicationController
  def new
    render 'new.html.erb'
  end
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      @carted_food  = CartedFood.create!(
          quantity: session[:carted_food_info][:quantity],
          food_item_id: session[:carted_food_info][:food_item_id],
          status: session[:carted_food_info][:status],
          user_id: user.id
        )
      session[:carted_food_info]
      flash[:success] = 'Successfully logged in!'
      redirect_to '/'
    else
      flash[:warning] = 'Uh oh, something went wrong'
      redirect_to '/login'
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/login'
  end
end
