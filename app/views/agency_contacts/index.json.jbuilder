json.array!(@agency_contacts) do |agency_contact|
  json.extract! agency_contact, :id, :agency_id, :name, :mobile, :is_admin
  json.url agency_contact_url(agency_contact, format: :json)
end
