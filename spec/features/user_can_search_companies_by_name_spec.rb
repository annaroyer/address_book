require 'rails_helper'

describe 'As a user' do
  context 'when I visit /' do
    scenario 'I can search companies by name' do
      stub_search

      visit '/'

      fill_in :q, with: 'bankbond'
      click_on 'Search'

      expect(current_path).to eq('/search/companies')
      expect(page).to have_field(:q)
      expect(page).to have_link 'BANKBOND LIMITED'
      expect(page).to have_link 'JANI-JACK LIMITED'
      expect(page).to have_link 'SWARLAND GOLF CLUB LIMITED'
    end
  end
end
