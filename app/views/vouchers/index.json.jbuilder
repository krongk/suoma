json.array!(@vouchers) do |voucher|
  json.extract! voucher, :id, :traveller_group_id, :price, :image
  json.url voucher_url(voucher, format: :json)
end
