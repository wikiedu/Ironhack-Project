class Location < ApplicationRecord
  belongs_to :client
  has_many :expeditions

  validates :name, uniqueness: true, presence: true
  validates :direction, presence: true
  validates :client_id, presence: true


end
