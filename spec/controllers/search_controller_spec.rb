require 'spec_helper'

describe SearchController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      #get 'show'
      #response.should be_success
    end
  end

  describe "POST 'result'" do
    it "returns http success" do
      #post 'result'
      #response.should be_success
    end
  end

end
