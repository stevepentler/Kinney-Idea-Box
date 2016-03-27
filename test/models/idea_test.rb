require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  test 'should have a quality that defaults to swill' do 
    ideas(:one).quality = "swill"

    assert(ideas(:one).valid?)
  end

  test 'it is valid with a quality of plausible' do 
    ideas(:one).quality = "plausible"

    assert(ideas(:one).valid?)
  end

  test 'it is valid with a quality of genius' do 
    ideas(:one).quality = "genius"

    assert(ideas(:one).valid?)
  end

  test 'it is invalid with any other quality' do 
    ideas(:one).quality = "invalid"

    refute(ideas(:one).valid?)
  end

  test 'it should be invalid without a title or body' do 
    idea_without_title_or_body = Idea.new

    refute(idea_without_title_or_body.valid?)
  end

  test 'it should be invalid without a body' do 
    idea = Idea.new(title: "title")

    refute(idea.valid?)
  end

  test 'it is valid with a title and body' do 
    idea_with_title_and_body = Idea.new(title: "title", body: "body")

    assert(idea_with_title_and_body.valid?)
  end
end
