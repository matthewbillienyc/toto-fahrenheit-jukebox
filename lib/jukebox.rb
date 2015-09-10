require 'pry'

songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def help
  puts "I accept the following commands:
  \n - help : displays this help message
  \n - list : displays a list of songs you can play
  \n - play : lets you choose a song to play
  \n - exit : exits this program"
end

def list(songs)
  songs.each_with_index do |each, index|
    list_index = index + 1
    puts "#{list_index}. #{each}"
  end
end

def play(songs)
  choice = gets.chomp
  indexes = []
  songs.each_index do |index|
    indexes << index.to_s
  end

  if songs.include?(choice)
    puts "Playing #{choice}"
  elsif indexes.include?(choice)
    choice_i = choice.to_i - 1
    puts "Playing #{songs[choice_i]}"
  else    
    puts "Invalid input, please try again"
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  loop do
    puts "Please enter a command:"
    command = gets.chomp.downcase
    case command
    when "help"
      help
    when "list"
      list(songs)
    when "play"
      play(songs)
    when "exit"
      exit_jukebox
      break
    else
      puts "Invalid command"
    end
  end
end



