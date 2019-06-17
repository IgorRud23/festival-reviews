class Festival < ActiveRecord::Base
belongs_to :user
has_many :reviews
has_many :users, through: :reviews

validates_length_of :festival_name, minimum: 3, maximum: 35, allow_blank: true
end
