require 'rails_helper'

describe Post do
  let(:post) { FactoryGirl.create(:post) }
  let(:valid_title) { 'today-i-learned-about-clojure' }

  it 'should have a valid factory' do
    expect(post).to be_valid
  end

  it 'should require a body' do
    post.body = ''
    expect(post).to_not be_valid
  end

  it 'should require a tag' do
    post.tag = nil
    expect(post).to_not be_valid
  end

  it 'should require a title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'should reject a title that is more than fifty chars' do
    post.title = 'a' * 51
    expect(post).to_not be_valid
  end

  it 'should create a slug' do
    expect(post.slug).to be
  end

  it 'should create a slug with dashes' do
    post.title = 'Today I learned about clojure'
    expect(post.send(:slugified_title)).to eq valid_title
  end

  it 'should remove whitespace' do
    post.title = '  Today I             learned about clojure   '
    expect(post.send(:slugified_title)).to eq valid_title
  end

  it 'should not allow punctuation' do
    post.title = 'Today I! learned? about #clojure'
    expect(post.send(:slugified_title)).to eq valid_title
  end
end
