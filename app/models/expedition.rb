class Expedition < ApplicationRecord
    belongs_to :origin_location, class_name: Location, foreign_key: :origin_location_id
    belongs_to :destination_location, class_name: Location, foreign_key: :destination_location_id
    belongs_to :client

    STATE_UNDELIVERED ="undelivered"
    STATE_DELIVERED ="delivered"
    STATE_PICKEDUP ="pickedup"
    STATE_DELIVERY ="delivery"
    STATE_CANCELED ="canceled"

end
