class Map < ApplicationRecord
  belongs_to :customer
  has_many :map_tags, dependent: :destroy
  has_many :tags, through: :map_tags
  
  validates :title, presence: true
  validates :text, presence: true
  
  def save_tags(tag_list) #tagsはコントローラーに書いてあるtag.listのこと
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - tag_list
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = tag_list - current_tags

    # 古いタグを消す
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    # 新しいタグを保存
    new_tags.each do |new_name|
      tag = Tag.find_or_create_by(name:new_name)
      self.tags << tag
    end
  end
end
