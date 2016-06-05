require 'spec_helper'

describe "questions/index" do
  before(:each) do
    assign(:questions, [
      stub_model(Question,
        :question => "Question",
        :answer => "Answer",
        :question_set => nil
      ),
      stub_model(Question,
        :question => "Question",
        :answer => "Answer",
        :question_set => nil
      )
    ])
  end

  it "renders a list of questions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    assert_select "tr>td", :text => "Answer".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
