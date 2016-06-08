require 'spec_helper'

describe ElearningController do

  describe "GET 'start'" do
    it "returns http success" do
      get 'start'
      response.should be_success
    end
  end

  describe "GET 'list'" do
    it "returns http success" do
      get 'list'
      response.should be_success
    end
  end

  describe "GET 'question'" do
    it "returns http success" do
      get 'question'
      response.should be_success
    end
  end

end
