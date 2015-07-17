class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.jsonb :payload, null: false
      t.index :payload, using: :gin

      t.timestamps
    end
  end
end
