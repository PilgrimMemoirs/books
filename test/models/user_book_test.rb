require "test_helper"

describe UserBook do
  let(:user_book) { UserBook.new }

  it "must be valid" do
    value(user_book).must_be :valid?
  end
end
