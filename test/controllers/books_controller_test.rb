require "test_helper"

describe BooksController do
  describe "Logged in user" do
    before do
      login(users(:grace))
    end

    describe "show" do
      it "succeeds for a real book" do
        get book_path(Book.first)
        must_respond_with :success
      end

      it "returns 404 not found for a bogus book" do
        get book_path(Book.last.id + 1)
        must_respond_with :not_found
      end
    end
  end

  describe "Guest user" do
    it "when viewing a book, redirects and shows an error" do
      get book_path(Book.first)
      must_redirect_to root_path
      flash[:message].must_equal "You must be logged in to see that page!"
    end
  end
end
