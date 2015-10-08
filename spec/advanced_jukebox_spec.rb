require_relative 'spec_helper'

my_songs = {
"Go Go GO" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/01.mp3',
"LiberTeens" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/02.mp3',
"Hamburg" =>  '< path to this directory >/jukebox-cli/audio/Emerald-Park/03.mp3',
"Guiding Light" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/04.mp3',
"Wolf" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/05.mp3',
"Blue" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/06.mp3',
"Graduation Failed" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/07.mp3'
}

describe "CLI Jukebox" do
  let(:jukebox) { Jukebox.new(my_songs) }

  context "with commands" do
    it "responds to 'help'" do
      expect { jukebox.help }.to output(/^(?=.*help)(?=.*list)(?=.*play)(?=.*exit).+/m).to_stdout
    end

    it "responds to 'list'" do
      expect { jukebox.list }.to output(/Go Go GO/).to_stdout
    end

    it "responds to 'exit'" do
      expect { jukebox.exit_jukebox }.to output(/Goodbye/).to_stdout
    end
  end

end