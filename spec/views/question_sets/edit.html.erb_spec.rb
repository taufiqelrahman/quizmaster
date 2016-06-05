require 'spec_helper'

describe "question_sets/edit" do
  before(:each) do
    @question_set = assign(:question_set, stub_model(QuestionSet,
      :name => "MyString",
      :desc => "MyString",
      :question_group => nil
    ))
  end

  it "renders the edit question_set form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", question_set_path(@question_set), "post" do
      assert_select "input#question_set_name[name=?]", "question_set[name]"
      assert_select "input#question_set_desc[name=?]", "question_set[desc]"
      assert_select "input#question_set_question_group[name=?]", "question_set[question_group]"
    end
  end
end
