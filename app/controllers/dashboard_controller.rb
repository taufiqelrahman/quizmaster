class DashboardController < ApplicationController

  def index
  end

  def get_stat
  	@user_id = current_user.id
  	@history = History.where(user_id: @user_id)
  	@total_quiz = @history.count
  	@fave_set = QuestionSet.find(@history.group("question_set_id").first.question_set_id)
  end

  def get_history
  	@user_id = current_user.id
  	@history = History.where(user_id: @user_id).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
  end

  def get_result
  	@i = 1
  	@results = Result.where(history_id: params[:history_id])
  	@questions = Question.where(question_set_id: params[:set])
  	@score = params[:score]
  end
end
