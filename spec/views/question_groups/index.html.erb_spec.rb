require 'spec_helper'

describe "question_groups/index" do
  before(:each) do
    assign(:question_groups, [
      stub_model(QuestionGroup,
        :name => "Name",
        :desc => "Desc"
      ),
      stub_model(QuestionGroup,
        :name => "Name",
        :desc => "Desc"
      )
    ])
  end

  it "renders a list of question_groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Desc".to_s, :count => 2
  end
end
