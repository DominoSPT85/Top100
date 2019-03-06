class RemoveForeignKeyFromArtists < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :artists, :billboards
  end
end
