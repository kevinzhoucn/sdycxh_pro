class SubCategory < ActiveRecord::Base
  attr_accessible :name, :category_id
  has_many :articles

  def pub_articles
    self.articles.where( published: true)
  end
end
