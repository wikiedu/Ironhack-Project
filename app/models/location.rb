class Location < ApplicationRecord
  belongs_to :client

  has_many :origin_expeditions, class_name: Expedition , foreign_key: :origin_location_id
  has_many :destination_expeditions, class_name: Expedition , foreign_key: :destination_location_id

  validates :name, uniqueness: true, presence: true
  validates :direction, presence: true
  validates :client_id, presence: true
  validates :internal_code, uniqueness: true, presence: true


end
