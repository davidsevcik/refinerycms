class RecordCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :record, :polymorphic => true
end