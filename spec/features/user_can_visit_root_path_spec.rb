require 'rails_helper'

describe "User can visit root path" do
  it "to see a search form" do
    visit '/'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Welcome to Poetry and Emotion')
    expect(page).to have_selector('input')
  end

  it 'links to the search results index' do
    visit '/'

    fill_in :author, with: 'Emily'
    click_on 'Get Poems'

    expect(current_path).to eq search_path
  end
end
