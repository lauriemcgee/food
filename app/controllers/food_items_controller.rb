class FoodItemsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  
  def index
    @current_user = current_user
    @items = FoodItem.all
    render 'index.html.erb'
  end
  
  def new
    @food = FoodItem.new
    render 'new.html.erb'
  end
  
  def create
    food = FoodItem.new(
      name: params[:name],
      description: params[:description],
      category: params[:category],
      price: params[:price]
    )
    if food.save
      render 'create.html.erb'
    else
      flash[:warning] = 'You need to fill out the whole form!'
      render 'new.html.erb'
    end
  end

  def show
    @food = FoodItem.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def edit
    @food = FoodItem.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @food = FoodItem.find_by(id: params[:id])
    if @food.update(
        name: params[:name],
        description: params[:description],
        category: params[:category],
        price: params[:price]
      )
        flash[:success] = 'We did it! We all did it!'
        redirect_to '/food'
    else
      render 'edit.html.erb'
    end
  end
  
  def destroy
    @food = FoodItem.find_by(id: params[:id])
    @food.destroy
    flash[:warning] = 'Ya deleted it alright!'
    redirect_to '/food'
  end
end
