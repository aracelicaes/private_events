class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :date
      t.text :location
      t.text :description

      t.timestamps
    end
  end
end
