class Charity < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :location, presence: { message: "we need to know where you are located please" }
  # validates :description, allow_nil: true

end
