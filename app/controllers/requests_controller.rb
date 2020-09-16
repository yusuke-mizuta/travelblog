class RequestsController < ApplicationController
  def index
    @requests = Request.page(params[:page]).reverse_order.limit(10)
  end

  def new
    @request = Request.new
  end

  def create
    request = Request.new(request_params)
    if request.save
      redirect_to user_path(current_user), notice: "問い合わせを送信しました。"
    else
      render "new"
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  private

  def request_params
    params.require(:request).permit(:title, :body, :admin_status)
  end
end
