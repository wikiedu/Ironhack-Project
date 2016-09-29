class Expedition < ApplicationRecord
    belongs_to :origin_location, class_name: Location, foreign_key: :origin_location_id
    belongs_to :destination_location, class_name: Location, foreign_key: :destination_location_id
    belongs_to :client
end
