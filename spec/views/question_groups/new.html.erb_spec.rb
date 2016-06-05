require 'spec_helper'

describe "question_groups/new" do
  before(:each) do
    assign(:question_group, stub_model(QuestionGroup,
      :name => "MyString",
      :desc => "MyString"
    ).as_new_record)
  end

  it "renders new question_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", question_groups_path, "post" do
      assert_select "input#question_group_name[name=?]", "question_group[name]"
      assert_select "input#question_group_desc[name=?]", "question_group[desc]"
    end
  end
end
