json.array!(@traveller_groups) do |traveller_group|
  json.extract! traveller_group, :id, :trip_id, :agency_contact_id, :trav_date, :price_receivable, :price_received, :price_for_sb
  json.url traveller_group_url(traveller_group, format: :json)
end
