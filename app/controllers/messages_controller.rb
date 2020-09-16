class MessagesController < ApplicationController
  def new
    @message = Message.new
   end

  def create
    message = Message.new(message_params)
    if message.save
      redirect_to messages_path, notice: "お知らせを投稿しました。"
    else
      render "new"
    end
  end

  def index
    @messages = Message.page(params[:page]).reverse_order.limit(10)
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    message = Message.find(params[:id])
    message.update(message_params)
    redirect_to message_path(message), notice: "お知らせを編集しました。"
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to messages_path, notice: "お知らせを削除しました。"
  end

  private

  def message_params
    params.require(:message).permit(:title, :body)
  end
end
