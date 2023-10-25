class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  validates_presence_of :first_name, :last_name, :email, :password
end
