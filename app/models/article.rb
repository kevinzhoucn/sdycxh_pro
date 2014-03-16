class Article < ActiveRecord::Base
  attr_accessible :content, :published, :title, :created_at, :category_id, :sub_category_id, :avatar
  belongs_to :category
  belongs_to :sub_category

  before_save :random_file_name

  default_scope :order => "created_at DESC"
  scope :front, where(:published => true).limit(2)

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "90x60>" }, 
                    :default_url => "/images/:style/missing.png", :whiny => false,
                    :url => "/uploadfiles/:class/:attachment/:id_partition/:basename_:style.:extension",
                    :path => ":rails_root/public/uploadfiles/:class/:attachment/:id_partition/:basename_:style.:extension"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :avatar, :less_than => 2.megabytes

  def self.recent
    Article.where(published: true).limit(20)
  end

  private  
    def random_file_name
      if File.extname(avatar_file_name).present?
        extension = File.extname(avatar_file_name).downcase
        self.avatar.instance_write(:file_name, "#{Time.now.strftime("%Y%m%d%H%M%S")}#{rand(1000)}#{extension}")
      end
    end
end
