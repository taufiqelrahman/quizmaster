require 'spec_helper'

describe "question_groups/show" do
  before(:each) do
    @question_group = assign(:question_group, stub_model(QuestionGroup,
      :name => "Name",
      :desc => "Desc"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Desc/)
  end
end
