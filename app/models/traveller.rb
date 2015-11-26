class Traveller < ActiveRecord::Base
  belongs_to :traveller_group
  acts_as_taggable
end
