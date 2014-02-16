class Article < ActiveRecord::Base
  attr_accessible :content, :published, :title, :created_at, :category_id, :sub_category_id
  belongs_to :category
  belongs_to :sub_category

  default_scope :order => "created_at DESC"

  def self.recent
    Article.where(published: true).limit(20)
  end
end
