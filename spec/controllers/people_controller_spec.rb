require "spec_helper"

describe PeopleController do
  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    let(:params) { { url: 'http://andrehjr.highrise.com', title: 'Test title', first_name: 'André', last_name: 'Jr' } }
 
    it "creates a person via highrise" do
      post :create, person: params
      expect(response).to be_success
    end
  end
end