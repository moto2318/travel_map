class Tags < ApplicationRecord
  has_many :map_tags, dependent: :destroy
  has_many :maps, through: :map_tags
  
  validates :name, prsence:true, length:{maximum:50}
  
end
