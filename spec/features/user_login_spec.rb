require "rails_helper"

describe 'login process' do
  describe 'can login as registered users' do
    it "should succeed" do
      username = 'Dr Pepper'
      password = 'awesomesoda'
      user = User.create(username: username, password: password)

      visit root_path

      click_on "I already have an account"

      expect(current_path).to eq(login_path)

      fill_in :username, with: username
      fill_in :password, with: password
      click_on "Log In"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome, #{username}!")
    end
    it "should not succeed because password is inaccurate" do
      username = 'Dr Pepper'
      password = 'awesomesoda'
      user = User.create(username: username, password: password)

      visit root_path

      click_on "I already have an account"

      expect(current_path).to eq(login_path)

      fill_in :username, with: username
      fill_in :password, with: "wrongpassword"
      click_on "Log In"

      expect(current_path).to eq(login_path)
      expect(page).to have_button("Log In")
    end
  end
end
