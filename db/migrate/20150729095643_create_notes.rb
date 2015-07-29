class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :intent
      t.string :explanation
      t.string :response

      t.timestamps null: false
    end
  end
end
