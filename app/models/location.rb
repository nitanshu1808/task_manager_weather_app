class Location < ApplicationRecord
  belongs_to :user

  validates :name, length: { minimum: MIN_STRING_LENGTH }
  validates_presence_of :name
end
