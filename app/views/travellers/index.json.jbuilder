json.array!(@travellers) do |traveller|
  json.extract! traveller, :id, :traveller_group_id, :name, :mobile, :id_card, :is_kid
  json.url traveller_url(traveller, format: :json)
end
