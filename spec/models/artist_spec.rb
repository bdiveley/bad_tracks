require 'rails_helper'

describe Artist, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end
describe 'Relationship' do
  it { should have_many(:songs) }
  end
end
