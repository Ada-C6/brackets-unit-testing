class AddAsinAndFormatToAlbum < ActiveRecord::Migration
  def change
    add_column(:albums, :asin, :string)
    add_column(:albums, :format, :string)
  end
end
