class PresentsController < ApplicationController
  before_action :set_key, only: :show

  def index
    @text = 'today is whiteday!'
  end

  def show
    @url = Rails.application.secrets.urls[@key]
  end

  def send_code
    @present = Present.new(params[:code])
    flash[:alert] = @present.message
    if @present.message == Rails.application.secrets.message
      redirect_to present_path(@present.code)
    else
      redirect_to presents_path
    end
  end

  private

  def set_key
    @key = params[:id].to_sym
  end
end
