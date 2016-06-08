require 'spec_helper'

describe "results/new" do
  before(:each) do
    assign(:result, stub_model(Result,
      :user_answer => "MyString",
      :user_result => "MyString",
      :user => nil,
      :question => nil,
      :history => nil
    ).as_new_record)
  end

  it "renders new result form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", results_path, "post" do
      assert_select "input#result_user_answer[name=?]", "result[user_answer]"
      assert_select "input#result_user_result[name=?]", "result[user_result]"
      assert_select "input#result_user[name=?]", "result[user]"
      assert_select "input#result_question[name=?]", "result[question]"
      assert_select "input#result_history[name=?]", "result[history]"
    end
  end
end
