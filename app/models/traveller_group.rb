class TravellerGroup < ActiveRecord::Base
  belongs_to :trip
  belongs_to :agency_contact
  has_many :travellers
end
