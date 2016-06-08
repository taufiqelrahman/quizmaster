require 'spec_helper'

describe "results/edit" do
  before(:each) do
    @result = assign(:result, stub_model(Result,
      :user_answer => "MyString",
      :user_result => "MyString",
      :user => nil,
      :question => nil,
      :history => nil
    ))
  end

  it "renders the edit result form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", result_path(@result), "post" do
      assert_select "input#result_user_answer[name=?]", "result[user_answer]"
      assert_select "input#result_user_result[name=?]", "result[user_result]"
      assert_select "input#result_user[name=?]", "result[user]"
      assert_select "input#result_question[name=?]", "result[question]"
      assert_select "input#result_history[name=?]", "result[history]"
    end
  end
end
