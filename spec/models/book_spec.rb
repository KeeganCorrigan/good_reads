require "rails_helper"

describe "instance methods" do
  describe ".average_rating" do
    it "returns average rating for all reviews" do
      book_1 = Book.create(title: "ohasdi")
      user_1 = book_1.users.create(name: "oijasoidj")
      user_2 = book_1.users.create(name: "982398iu")
      review_1 = user_1.reviews.create!(rating: 4, content: "oiasdihhuiad")
      review_2 = user_2.reviews.create!(rating: 3, content: "ijoashudi0923dh")

      expected = 3.5

      expect(book_1.average_rating).to be(expected)
    end
    describe ".highest_rating" do
      it "returns highest rating for all reviews" do
        book_1 = Book.create(title: "ohasdi")
        user_1 = book_1.users.create(name: "oijasoidj")
        user_2 = book_1.users.create(name: "982398iu")
        review_1 = user_1.reviews.create!(rating: 4, content: "oiasdihhuiad")
        review_2 = user_2.reviews.create!(rating: 3, content: "ijoashudi0923dh")

        expected = 4.0

        expect(book_1.highest_rating).to be(expected)
      end
    end
    describe ".lowest_rating" do
      it "returns lowest rating for all reviews" do
        book_1 = Book.create(title: "ohasdi")
        user_1 = book_1.users.create(name: "oijasoidj")
        user_2 = book_1.users.create(name: "982398iu")
        review_1 = user_1.reviews.create!(rating: 4, content: "oiasdihhuiad")
        review_2 = user_2.reviews.create!(rating: 3, content: "ijoashudi0923dh")

        expected = 3.0

        expect(book_1.lowest_rating).to be(expected)
      end
    end
  end
end
