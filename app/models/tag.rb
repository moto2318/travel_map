class Tag < ApplicationRecord
  has_many :map_tags, dependent: :destroy
  has_many :maps, through: :map_tags

  validates :name, presence:true, length:{maximum:50}

  scope :tag, -> name {
    where('name like ?', "%#{name}%")
  }

end
