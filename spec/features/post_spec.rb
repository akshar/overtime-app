require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it "should be reached successfully" do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it "should have content" do
      visit posts_path
      expect(page).to  have_content(/Posts/)
    end
  end

  describe "creation" do
    it "should have a new form" do
      visit new_post_path
      expect(page.status_code).to eq(200)
    end

    it "can create new form page" do
      # /post/new
      visit new_post_path
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "random"
      click_on "Save"


      expect(page).to have_content("random")
      end
  end

end
