class Present
  include ActiveModel::Model
  attr_accessor :code, :message

  validates :code, presence: true

  def initialize(code)
    @code = code.to_sym
    @message =
      if @code.blank?
        'コードを入力してください'
      elsif Settings.starbucks[@code].blank?
        'コードが間違っています'
      else
        Settings.message
    end
  end

  def set_message
  end
end
