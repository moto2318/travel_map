class Map < ApplicationRecord
  belongs_to :customer
  has_many :map_tags, dependent: :destroy
  has_many :tags, through: :map_tags

  validates :title, presence: true
  validates :text, presence: true

  def save_tags(sent_tags, customer_id)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete　Tag.find_by(name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new, customer_id: customer_id)
      self.tags << new_post_tag
   end
  end
  
  scope :has_tag_name_like, -> tag_name {
    joins(:tags).merge(Tags.name_like tag_name)
  }

# 検索方法分岐
  def self.looks(word)
      @map = Map.where("title LIKE?","%#{word}%")
  end




  # def save_tags(tag_list, customer_id) #tagsはコントローラーに書いてあるtag.listのこと
  # # タグが存在していれば、タグの名前を配列として全て取得
  #   #byebug
  #   current_tags = Tag.where(id: self.map_tags.pluck(:tag_id)).pluck(:name) unless self.map_tags.pluck(:tag_id) == []
  #   current_tags = [] if current_tags.nil?
  #   # 現在取得したタグから送られてきたタグを除いてoldtagとする
  #   old_tags = current_tags - tag_list
  #   # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
  #   new_tags = tag_list - current_tags
  #   # 古いタグを消す
  #   old_tags.each do |old_name|
  #     self.tags.delete Tag.find_by(name: old_name)
  #   end
  #   # 新しいタグを保存
  #   new_tags.each do |new_name|
  #     #MapTag.save(map_id: self.id, tag_id: )
  #     #tag = MapTag.new
  #     #tag.name = new_name
  #     #byebug
  #     tag = Tag.find_or_create_by(name: new_name, customer_id: customer_id)
  #     self.tags << tag
  #   end
  # end
end
