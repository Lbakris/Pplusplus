class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :user, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :score1
      t.integer :score2
      t.integer :length
      t.references :gametype, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
