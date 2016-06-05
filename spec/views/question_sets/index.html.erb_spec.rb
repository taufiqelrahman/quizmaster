require 'spec_helper'

describe "question_sets/index" do
  before(:each) do
    assign(:question_sets, [
      stub_model(QuestionSet,
        :name => "Name",
        :desc => "Desc",
        :question_group => nil
      ),
      stub_model(QuestionSet,
        :name => "Name",
        :desc => "Desc",
        :question_group => nil
      )
    ])
  end

  it "renders a list of question_sets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Desc".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
