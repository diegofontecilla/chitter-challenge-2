feature 'authentication' do

  scenario 'a user can sign in' do
    visit('/')
    click_button 'Sign up'
    fill_in('email', :with => 'carlo@fonte.com')
    fill_in('password', :with => '1234')
    fill_in('name', :with => 'carlo')
    fill_in('username', :with => 'carlitos')
    click_button 'Submit'
    expect(page).to have_content 'Hi carlo, share a post with your friends:'
  end

  scenario 'an error is printed when password doesnt match with email' do
    visit('/')
    fill_in('email', :with => 'dani@bortnik.com')
    fill_in('password', :with => 'wrongpassword')
    click_button 'Submit'

    expect(page).not_to have_content 'Hi dani, share a post with your friends:'
    expect(page).to have_content 'Something does not match, please try again:'
  end

  scenario 'an error is printed when email is wrong' do
    visit('/')
    fill_in('email', :with => 'dani@bortnikkkkk.com')
    fill_in('password', :with => '1234')
    click_button 'Submit'

    expect(page).not_to have_content 'Hi dani, share a post with your friends:'
    expect(page).to have_content 'Something does not match, please try again:'
  end

  scenario 'user can sign out' do
    visit('/')
    fill_in('email', :with => 'carlo@fonte.com')
    fill_in('password', :with => '1234')
    click_button 'Submit'
    click_button 'Sign out'
    expect(page).to have_content 'You have signed out'
  end
end
