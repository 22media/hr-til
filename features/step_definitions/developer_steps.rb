Given 'I see the homepage' do
  visit root_path
  expect(page).to have_content("Hashrocket TIL")
end

When 'I click signup' do
  click_on "Sign Up"
end

Then 'I see the signup page' do
  expect(page).to have_content("Create an Account")
end

When 'I enter a username' do
  fill_in 'Username', with: 'johndoe'
end

When 'I enter my email' do
  fill_in 'Email', with: 'johndoe@hashrocket.com'
end

When 'I enter a password' do
  fill_in 'Password', with: 'ha$hrocket'
  fill_in 'Password Confirmation', with: 'ha$hrocket'
end

When 'I click submit' do
  click_on 'Create Account'
end

Then 'I see my username in the upper right' do
  expect(page).to have_content 'johndoe'
end
