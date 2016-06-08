require 'spec_helper'

describe DashboardController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'get_stat'" do
    it "returns http success" do
      get 'get_stat'
      response.should be_success
    end
  end

end
