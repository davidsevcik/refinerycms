class Category < ActiveRecord::Base

  belongs_to :categorization
  acts_as_nested_set :scope => :categorization
  acts_as_indexed :fields => [:name, :code]

  validates_presence_of :name
  validates_uniqueness_of :code, :allow_blank => true
end