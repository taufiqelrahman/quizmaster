require 'spec_helper'

describe "question_sets/show" do
  before(:each) do
    @question_set = assign(:question_set, stub_model(QuestionSet,
      :name => "Name",
      :desc => "Desc",
      :question_group => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Desc/)
    rendered.should match(//)
  end
end
