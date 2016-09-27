class Client < ApplicationRecord
  has_many :locations, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, uniqueness: true
end
