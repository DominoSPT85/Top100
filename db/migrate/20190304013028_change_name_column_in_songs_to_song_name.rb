class ChangeNameColumnInSongsToSongName < ActiveRecord::Migration[5.2]
  def change
    rename_column :songs, :name, :song_name
  end
end
