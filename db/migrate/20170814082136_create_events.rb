class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.text :category
      t.date :date
      t.text :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
