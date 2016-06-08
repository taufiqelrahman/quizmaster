class Question < ActiveRecord::Base
	validates :question, presence: true
	validates :answer, presence: true
	belongs_to :question_set
end
