class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
      # 登录用户, 然后重定向到用户的资料页面
    else
      # 创建一个错误消息
      flash.now[:danger] = "Invalid email/password combination" #不完全正确
      render 'new'
    end
  end

  def destroy
    # 销毁会话
    log_out
    redirect_to root_url
  end
end
