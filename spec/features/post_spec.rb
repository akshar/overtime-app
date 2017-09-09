require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it "should be reached successfully" do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it "should have content" do
      user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
      login_as(user, :scope => :user)
      visit posts_path
      expect(page).to  have_content(/Posts/)
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
end
