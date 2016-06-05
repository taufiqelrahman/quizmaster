require 'spec_helper'

describe "question_sets/new" do
  before(:each) do
    assign(:question_set, stub_model(QuestionSet,
      :name => "MyString",
      :desc => "MyString",
      :question_group => nil
    ).as_new_record)
  end

  it "renders new question_set form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", question_sets_path, "post" do
      assert_select "input#question_set_name[name=?]", "question_set[name]"
      assert_select "input#question_set_desc[name=?]", "question_set[desc]"
      assert_select "input#question_set_question_group[name=?]", "question_set[question_group]"
    end
  end
end
