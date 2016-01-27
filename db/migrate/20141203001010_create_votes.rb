class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :up_vote
      t.boolean :down_vote
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
