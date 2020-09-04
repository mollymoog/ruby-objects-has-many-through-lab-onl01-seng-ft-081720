class Artist
    attr_accessor :name, :genre

    @@all = []

    def initialize (name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select { |song| song.artist == self }
    end

    def new_song (title, genre)
        Song.new(title, self, genre)
    end

    def genres
        genres = []
        Song.all.select do |song| 
            song.artist == self
            genres << song.genre
        end
        genres
    end


end