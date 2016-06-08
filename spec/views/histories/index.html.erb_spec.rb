require 'spec_helper'

describe "histories/index" do
  before(:each) do
    assign(:histories, [
      stub_model(History,
        :user => nil,
        :question_set => nil
      ),
      stub_model(History,
        :user => nil,
        :question_set => nil
      )
    ])
  end

  it "renders a list of histories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
