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

  def update
    request = Request.find(params[:id])
    request.admin_status = 1
    request.update(request_params_update)
    redirect_to requests_path, notice: "管理者ステータスを更新しました。"
  end

  private
  def request_params
    params.require(:request).permit(:title, :body, :admin_status)
  end

  def request_params_update
    params.permit(:admin_status)
  end
end
