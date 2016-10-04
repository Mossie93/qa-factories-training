require 'rails_helper'

feature 'Countries page' do
  let(:countries_page) { App.new.countries_page }

  # TODO: create and login as some user.
  context 'when normal user is present' do
    let!(:regular_user) { create(:user) }

    before do
      login_as regular_user
      countries_page.load
    end

    context 'and no countries are present' do
      scenario 'shows proper info' do
        expect(page).to have_content 'Sorry, no countries added yet...'
      end
    end

    # TODO: create 2 countries and check if their names are shown in countries page
    context 'and countries are present' do
      let!(:country_0) { create(:country) }
      let!(:country_1) { create(:country) }

      scenario 'shows list of countries' do
        expect(page).to have_content country_0.name
        expect(page).to have_content country_1.name
      end
    end
  end

  # TODO: create and login as admin user, check if you can see add country button
  context 'when user is an admin' do
    let!(:admin_user) { create(:user_as_admin) }

    before do
      login_as admin_user
      countries_page.load
    end

    scenario 'shows Add Country button' do
      expect(page).to have_content 'Add Country'
    end
  end
end
