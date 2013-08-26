require 'spec_helper'

describe "Static pages" do
  subject { page }
  shared_examples_for "all static pages" do
    it { should have_content(heading) }
    it { should have_title(full_title(page_title)) }
    end
#see Code 5.39 http://railstutorial-china.org/chapter5.html#section-5-1-1
  # describe "Home page" do
    # before { visit root_path }
	# it { should have_content('Sample App') }
    # it { should have_title( full_title('')) }
    # it { should_not have_title('| Home') }
  # end
  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }
    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end
  describe "Help page" do
    before { visit help_path }
	let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }
    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading)    { 'About' }
    let(:page_title) { 'About Us' }
    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
	# better to use method 'have_selector'
    #it { should have_content('Contact') }\
	it { should have_selector('h1', text: 'Contact') }
    it { should have_title(full_title('Contact')) }
  end
  
  #test for route 
   # it "should have the right links on the layout" do
    # visit root_path
    # click_link "About"
    ##expect(page).to have_title(full_title('About Us'))
	# expect(page).to # fill in
    # click_link "Help"
    # expect(page).to # fill in
    # click_link "Contact"
    # expect(page).to # fill in
    # click_link "Home"
    # click_link "Sign up now!"
    # expect(page).to # fill in
    # click_link "sample app"
    # expect(page).to # fill in
  # end


end