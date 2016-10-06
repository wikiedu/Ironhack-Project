class Expedition < ApplicationRecord
    belongs_to :origin_location, class_name: Location, foreign_key: :origin_location_id
    belongs_to :destination_location, class_name: Location, foreign_key: :destination_location_id
    belongs_to :client

    validates :origin_location_id, presence: true
    validates :destination_location_id, presence: true
    validates :weight, numericality: {less_than: 25}
    validates :state, presence: true
    validates :date, presence: true

    STATE_UNDELIVERED ="undelivered"
    STATE_DELIVERED ="delivered"
    STATE_PICKEDUP ="picked_up"
    STATE_DELIVERY ="delivery"
    STATE_CANCELED ="canceled"

    before_validation :default_values

    def default_values
      self.state ||= STATE_UNDELIVERED
    end

end
