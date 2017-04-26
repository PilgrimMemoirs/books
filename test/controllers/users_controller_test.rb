require "test_helper"

describe UsersController do
  describe "auth_callback" do
    it "Registers a new user" do
      start_count = User.count

      # Build auth info for a user not in our database
      user = User.new(
        username: "test_user",
        email: "test@user.net",
        oauth_provider: "github",
        oauth_uid: 99999
      )
      login(user)

      must_redirect_to root_path

      session[:user_id].must_equal User.last.id, "User was not logged in"

      User.count.must_equal start_count + 1
    end

    it "Accepts a returning user" do
      start_count = User.count

      user = users(:grace)
      login(user)

      must_redirect_to root_path

      session[:user_id].must_equal user.id, "User was not logged in"

      User.count.must_equal start_count
    end

    it "Rejects incomplete auth data" do
    end
  end
end
