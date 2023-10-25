class Task < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :description, :user_id, :due_date
  validates :title, length: { minimum: MIN_STRING_LENGTH }
end
