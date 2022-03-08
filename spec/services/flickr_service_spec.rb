require 'rails_helper'

RSpec.describe FlickrService do

  describe 'self.get_images' do
    it 'returns correct hash schema', :vcr do
      images = FlickrService.get_images('spongebob')

      expect(images.keys).to eq([:photos, :stat])
      expect(images[:photos].keys).to eq([:page, :pages, :perpage, :total, :photo])
      expect(images[:photos][:page]).to be_a(Integer)
      expect(images[:photos][:pages]).to be_a(Integer)
      expect(images[:photos][:perpage]).to be_a(Integer)
      expect(images[:photos][:total]).to be_a(Integer)
      expect(images[:photos][:photo]).to be_a(Array)
      expect(images[:photos][:photo].first).to be_a(Hash)
      expect(images[:photos][:photo].first.keys).to eq([:id, :owner, :secret, :server, :farm, :title, :ispublic, :isfriend, :isfamily])
      expect(images[:photos][:photo].first[:id]).to be_a(String)
      expect(images[:photos][:photo].first[:owner]).to be_a(String)
      expect(images[:photos][:photo].first[:secret]).to be_a(String)
      expect(images[:photos][:photo].first[:server]).to be_a(String)
      expect(images[:photos][:photo].first[:farm]).to be_a(Integer)
      expect(images[:photos][:photo].first[:title]).to be_a(String)
      expect(images[:photos][:photo].first[:ispublic]).to be_a(Integer)
      expect(images[:photos][:photo].first[:isfriend]).to be_a(Integer)
      expect(images[:photos][:photo].first[:isfamily]).to be_a(Integer)
      expect(images[:stat]).to be_a(String)
    end
  end

end
