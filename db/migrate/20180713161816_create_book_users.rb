class CreateBookUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :book_users do |t|
      t.references :book
      t.references :user
    end
  end
end
