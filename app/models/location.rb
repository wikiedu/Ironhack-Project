class Location < ApplicationRecord
  belongs_to :client
  has_many :expeditions

  validates :name, uniqueness: true, presence: true
  validates :direction, presence: true
  validates :client_id, presence: true


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
        Location.create! row.to_hash
      end
  end
  
end
