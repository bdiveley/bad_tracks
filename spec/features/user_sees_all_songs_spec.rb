require 'rails_helper'

describe 'user index' do
  it 'user can see all songs' do
    # artist = Artist.create(name: "Journey")
    # song_1 = artist.songs.create(title: "Don't Stop Believing", length: 303, play_count: 54839)
    # song_2 = artist.songs.create(title: "Never Gonna Give You Up", length: 259, play_count: 94382)
    song_1, song_2 = create_list(:song, 100)

    visit '/songs'

    expect(page).to have_content("All Songs")
    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Plays: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Plays: #{song_2.play_count}")
  end
end
