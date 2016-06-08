class History < ActiveRecord::Base
  belongs_to :user
  belongs_to :question_set
end
