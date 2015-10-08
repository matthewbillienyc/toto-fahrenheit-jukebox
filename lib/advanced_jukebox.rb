require 'pry'

class Jukebox

  attr_accessor :song_numbers, :song_names, :songs, :numbered_songs, :exit, :input

  def initialize(songs)
    @songs = songs
    @input = nil
    @exit = false
  end

  def call
    set_song_numbers
    number_songs
    puts "Welcome to the TOTO - FAHRENHEIT jukebox! Type 'help' for available commands. This jukebox requires VLC player."
    while @input != 'exit'
      do_command
    end
  end

  def help
    puts "I accept the following commands:
    \n - help : displays this help message
    \n - list : displays a list of songs you can play
    \n - play : lets you choose a song to play
    \n - exit : exits this program"
  end

  def list
    songs.keys.each_with_index do |song_name, index|
      puts "#{index+1}: #{song_name}"
    end
  end

  def set_song_numbers
    @song_numbers ||= []
    @song_names = songs.keys.map { |song| song }
    song_names.each_with_index { |name, index| song_numbers << (index+1).to_s }
    # binding.pry
  end

  def number_songs
    @numbered_songs = Hash[song_numbers.zip song_names]
  end
  
  def play
    list
    puts "Enter the song number of title as it appears in the list above:"
    print ">> "
    get_input
    if numbered_songs.has_key?(input)
      puts "Now playing - #{song_names[(input.to_i)-1]}"
      path = songs[song_names[(input.to_i)-1]].gsub("< path to this directory >/jukebox-cli/", "")
      # binding.pry
      system("open " + path + ' -a "vlc"')
    elsif songs.has_key?(input)
      puts "Now playing - #{input}"
      path = songs[input].gsub("< path to this directory >/jukebox-cli/", "")
      system("open " + path + ' -a "vlc"')
    else
      puts "Sorry, please enter a valid song or song number."
    end
  end

  def get_input
    @input = gets.chomp.downcase
  end

  def do_command
    get_input
    case @input
    when 'help'
      help
    when 'list'
      list
    when 'exit'
      exit_jukebox
    when 'play'
      play
    else
      'Invalid command'
    end
  end

  def exit_jukebox
    puts "Goodbye"
    exit = true
  end

end


my_songs = {
"Til the End" => '< path to this directory >/jukebox-cli/audio/Toto-Fahrenheit/01.flac',
"We Can Make it Tonight" => '< path to this directory >/jukebox-cli/audio/Toto-Fahrenheit/02.flac',
"Without Your Love" =>  '< path to this directory >/jukebox-cli/audio/Toto-Fahrenheit/03.flac',
"Can't Stand it any Longer" => '< path to this directory >/jukebox-cli/audio/Toto-Fahrenheit/04.flac',
"I'll Be Over You" => '< path to this directory >/jukebox-cli/audio/Toto-Fahrenheit/05.flac',
"Fahrenheit" => '< path to this directory >/jukebox-cli/audio/Toto-Fahrenheit/06.flac',
"Somewhere Tonight" => '< path to this directory >/jukebox-cli/audio/Toto-Fahrenheit/07.flac',
"Could This Be Love" => '< path to this directory >/jukebox-cli/audio/Toto-Fahrenheit/08.flac',
"Lea" => '< path to this directory >/jukebox-cli/audio/Toto-Fahrenheit/09.flac',
"Don't Stop Me Now" => '< path to this directory >/jukebox-cli/audio/Toto-Fahrenheit/10.flac'
}

jukebox = Jukebox.new(my_songs)
jukebox.call
