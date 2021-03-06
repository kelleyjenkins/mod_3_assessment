require 'rails_helper'

describe "User searches for stores" do
  it "can search by zip code for stores nearby" do

    visit '/'

    fill_in :query, :with => "80202"
    click_on "Search"

    expect(current_path).to eq "/search"
    expect(current_url).to include(query="80202")

    expect(page).to have_content("17 Total Stores")

    expect(page).to have_css(".store", :count => 10)
    within(first(".store")) do
      expect(page).to have_css(".long-name")
      expect(page).to have_css(".city")
      expect(page).to have_css(".distance")
      expect(page).to have_css(".phone")
      expect(page).to have_css(".store-type")
    end
  end
end


# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 10 results (There are 17 stores within 25 miles. We want to display 10 on this page and 7 on the next. Get the first page to work first from start to finish and worry about pagination later.)
# And I should see the long name, city, distance, phone number and store type for each of the 10 results
