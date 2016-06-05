class QuestionGroup < ActiveRecord::Base
	validates :name, presence: true
	validates :desc, presence: true
	has_many :question_sets
end
