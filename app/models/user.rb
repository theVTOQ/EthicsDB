class User < ActiveRecord::Base
  has_secure_password
  has_many :user_ethical_arguments
  has_many :ethical_arguments, through: :user_ethical_arguments
end
