require "rails_helper"

describe "a user visits books_path" do
  it "sees a list of all book titles" do
    book_1 = Book.create!(title: "asd")
    book_2 = Book.create!(title: "iuasiudh")

    visit books_path

    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_2.title)
  end

  it "can click on a book title to go to book_path(book)" do
    book_1 = Book.create!(title: "asd")
    book_2 = Book.create!(title: "iuasiudh")

    visit books_path

    click_on book_1.title

    expect(current_path).to eq(book_path(book_1))
  end
end
