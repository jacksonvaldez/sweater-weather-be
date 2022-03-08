require 'rails_helper'

RSpec.describe ErrorSerializer do

  describe 'self.return_error' do
    it 'returns error hash' do
      errors = ["error 1", "error 2", "error 3"]
      expected = {
        errors: errors
      }
      expect(ErrorSerializer.return_errors(errors)).to eq(expected)
    end
  end

end
