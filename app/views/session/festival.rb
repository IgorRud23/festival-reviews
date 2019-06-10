class Festival < ActiveRecord::Base
has_many :reviews
has_many :users, through: :reviews

validates :content, :presence => true 
end
