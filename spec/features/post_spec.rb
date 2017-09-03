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
end