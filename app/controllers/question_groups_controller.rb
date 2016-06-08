class QuestionGroupsController < ApplicationController
  before_action :set_question_group, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!
  before_filter do 
    redirect_to :new_user_session unless current_user && current_user.try(:teacher?)
  end

  # GET /question_groups
  # GET /question_groups.json
  def index
    @question_groups = QuestionGroup.all
  end

  def list
    @question_sets = QuestionSet.where(question_group_id: params[:id])
  end
    
  # GET /question_groups/1
  # GET /question_groups/1.json
  def show
  end

  # GET /question_groups/new
  def new
    @question_group = QuestionGroup.new
  end

  # GET /question_groups/1/edit
  def edit
  end

  # POST /question_groups
  # POST /question_groups.json
  def create
    @question_group = QuestionGroup.new(question_group_params)

    respond_to do |format|
      if @question_group.save
        format.html { redirect_to @question_group, notice: 'Question group was successfully created.' }
        format.json { render :show, status: :created, location: @question_group }
      else
        format.html { render :new }
        format.json { render json: @question_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_groups/1
  # PATCH/PUT /question_groups/1.json
  def update
    respond_to do |format|
      if @question_group.update(question_group_params)
        format.html { redirect_to @question_group, notice: 'Question group was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_group }
      else
        format.html { render :edit }
        format.json { render json: @question_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_groups/1
  # DELETE /question_groups/1.json
  def destroy
    @question_group.destroy
    respond_to do |format|
      format.html { redirect_to question_groups_url, notice: 'Question group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_group
      @question_group = QuestionGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_group_params
      params.require(:question_group).permit(:name, :desc)
    end
end
