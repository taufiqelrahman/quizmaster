require 'spec_helper'

describe "questions/edit" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :question => "MyString",
      :answer => "MyString",
      :question_set => nil
    ))
  end

  it "renders the edit question form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", question_path(@question), "post" do
      assert_select "input#question_question[name=?]", "question[question]"
      assert_select "input#question_answer[name=?]", "question[answer]"
      assert_select "input#question_question_set[name=?]", "question[question_set]"
    end
  end
end
