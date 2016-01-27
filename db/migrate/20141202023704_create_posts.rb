class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :body
      t.references :user, index: true
      t.boolean :arts
      t.boolean :humor
      t.boolean :politics
      t.boolean :science
      t.boolean :sports
      t.boolean :travel
      t.integer :rating

      t.timestamps
    end
  end
end
