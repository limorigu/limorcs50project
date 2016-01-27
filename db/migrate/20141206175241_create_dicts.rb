class CreateDicts < ActiveRecord::Migration
  def change
    create_table :dicts do |t|
      t.string :word

      t.timestamps
    end
  end
end
