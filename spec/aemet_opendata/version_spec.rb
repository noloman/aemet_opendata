require 'spec_helper'

module AemetOpendata
  RSpec.describe AemetOpendata::VERSION do
    it 'has a not nil version number' do
      expect(AemetOpendata::VERSION).not_to be nil
    end

    it 'has a version number' do
      expect(AemetOpendata::VERSION).to eq('0.0.2')
    end
  end
end
