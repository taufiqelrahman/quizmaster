require 'spec_helper'

describe "histories/new" do
  before(:each) do
    assign(:history, stub_model(History,
      :user => nil,
      :question_set => nil
    ).as_new_record)
  end

  it "renders new history form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", histories_path, "post" do
      assert_select "input#history_user[name=?]", "history[user]"
      assert_select "input#history_question_set[name=?]", "history[question_set]"
    end
  end
end
