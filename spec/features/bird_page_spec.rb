require 'rails_helper'

feature 'Bird page' do
  let(:bird_page) { App.new.bird_page }
  let!(:regular_user) { create(:user) }

  context 'When user is signed in' do
    before do
      login_as regular_user
      bird_page.load(bird_id: bird.id)
    end

    context 'When bird with region is being shown' do
      let!(:bird) { create(:bird_with_regions) }
      let!(:region) { bird_with_regions.regions.last.name }

      scenario 'shows region where bird occured' do
        expect(page).to have_content 'Spotted in'
        expect(page).to have_content region
      end
    end

    context 'When bird without regions is being shown' do
      let!(:bird) { create(:bird) }

      scenario 'does not show any region information' do
        expect(page).not_to have_content 'Spotted in'
      end
    end

    context 'When bird with environmental laws is being shown' do
      let!(:bird) { create(:bird_with_laws) }
      let!(:law) { bird_with_laws.environmental_laws.last.name }

      scenario 'shows country where the bird is protected' do
        expect(page).to have_content 'Protected by'
        expect(page).to have_content law
      end
    end

    context 'When bird without environmental laws is being shown' do
      let!(:bird) { create(:bird) }

      scenario 'shows no information about environmental laws' do
        expect(page).not_to have_content 'Protected by'
      end
    end
  end
end
