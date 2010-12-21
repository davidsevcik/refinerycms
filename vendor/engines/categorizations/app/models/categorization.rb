class Categorization < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :code]
  has_many :categories
  has_many :models, :class_name => "ModelCategorization", :dependent => :delete_all

  validates_presence_of :name
  validates_uniqueness_of :code, :allow_blank => true

  after_save :save_models

  scope :for_model, lambda {|model_name| joins(:models).where('model_categorizations.model_name' => model_name) }


  def models_raw
    @models_raw ||= self.models.map(&:model_name).join("\n")
  end

  def models_raw=(raw)
    @models_raw = raw
  end


protected

  def save_models
    self.models.clear
    @models_raw.split("\n").each do |model_name|
      self.models.create(:model_name => model_name.strip) 
    end
  end
end
