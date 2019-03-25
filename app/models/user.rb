class User < ApplicationRecord
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_stocks
  has_many :stocks, through: :user_stocks

  def stock_already_added?(ticker_sysmbol)
    stock = Stock.find_by_ticker(ticker_sysmbol)
    return false unless stock 
    # Verified if the current user is already tracking that stock
    user_stocks.where(stock_id: stock.id).exists?
  end

  def under_stock_limit?
    (user_stocks.count < 10)
  end

  def can_add_stock?(ticker_sysmbol)
    under_stock_limit? && !stock_already_added?(ticker_sysmbol)
  end

end
