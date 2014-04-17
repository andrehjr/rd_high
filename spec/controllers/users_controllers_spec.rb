require "spec_helper"

describe UsersController do
  describe "GET #index" do
    it "returns an error when trying to create user with invalid parameters" do
      post :create, user: { email: '' }
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "creates an user with success" do
      post :create, user: { email: 'omg@test.com', password: '123456', password_confirmation: '123456'}
      expect(response).to redirect_to(root_path)
    end
  end
end