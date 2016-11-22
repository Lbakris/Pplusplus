class CreateGametypes < ActiveRecord::Migration
  def change
    create_table :gametypes do |t|
      t.string :name
      t.boolean :tournament

      t.timestamps null: false
    end
  end
end
