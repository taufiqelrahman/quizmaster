class QuestionSet < ActiveRecord::Base
	before_destroy :no_referenced_questions
	validates :name, presence: true
	validates :desc, presence: true
	has_many :questions
	belongs_to :question_group

	def no_referenced_questions
		return if questions.empty?

		errors.add_to_base("This question set is referenced by question(s): #{questions.map(&:number).to_sentence}")
		false # If you return anything else, the callback will not stop the destroy from happening
	end
end
