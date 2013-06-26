class Batch < ActiveRecord::Base
    
  belongs_to :cloth
  attr_accessible :description, :reference, :state, :cloth_id, :quality
  
  def quality
    return self.state/self.reference!=0 ? self.state/self.reference : -1
  end
  
end
