class QuestionSetsController < ApplicationController
  before_action :set_question_set, only: [:show, :edit, :update, :destroy]
  
  before_filter :authenticate_user!
  before_filter do 
    redirect_to :new_user_session unless current_user && current_user.try(:teacher?)
  end

  # GET /question_sets
  # GET /question_sets.json
  def index
    @question_sets = QuestionSet.all
  end

  def list
    @questions = Question.where(question_set_id: params[:id])
  end

  # GET /question_sets/1
  # GET /question_sets/1.json
  def show
  end

  # GET /question_sets/new
  def new
    # if current_user.try(:admin?)
      # do something
      @question_set = QuestionSet.new
      @question_groups = QuestionGroup.all
    # else 
      # redirect_to :back
    # end
    
  end

  # GET /question_sets/1/edit
  def edit
    @question_groups = QuestionGroup.all
  end

  # POST /question_sets
  # POST /question_sets.json
  def create
    @question_set = QuestionSet.new(question_set_params)

    respond_to do |format|
      if @question_set.save
        format.html { redirect_to @question_set, notice: 'Question set was successfully created.' }
        format.json { render :show, status: :created, location: @question_set }
      else
        format.html { render :new }
        format.json { render json: @question_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_sets/1
  # PATCH/PUT /question_sets/1.json
  def update
    respond_to do |format|
      if @question_set.update(question_set_params)
        format.html { redirect_to @question_set, notice: 'Question set was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_set }
      else
        format.html { render :edit }
        format.json { render json: @question_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_sets/1
  # DELETE /question_sets/1.json
  def destroy
    @question_set = QuestionSet.find(params[:id])
    respond_to do |format|
      if  @question_set.destroy
        format.html { redirect_to dashboard_index_path, notice: 'Question set was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to :back, notice: 'This question set still has questions.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_set
      @question_set = QuestionSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_set_params
      params.require(:question_set).permit(:name, :desc, :question_group_id)
    end
end
