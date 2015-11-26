json.array!(@guides) do |guide|
  json.extract! guide, :id, :name, :mobile, :license_number, :qq, :wechat, :is_published
  json.url guide_url(guide, format: :json)
end
