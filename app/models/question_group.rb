class QuestionGroup < ActiveRecord::Base
	before_destroy :no_referenced_question_sets
	validates :name, presence: true
	validates :desc, presence: true
	has_many :question_sets

	def no_referenced_question_sets
		return if question_sets.empty?
		false # If you return anything else, the callback will not stop the destroy from happening
	end
end
