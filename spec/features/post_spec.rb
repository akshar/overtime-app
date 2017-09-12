require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end
    it "should be reached successfully" do
      expect(page.status_code).to eq(200)
    end

    it "should have content" do
      expect(page).to  have_content(/Posts/)
    end

    it "should have list of posts" do
      post1 = FactoryGirl.build_stubbed(:user)
      post2 = FactoryGirl.build_stubbed(:second_post)
      visit posts_path
      expect(page).to have_content(/Rationale|content/)
    end

  end

  describe "new" do
    it "has a link from the home page" do
      visit root_path
      click_link "new_post_from_nav"
      expect(page.status_code).to eq(200)
    end
  end



  describe "creation" do
    before do
      user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
      login_as(user, :scope => :user)
      visit new_post_path
    end

    it "should have a new form" do
      expect(page.status_code).to eq(200)
    end

    it "can create new form page" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "random"
      click_on "Save"
      expect(page).to have_content("random")
    end

    it "can associate user with a post" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on "Save"
      expect(User.last.posts.last.rationale).to have_content("User Association")
    end
  end

  describe "edit" do
    before do
      @post = FactoryGirl.create(:post)
    end
    it "can be reached by clicking index on edit page" do
      visit posts_path
      click_link "edit_#{@post.id}"
      expect(page.status_code).to eq(200)
    end

    it "can be edited" do
      visit edit_post_path(@post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "edited content"
      click_on "Save"
      expect(page).to have_content("edited content")
    end
  end
end
