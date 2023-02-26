require 'rails_helper'

RSpec.describe '#index' do
  before :each do
    @merchant1 = Merchant.create!(name: "Carlos Jenkins") 
    @merchant2 = Merchant.create!(name: "Leroy Jenkins") 
    @merchant3 = Merchant.create!(name: "Melissa Jenkins") 
    @merchant4 = Merchant.create!(name: "Jenny Jenkins") 
    @merchant5 = Merchant.create!(name: "Mickey Mantle") 
    visit admin_merchants_path
  end

  describe 'as an admin when I visit the admin merchants index page' do
    it 'I see the names of each merchant in the system' do
      expect(page).to have_content("Carlos Jenkins")
      expect(page).to have_content("Leroy Jenkins")
      expect(page).to have_content("Melissa Jenkins")
      expect(page).to have_content("Jenny Jenkins")
      expect(page).to have_content("Mickey Mantle")
    end

    it 'the names of each merchant are links to their admin show page' do
      expect(page).to have_link("Carlos Jenkins")
      expect(page).to have_link("Leroy Jenkins")
      expect(page).to have_link("Melissa Jenkins")
      expect(page).to have_link("Jenny Jenkins")
      expect(page).to have_link("Mickey Mantle")

      click_link "Carlos Jenkins"

      expect(current_path).to eq "/admin/merchants/#{@merchant1.id}"
    end

    it 'I see a button to enable or disable merchants next to their name' do
      
      within "#id-#{@merchant1.id}" do
        expect(page).to have_button("Enable")
        click_button "Enable"
        expect(current_path).to eq admin_merchants_path
        save_and_open_page
        expect(page).to have_button("Disable")
      end

      within "#id-#{@merchant2.id}" do
        expect(page).to have_button("Enable")
        click_button "Enable"
        expect(current_path).to eq admin_merchants_path
        expect(page).to have_button("Disable")
      end
    end

    it 'I see a section for "enabled merchants" and "disabled merchants"' do
      expect(page).to have_content("Enabled Merchants")
      expect(page).to have_content("Disabled Merchants")
      save_and_open_page
    end
  end
  
end