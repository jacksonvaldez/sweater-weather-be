require 'rails_helper'

RSpec.describe MapQuestService do

  describe 'self.get_coordinates' do
    it 'returns a hash', :vcr do
      response = MapQuestService.get_coordinates('denver,co')
      expect(response).to be_a(Hash)
    end
  end

end
