class Record < ActiveRecord::Base
  attr_accessible :contact_ID, :contact_email, :contact_mobile, :contact_name, :corp_address, :corp_desk, :corp_fax, :corp_name, :corp_website, :summary, :avatar

  validates_presence_of :contact_name, :contact_mobile, :corp_desk, :corp_name
  default_scope :order => "created_at DESC"

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "90x60>" }, 
                    :default_url => "/images/:style/missing.png", :whiny => false,
                    :url => "/uploadfiles/:class/:attachment/:id_partition/:basename_:style.:extension",
                    :path => ":rails_root/public/uploadfiles/:class/:attachment/:id_partition/:basename_:style.:extension"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :avatar, :less_than => 2.megabytes

  private  
    def random_file_name
      if avatar_file_name
        if File.extname(avatar_file_name).present?
          extension = File.extname(avatar_file_name).downcase
          self.avatar.instance_write(:file_name, "#{Time.now.strftime("%Y%m%d%H%M%S")}#{rand(1000)}#{extension}")
        end
      end
    end
end
