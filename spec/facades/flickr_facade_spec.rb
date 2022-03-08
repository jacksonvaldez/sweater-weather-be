require 'rails_helper'

RSpec.describe FlickrFacade do

  it 'returns an image url based on query', :vcr do
    url = FlickrFacade.get_image_url('spongebob')

    expect(url).to be_a(String)
    expect(url.include?('http')).to eq(true)
  end

end
