require "rails_helper"

describe "a user visits book_path(book)" do
  it "sees the book title" do
    book_1 = Book.create(title: "ohasdi")

    visit book_path(book_1)

    expect(page).to have_content(book_1.title)
  end
  it "sees a list of reviews for the book" do
    book_1 = Book.create(title: "ohasdi")
    user_1 = book_1.users.create(name: "oijasoidj")
    user_2 = book_1.users.create(name: "982398iu")
    review_1 = user_1.reviews.create!(rating: 4, content: "oiasdihhuiad")
    review_2 = user_2.reviews.create!(rating: 3, content: "ijoashudi0923dh")

    visit book_path(book_1)

    expect(page).to have_content(user_1.name)
    expect(page).to have_content("Rating: #{review_1.rating}")
    expect(page).to have_content(review_2.content)
    expect(page).to have_content(user_2.name)
    expect(page).to have_content("Rating: #{review_1.rating}")
    expect(page).to have_content(review_2.content)
  end

  it "sees average rating for book" do
    book_1 = Book.create(title: "ohasdi")
    user_1 = book_1.users.create(name: "oijasoidj")
    user_2 = book_1.users.create(name: "982398iu")
    review_1 = user_1.reviews.create!(rating: 4, content: "oiasdihhuiad")
    review_2 = user_2.reviews.create!(rating: 3, content: "ijoashudi0923dh")

    expected = book_1.average_rating

    visit book_path(book_1)

    expect(page).to have_content("Average rating: #{expected}")
  end

  it "sees highest rating for book" do
    book_1 = Book.create(title: "ohasdi")
    user_1 = book_1.users.create(name: "oijasoidj")
    user_2 = book_1.users.create(name: "982398iu")
    review_1 = user_1.reviews.create!(rating: 4, content: "oiasdihhuiad")
    review_2 = user_2.reviews.create!(rating: 3, content: "ijoashudi0923dh")

    expected = book_1.highest_rating


    visit book_path(book_1)
    require 'pry'; binding.pry

    expect(page).to have_content("Highest rating: #{expected}")
  end

  it "sees lowest rating for book" do
    book_1 = Book.create(title: "ohasdi")
    user_1 = book_1.users.create(name: "oijasoidj")
    user_2 = book_1.users.create(name: "982398iu")
    review_1 = user_1.reviews.create!(rating: 4, content: "oiasdihhuiad")
    review_2 = user_2.reviews.create!(rating: 3, content: "ijoashudi0923dh")

    expected = book_1.lowest_rating

    visit book_path(book_1)

    expect(page).to have_content("Lowest rating: #{expected}")
  end
end
