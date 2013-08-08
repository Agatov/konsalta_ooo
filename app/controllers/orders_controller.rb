class OrdersController < ApplicationController
  def create
    @order = Order.new params[:order]
    if @order.save
      OrderMailer.call_mail(
        {phone: @order.phone, username: @order.username, created_at: get_time(@order.created_at)}
      ).deliver
      render json: {status: :ok}
    else
      render json: {status: :error}
    end
  end
end