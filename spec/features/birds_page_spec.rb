require 'rails_helper'

feature 'Birds Page' do
  let!(:birds_page) { App.new.birds_page }

  context 'When user is not present' do
    before do
      birds_page.load
    end

    scenario 'Redirects to sign in page' do
      expect(page).to have_content 'Sign in'
    end
  end

  context 'When normal user is present' do
    let!(:regular_user) { create(:user) }

    before :each do
      login_as regular_user
      birds_page.load
    end

    context 'and no birds are present' do
      scenario 'Shows info if there are no birds' do
        expect(page).to have_content 'Sorry, no birds added yet...'
      end
    end

    # TODO: create 2 birds, login as some user and check if birds namesare being shown
    context 'and birds are present' do
      let!(:bird_numero_uno) { create(:bird) }
      let!(:bird_numero_duo) { create(:bird) }

      scenario 'Shows list of birds' do
        binding.pry
        expect(page).to have_content bird_numero_uno.name
        expect(page).to have_content bird_numero_duo.name
      end
    end
  end
end
