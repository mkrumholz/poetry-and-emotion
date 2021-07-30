require 'rails_helper'

RSpec.describe 'Search result index' do
  it 'displays a list of 10 poems' do
    visit '/'

    fill_in :author, with: 'Emily'
    click_on 'Get Poems'

    expect(current_path).to eq search_path
    expect(page).to have_content "Not at Home to Callers"
    expect(page).to have_content "Emily Dickinson"
    expect(page).to have_content "Not at Home to Callers / Says the Naked Tree -- / Bonnet due in April -- / Wishing you Good Day --"
    expect(page).to have_content "Tone(s): Joy"
  end
end
