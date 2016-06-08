require 'spec_helper'

describe "results/show" do
  before(:each) do
    @result = assign(:result, stub_model(Result,
      :user_answer => "User Answer",
      :user_result => "User Result",
      :user => nil,
      :question => nil,
      :history => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User Answer/)
    rendered.should match(/User Result/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
