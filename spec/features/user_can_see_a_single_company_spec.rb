require 'rails_helper'

describe 'As a user' do
  context 'After I have searched for companies by name' do
    before(:each) do
      stub_search

      visit '/'

      fill_in :q, with: 'bankbond'
      click_on 'Search'
    end

    scenario 'I can click on a company name link and see information about the company' do
      stub_get_company_info

      click_on 'BANKBOND LIMITED'

      expect(current_path).to eq('/companies/05275061')
      expect(page).to have_content('BANKBOND LIMITED')
      expect(page).to have_content('05275061')
      expect(page).to have_content("Unit 2 Howard Avenue Barnstaple, Devon EX32 8QA")
      expect(page).to have_content('Magnus Garstang')
      expect(page).to have_content("25 St Efrides Road Torquay, Devon TQ2 5SG")
      expect(page).to have_content('Victoria Emma Ward')
      expect(page).to have_content("25 St Efrides Road Torquay, Devon TQ2 5SG")
    end
  end
end
