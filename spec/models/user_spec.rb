require 'spec_helper'

describe User do
  describe "Validations" do
    let(:user) { User.create password: 'password', password_confirmation: 'password' }

    it "should not be valid without a password" do
      user = User.new password: nil, password_confirmation: nil
      user.should_not be_valid
    end

    it "should be valid with no changes" do
      user.should be_valid
    end
  end
end
