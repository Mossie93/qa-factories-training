require 'rails_helper'

feature 'Countries page' do
  let(:countries_page) { App.new.countries_page }

  #TODO create and login as some user.
  context 'when normal user is present' do
    let!(:MISSING_USER) { FILL_THIS_IN }

    before do
      login_as MISSING_USER
      countries_page.load
    end

    context 'and no countries are present' do
      scenario 'shows proper info' do
        expect(page).to have_content 'Sorry, no countries added yet...'
      end
    end

    #TODO create 2 countries and check if their names are shown in countries page
    context 'and countries are present' do
      let!(:MISSING_COUNTRY_1) { FILL_THIS_IN }
      let!(:MISSING_COUNTRY_2) { FILL_THIS_IN }

      scenario 'shows list of countries' do
        expect(page).to have_content MISSING_COUNTRY_1_NAME
        expect(page).to have_content MISSING_COUNTRY_2_NAME
      end
    end
  end

  #TODO create and login as admin user, check if you can see add country button
  context 'when user is an admin' do
    let!(:MISSING_ADMIN) { FILL_THIS_IN }

    before do
      login_as MISSING_ADMIN
      countries_page.load
    end

    scenario 'shows Add Country button' do
      expect(page).to have_content 'Add Country'
    end
  end
end
