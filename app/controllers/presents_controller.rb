class PresentsController < ApplicationController
  before_action :set_key, only: :show

  def index
    @text = 'today is whiteday!'
  end

  def show
    @url = Settings.starbucks[@key]
  end

  def send_code
    if params[:code].present?
      redirect_to present_path(params[:code])
    else
      redirect_to presents_path, alert: 'コードを入力してください'
    end
  end

  private

  def set_key
    @key = params[:id].to_sym
  end
end
