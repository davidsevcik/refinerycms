class Category < ActiveRecord::Base

  belongs_to :categorization
  acts_as_nested_set

  validates_presence_of :name
  validates_uniqueness_of :code, :allow_blank => true
end