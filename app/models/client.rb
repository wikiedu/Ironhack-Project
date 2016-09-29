class Client < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_many :expeditions 
  belongs_to :user
  validates :name, presence: true, uniqueness: true
end
