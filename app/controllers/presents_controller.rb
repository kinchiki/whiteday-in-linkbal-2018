class PresentsController < ApplicationController
  def index
    @text = 'today is whiteday!'
  end

  def show
    @present = Present.new(code: params[:id])
  end

  def send_code
    if params[:code].present?
      redirect_to present_path(params[:code])
    else
      redirect_to presents_path, alert: 'コードを入力してください'
    end
  end
end
