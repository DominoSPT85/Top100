class Billboard < ApplicationRecord
  has_many :songs
  has_many :artists



  def get_song_and_artist_list
    @results = Song.joins(:artist).select('songs.song_name, artists.name').where(:billboard_id => @billboard)
    @results = @results.to_json(only: [:name, :song_name])
  end
end
