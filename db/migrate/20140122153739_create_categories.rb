class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
    Category.create(name: '协会介绍')
    Category.create(name: '政策法规')
    Category.create(name: '会员名录')
    Category.create(name: '动态资讯')
    Category.create(name: '剧场信息')
    Category.create(name: '演出票务')
    Category.create(name: '艺术团体')
    Category.create(name: '联系我们')
  end
end
