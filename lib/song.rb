require 'pry'
class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end


  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name).add_song(self)
  end

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
#    binding.pry
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
  end

end
