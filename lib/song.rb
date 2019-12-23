class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
   song = self.new
   @@all << song
   song 
  end 

  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song
  end 

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song 
    song
  end 
  
  def self.find_by_name(name)
    @@all.find{|song_name| song_name.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    if !find_by_name(name)
      create_by_name(name)
    else
      find_by_name(name)
    end
  end 
  
  def self.alphabetical 
    @@all.sort_by { |song| song.name }
  end 
  
  def self.new_from_filename(file_name)
    string = file_name.split(".")
    file_name_string = string[0]
    data = file_name_string.split(" - ")
    artist_name = data[0]
    song_name = data[1]
    
    song = self.new 
    song.artist_name = artist_name
    song.name = song_name
    song
  end
  
  def self.create_from_filename(file_name)
    string = file_name.split(".")
    file_name_string = string[0]
    data = file_name_string.split(" - ")
    artist_name = data[0]
    song_name = data[1]
    
    song = self.new 
    song.artist_name = artist_name
    song.name = song_name
    @@all << song 
    song
  end
  
  def self.destroy_all 
    @@all.clear
  end 
  

  
end
