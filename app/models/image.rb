class Image < ActiveRecord::Base

  before_save :check_the_link

  LINK_REGEX = /http[s]*/
  has_attached_file :photo,
                    :styles => {  :medium => ["660x307!",:jpg],
                                  :small =>["100x100#",:jpg],
                               },
                    :default_style => :medium,
                    :url  => "/assets/slider/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/slider/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  validates_presence_of :photo
  attr_accessible :url

  def check_the_link
    unless self.url.match(LINK_REGEX)
      self.url = "https://" + self.url
    end
  end

end
