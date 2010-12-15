class Categorization < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :code]
  has_many :categories

  validates_presence_of :name
  validates_uniqueness_of :code, :allow_blank => true
  
end
