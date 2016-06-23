require 'rails_helper'

feature 'Birds Page' do
  let(:birds_page) { App.new.birds_page }

  context 'When user is not present' do
    before do
      birds_page.load
    end

    scenario 'Redirects to sign in page' do
      expect(page).to have_content 'Sign in'
    end
  end

  #TODO login as some user and visit birds page.
  context 'When normal user is present' do
    let!(:MISSING_USER) { FILL_THIS_IN }

    before do
      login_as MISSING_USER
      birds_page.load
    end

    context 'and no birds are present' do
      scenario 'Shows info if there are no birds' do
        expect(page).to have_content 'Sorry, no birds added yet...'
      end
    end

    #TODO create 2 birds, login as some user and check if birds namesare being shown
    context 'and birds are present' do
      let(:MISSING_BIRD_1) { FILL_THIS_IN }
      let(:MISSING_BIRD_2) { FILL_THIS_IN }

      scenario 'Shows list of birds' do
        expect(page).to have_content MISSING_BIRD_1_NAME
        expect(page).to have_content MISSING_BIRD_2_NAME
      end
    end
  end
end
