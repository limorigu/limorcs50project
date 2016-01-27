class CreateDictionarynaries < ActiveRecord::Migration
  def change
    create_table :dictionarynaries do |t|
      t.string :word

      t.timestamps
    end
  end
end
