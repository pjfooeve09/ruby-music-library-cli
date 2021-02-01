require "pry"

class Artist

    extend Concerns::Findable
    attr_accessor :name, :songs

    @@all = []

    def initialize (name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.create (artist)
        artist = self.new (artist)
        artist.save
        artist
    end

    def self.destroy_all
        @@all.clear
    end

    def add_song (song)
        song.artist = self unless song.artist #assigns the current artist to the song's 'artist' property and does not assign the artist if the song already has an artist
        @songs << song unless @songs.include?(song) # adds the song to the current artist's 'songs' collection and does not add the song to the current artist's collection of songs if it already exists therein
    end

    def genres
        self.songs.collect { |song| song.genre}.uniq  
    end
end


