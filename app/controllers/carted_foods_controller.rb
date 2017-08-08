class CartedFoodsController < ApplicationController
  before_action :authenticate_user!, except: [:create]

  def index
    @carted_foods = current_user.carted_foods.where(status: 'carted')
    if @carted_foods.length > 0
      render 'index.html.erb'
    else
      flash[:warning] = 'You may wanna put something, like, IN the cart'
      redirect_to '/'
    end
  end
  def create
    if current_user
      @carted_food = CartedFood.create(
        quantity: params[:quantity],
        food_item_id: params[:food_item_id],
        user_id: '',
        status: 'carted'
      )
      redirect_to '/yourshoppingcart'
    else
      session[:carted_food_info] = {
        quantity: params[:quantity].to_i,
        food_item_id: params[:food_item_id].to_i,
        status: 'carted'
      }
      redirect_to '/login'
    end
  end
  def destroy
    carted_food = CartedFood.find_by(id: params[:id])
    carted_food.status = 'removed'
    carted_food.save
    flash[:success] = 'Got rid of that for ya!'
    redirect_to '/yourshoppingcart'
  end
end
