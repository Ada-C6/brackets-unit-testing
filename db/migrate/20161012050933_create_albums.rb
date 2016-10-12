class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.belongs_to :artist, index: true
      t.string :title
      t.string :label
      t.integer :released

      t.timestamps null: false
    end
  end
end
