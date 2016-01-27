class CreatePalabras < ActiveRecord::Migration
  def change
    create_table :palabras do |t|
      t.string :word

      t.timestamps
    end
  end
end
