require "test_helper"

describe UsersController do
  describe "auth_callback" do
    it "Registers a new user" do
    end

    it "Accepts a returning user" do
      start_count = User.count

      user = users(:grace)
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(user))
      get auth_callback_path(:github)

      must_redirect_to root_path

      session[:user_id].must_equal user.id, "User was not logged in"

      User.count.must_equal start_count
    end

    it "Rejects incomplete auth data" do
    end
  end
end
