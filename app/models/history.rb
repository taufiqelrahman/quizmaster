class History < ActiveRecord::Base
  belongs_to :user
  belongs_to :question_set
  has_many :results,  dependent: :destroy 
end
