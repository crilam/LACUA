class Batch < ActiveRecord::Base
    
  scope :broken, where("quality <= ?", 0.6)
  
  belongs_to :cloth
  attr_accessible :description, :reference, :state, :cloth_id, :quality
  
  after_save do |model| 
    value = model.state/model.reference
    if value != model.quality.to_f
      model.update_attribute(:quality, value)
    end
  end

end
