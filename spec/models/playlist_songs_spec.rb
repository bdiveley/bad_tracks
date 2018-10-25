require 'rails_helper'

describe PlaylistSong, type: :model do
  describe 'Relationship' do
    it { should belong_to(:song) }
    it { should belong_to(:playlist) }
  end
end
