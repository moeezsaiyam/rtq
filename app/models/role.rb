class Role < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :name
  validates_presence_of :user_id
  validates_uniqueness_of :name, :scope => [:user_id]
end

