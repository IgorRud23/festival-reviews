class Festival < ActiveRecord::Base
has_many :reviews
has_many :users, through: :reviews

validates_length_of :festival_name, minimum: 5, maximum: 35, allow_blank: true
end
