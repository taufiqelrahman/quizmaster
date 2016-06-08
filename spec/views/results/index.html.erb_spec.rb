require 'spec_helper'

describe "results/index" do
  before(:each) do
    assign(:results, [
      stub_model(Result,
        :user_answer => "User Answer",
        :user_result => "User Result",
        :user => nil,
        :question => nil,
        :history => nil
      ),
      stub_model(Result,
        :user_answer => "User Answer",
        :user_result => "User Result",
        :user => nil,
        :question => nil,
        :history => nil
      )
    ])
  end

  it "renders a list of results" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User Answer".to_s, :count => 2
    assert_select "tr>td", :text => "User Result".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
