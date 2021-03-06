class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    
    if @order.save
      send_email
      redirect_to order_path(@order)
    else
      redirect_to new_order_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :phone, :contact_method, :message)
  end

  def send_email
    begin
      OrderMailer.order_received(@order).deliver
    rescue StandardError => e
      true
    end
  end
end
