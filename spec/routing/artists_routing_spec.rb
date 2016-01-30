require 'rails_helper'

RSpec.describe "artists routing", type: :routing do

  before do
    Song.destroy_all
    Artist.destroy_all
    @artist = Artist.create(name: "Daft Punk")
    @song = @artist.songs.create(title: "Technologic")
  end

  it "routes to songs as a nested resource of artist" do
    expect(get: artist_songs_path(@artist)).to route_to(controller: "songs", action: "index")
  end

  it "routes to a song as a nested resource of an artist" do
    expect(get: artist_song_path(@artist, @song)).to route_to(controller: "songs", action: "show")
  end
end
