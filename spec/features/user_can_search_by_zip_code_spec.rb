require 'rails_helper'

feature "User can see a search bar at the root page" do
  scenario "and can fill in zip code" do
    visit '/'

    fill_in 'search[q]', with: '80203'
    click_on 'Locate'

    expect(page).to have_current_path(search_path(:search => '80203'))
    






As a user
When I visit "/"
And I fill in the search form with 80203
And I click "Locate"
Then I should be on page "/search" with parameters visible in the url
Then I should see a list of the 10 closest stations within 6 miles sorted by distance
And the stations should be limited to Electric and Propane
And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
