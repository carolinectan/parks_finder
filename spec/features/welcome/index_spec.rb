require 'rails_helper'

RSpec.describe 'welcome index page' do
  it 'returns the total of parks found for a given state' do
    visit "/"

    # As a user,
    # When I select "Tennessee" from the form,
    # (Note: use the existing form)
    select 'Tennessee', :from => 'state'

    # And click on "Find Parks",
    click_on 'Find Parks'

    expect(current_path).to eq(parks_path)

    # I see the total of parks found,
    expect(page).to have_content('Total Parks: 15')

    # And for each park I see:
    park_id = 'FAEF5684-83A4-4CF2-A701-60CF8D4014BD'
    within "#park-#{park_id}" do
      # - full name of the park
      expect(page).to have_content('Appalachian National Scenic Trail')
      # - description
      expect(page).to have_content('The Appalachian Trail is a 2,180+ mile long public footpath that traverses the scenic, wooded, pastoral, wild, and culturally resonant lands of the Appalachian Mountains. Conceived in 1921, built by private citizens, and completed in 1937, today the trail is managed by the National Park Service, US Forest Service, Appalachian Trail Conservancy, numerous state agencies and thousands of volunteers.')
      # - direction info
      expect(page).to have_content('There are many points of access along the Appalachian Trail, whether it is by car, train, bus or plane. For more detailed directions, please refer to the "Directions" section of our park webpage.')
      # - standard hours for operation
      expect(page).to have_content("monday")
      expect(page).to have_content("tuesday")
      expect(page).to have_content("wednesday")
      expect(page).to have_content("thursday")
      expect(page).to have_content("friday")
      expect(page).to have_content("saturday")
      expect(page).to have_content("sunday")
      expect(page).to have_content("All Day")
      save_and_open_page
    end
  end
end
