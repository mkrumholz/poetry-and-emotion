require 'rails_helper'

RSpec.describe Poem do
  it 'has a title, author, and content' do
    title = "Not at Home to Callers"
    author = "Emily Dickinson"
    content = "Not at Home to Callers / Says the Naked Tree -- / Bonnet due in April -- / Wishing you Good Day --"

    poem_details = { title: title, author: author, content: content }

    poem = Poem.new(poem_details)

    expect(poem).to be_a Poem
    expect(poem.title).to eq title
    expect(poem.author).to eq author
    expect(poem.content).to eq content
  end
end
