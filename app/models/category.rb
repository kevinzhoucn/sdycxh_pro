class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :sub_categories
  has_many :articles

  def self.get_map 
    category_map ||= []

    Category.all.each do |cat|
      sub_map = {}
      sub_map << [cat.id, cat.name]
      cat.sub_categories.each do |sub|

      end
    end
  end

  def pub_articles
    self.articles.where( published: true)
  end
end
