class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :user
      t.string :content
      t.integer :rating
    end
  end
end
