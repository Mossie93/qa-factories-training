require 'rails_helper'

feature 'Bird page' do
  let(:bird_page) { App.new.bird_page }
  let!(:MISSING_USER) { FILL_THIS_IN }

  context 'When user is signed in' do
    before do
      login_as MISSING_USER
      bird_page.load(bird_id: MISSING_BIRD_ID)
    end

    context 'When bird with region is being shown' do
      let!(:MISSING_BIRD) { FILL_THIS_IN }
      let!(:MISSING_REGION) { FILL_THIS_IN }

      scenario 'shows region where bird occured' do
        expect(page).to have_content 'Spotted in'
        expect(page).to have_content MISSING_REGION_NAME
      end
    end

    context 'When bird without regions is being shown' do
      let!(:MISSING_BIRD) { FILL_THIS_IN }

      scenario 'does not show any region information' do
        expect(page).not_to have_content 'Spotted in'
      end
    end

    context 'When bird with environmental laws is being shown' do
      let!(:MISSING_BIRD) { FILL_THIS_IN }
      let!(:MISSING_LAW) { FILL_THIS_IN }

      scenario 'shows country where the bird is protected' do
        expect(page).to have_content 'Protected by'
        expect(page).to ahve_content MISSING_LAW_NAME
      end
    end

    context 'When bird without environmental laws is being shown' do
      let!(:MISSING_BIRD) { FILL THIS IN }

      scenario 'shows no information about environmental laws' do
        expect(page).not_to have_content 'Protected by'
      end
    end
  end
end
