require 'rails_helper'

feature "User can see a search bar at the root page" do
  scenario "and can fill in zip code" do
    visit '/'

    fill_in 'q', with: '80203'
    click_on 'Locate'

    expect(current_path).to eq('/search')

    url= URI.parse(current_url).to_s

    expect(url).to include('q=80203')

    expect(page).to have_content("Here are your 10 results within 6 miles")

    within ('.results') do
      expect(page).to have_selector(".result", count: 10)
    end

    within ('.result') do
      expect(page). to have_selector('.name')
      expect(page). to have_selector('.address')
      expect(page). to have_selector('.fuel_type')
      expect(page). to have_selector('.distance')
      expect(page). to have_selector('.acess_time')
    end
  end
end




#Then I should see a list of the 10 closest stations within 6 miles sorted by distance - model test
