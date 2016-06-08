class ElearningController < ApplicationController
  def start
  	@question_groups = QuestionGroup.all
  end

  def list
  	@question_sets = QuestionSet.where(question_group_id: params[:group])
  end

  def question
  	@set = params[:set]
  	@questions = Question.where(question_set_id: @set)
  	@question_set = QuestionSet.find(@set)
  	#.paginate(:page => params[:page], :per_page => 1)
  end

  def result
  	@set = params[:set]
  	@questions = Question.where(question_set_id: @set)
  	# @answers = @questions.pluck(:answer)
  	#@questions = params[:question]
  	#@answers = params[:correct]
  	@user_answers = params[:answer]
  	@user_result = Hash.new(@user_answers.length)
  	# x = @answers.length
  	# i = 0
  	# (0..x).each do |i|
  	@history = History.create(user_id: current_user.id, question_set_id: @set)
  	@history.save
  	@user_answers.each do |i,ua|
  		if ua == @questions.find(i).answer
  			@user_result[i] = "True"
  		else
  			@user_result[i] = "False"
  		end
  		@result = Result.create(user_answer: ua, user_result: @user_result[i], user_id: current_user.id, question_id: i,
  		history_id: @history.id)
	  	@result.save
  	end
  	@true = Result.where(history_id: @history.id).where(user_result: "True").count
  	if @user_result.length > 0
	  	@score = @true * 100 / @user_result.length
	  	#@user_result.select{|a| a == "TRUE"}.size
	  	# / @user_result.length
  	else
  		@score = 0
  	end
    @history.update_attribute(:score, @score)
  end

end
