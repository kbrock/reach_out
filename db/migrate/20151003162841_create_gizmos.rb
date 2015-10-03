class CreateGizmos < ActiveRecord::Migration
  def change
    create_table :gizmos do |t|
      t.string :name
      t.boolean :status
      t.string :color
      t.belongs_to :family

      t.timestamps
    end
  end
end
