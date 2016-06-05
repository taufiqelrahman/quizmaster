class QuestionSet < ActiveRecord::Base
	validates :name, presence: true
	validates :desc, presence: true
	has_many :questions
	belongs_to :question_group
end
