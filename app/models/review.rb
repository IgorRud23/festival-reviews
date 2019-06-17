class Review < ActiveRecord::Base
belongs_to :user
belongs_to :festival

validates_length_of :content, minimum: 3, maximum: 300, allow_blank: true
end
