class User < ApplicationRecord
  MIN_STRING_LENGTH = 2

  devise :database_authenticatable, :registerable, :validatable

  validates_presence_of :first_name, :last_name, :email, :password
  validates :first_name, :last_name, length: { minimum: MIN_STRING_LENGTH }

  has_one :location
  has_many :tasks

  accepts_nested_attributes_for :location

  def full_name
    "#{first_name} #{last_name}"
  end
end
