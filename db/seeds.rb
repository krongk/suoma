# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

#1. truncate table sql:
  # truncate table travellers;
  # delete from traveller_groups where true;
  # truncate table traveller_groups;
  # truncate table guides;
  # delete from agency_contacts where true;
  # truncate table agency_contacts;
  # delete from agencies where true;
  # truncate table agencies;
  # delete from trips where true;
  # truncate table trips;

#2. rake db:sead 

cities = ['成都', '重庆', '北京', '上海', '广州', '深圳', '广西', '昆明', '贵阳', '济南', '西安', '内蒙古']
names = %w{张三 李四 莉丝 王妈 赵妞 宋江 张思 王思聪 王健林 马云 马化腾 周杰伦 刘德华 刘若英 王力宏 高晓松 老狼}
mobiles = []
100.times do 
  mobiles << ('1' + rand(9438343099).to_s).ljust(11,'0')
end

def get_name(names)
  begin
    name = "#{names[rand(15)]}#{SecureRandom.random_number(1000)}"
  end while Traveller.exists?(name: name) || AgencyContact.exists?(name: name) || Guide.exists?(name: name)
  return name
end

def get_mobile
  begin
    mobile = "1#{(rand().to_s)[2..11]}"
  end while Traveller.exists?(:mobile => mobile) || AgencyContact.exists?(mobile: mobile) || Guide.exists?(mobile: mobile)
  return mobile
end


20.times do |i|
  Trip.find_or_create_by(name: "#{cities[rand(12)]}#{rand(40)}日游全程无自费，含吃住酒店门票")

  agc = Agency.find_or_create_by(name: "#{cities[rand(12)]}门市部")
  agc.address = "#{cities[rand(12)]}某市区某街道#{i + rand(200)}号"
  agc.save

  agc.agency_contacts.build(name: get_name(names), mobile: get_mobile, is_admin: true)
  agc.save

  Guide.create(name: get_name(names), mobile: get_mobile, license_number: 'D-' + rand(9333333).to_s)
  puts i
end

cell_price = 500.0

500.times do |i|
  d = Date.today
  tavellers_count = rand(5) + 1
  price_receivable = tavellers_count * cell_price
  price_received = rand(tavellers_count) * cell_price
  tg = TravellerGroup.create(
    trip_id: Trip.all.map(&:id)[rand(Trip.all.size)], 
    agency_contact_id: AgencyContact.all.map(&:id)[rand(AgencyContact.all.size)], 
    trav_date: d + (rand(10)+1).days,
    price_receivable: price_receivable,
    price_received: price_received
  )
  if(rand(10)%4 == 2)
    tg.price_received = nil
    tg.price_for_sb = price_receivable - price_received
    tg.save
  end
  tg = tg.reload

  tavellers_count.times do
    Traveller.create(
      traveller_group_id: tg.id,
      name: get_name(names),
      mobile: get_mobile,
      id_card: (rand().to_s + rand().to_s).gsub(/[^0-9]/, '')
    )
  end
  puts tg.id
end

