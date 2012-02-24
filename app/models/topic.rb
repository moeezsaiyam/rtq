class Topic < ActiveRecord::Base

  has_many :sub_topics, :dependent => :destroy

  before_save :name_to_slug

  has_attached_file :photo,:styles => { :small => "100x80>" }, :url => "/assets/topics/:attachment/:id/:style/:basename.:extension", :default_url => '/images/class-img.png'

  define_index do
    indexes name
    indexes meaning
    indexes description
  end

  def name_to_slug
    self.name_slug = self.name.to_slug
  end

end
