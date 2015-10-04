class CreateGizmos < ActiveRecord::Migration
  def change
    create_table :gizmos do |t|
      t.string :name, null: false
      t.boolean :status, null: false, default: false
      t.integer :color_int, null: false, default: 0
      t.belongs_to :family

      t.timestamps
    end
    add_index :gizmos, [:family_id, :name], :unique => true
  end
end
