class Image < ActiveRecord::Base

  before_save :check_the_link
  before_save :position_check
  LINK_REGEX = /http[s]*/
  has_attached_file :photo,
                    :styles => {  :medium => ["660x307!",:jpg],
                               },
                    :default_style => :medium,
                    :url  => "/images/slider/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/images/slider/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  validates_presence_of :photo, :url, :position

  named_scope :ordered, :order => 'position ASC'

  def check_the_link
    unless self.url.match(LINK_REGEX)
      self.url = "https://" + self.url if self.url.present?
      self.url = "#" unless self.url.present?
    end
  end
  def position_check
    if self.position.blank?
      self.position = Image.maximum("position").to_i + 1 if Image.maximum("position").to_i > 0
    end

  end

end
