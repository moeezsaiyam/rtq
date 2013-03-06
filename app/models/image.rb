class Image < ActiveRecord::Base

  has_attached_file :photo,
                    :styles => {  :medium => ["660x307#",:jpg],
                                  :small =>["100x100#",:jpg],
                               },
                    :default_style => :medium,
                    :url  => "/assets/slider/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/slider/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  validates_presence_of :photo

end
