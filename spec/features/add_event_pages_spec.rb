require 'rails_helper'

describe "the add an event process" do
  it "adds a new event" do
    visit events_path
    click_link 'New Event'
    fill_in 'Name', :with => 'To Knit'
    fill_in 'Location', :with => 'Knit Purl, 1101 SW Alder St'
    fill_in 'Price', :with => '35'
    fill_in 'Description', :with => 'Come learn how to knit at Knit Purl. Includes all materials for a scarf'
    click_on 'Create Event'
    expect(page).to have_content 'Events'
  end

  it "gives error when no name, location, description or price is entered" do
    visit new_event_path
    click_on 'Create Event'
    expect(page).to have_content 'errors'
  end
end

  describe "the edit an event process" do
  it "edits an event" do
    event = Event.create(:name => 'To knit', :location => 'Knit Purl, 1101 SW Alder St', :price => '35', :description => 'Come learn how to knit at Knit Purl. Includes all materials for a scarf')
    visit event_path(event)
    click_on 'Edit'
    fill_in 'Name', :with => 'To Knit a Scarf'
    click_on 'Update Event'
    expect(page).to have_content 'To Knit a Scarf'
  end
end
