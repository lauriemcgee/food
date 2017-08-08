class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    order = Order.new(user_id: current_user.id)
    order.save

    carted_foods = current_user.carted_foods.where(status: 'carted')
    carted_foods.update_all(status: 'purchased', order_id: order.id)

    order.calculate_totals

    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def edit
    @order = Order.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @order = Order.find_by(id: params[:id])
    total = @order.total.to_i
    tip_number = params[:tip_number].to_f
    if tip_number > 0
      @tip_total = total * (tip_number / 100)
      final_total = total + @tip_total
      @order.update(
        tip_amount: @tip_total,
        total: final_total
      )
      @order.save
      render 'update.html.erb'
    else
      redirect_to '/'
    end
  end
end
