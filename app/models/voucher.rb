#转账凭证，票据，转账短信截图
class Voucher < ActiveRecord::Base
  belongs_to :traveller_group

  has_attached_file :image,
                    :url => "/vouchers/:id/:style.:extension",
                    :path => ":rails_root/public/vouchers/:id/:style.:extension",
                    :styles => { :original => '600x600>'}

  validates_attachment_size :image, :less_than => 8.megabytes
  
  #invalid on LG mobile, why?
  #validates_attachment_presence :image

  #update to version 4.0
  validates_attachment_content_type :image, :content_type => /\Aimage/
end
