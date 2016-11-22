class User < ActiveRecord::Base
  has_many :player1s, :class_name => "Match"
  has_many :player2s, :class_name => "Match"
  has_many :winners, :class_name => "Match"

  validates :first_name, :last_name, presence: true, length: {minimum: 2}
  validates :pin, numericality: {only_integer: true, greater_than: 999, less_than: 10000}
end
