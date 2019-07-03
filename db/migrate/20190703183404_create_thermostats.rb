class CreateThermostats < ActiveRecord::Migration[6.0]
  def change
    create_table :thermostats do |t|
      t.text :household_token, null: false, unique: true
      t.jsonb :location, null: false, default: {}

      t.timestamps
    end
    add_index :thermostats, :location
    add_index :thermostats, :household_token
  end
end
