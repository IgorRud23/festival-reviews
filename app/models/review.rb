class Review < ActiveRecord::Base
belongs_to :user
belongs_to :festival

validates :content, :presence => true 
end
