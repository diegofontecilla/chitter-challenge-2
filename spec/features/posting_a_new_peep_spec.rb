feature 'Adding peeps' do
  scenario 'user can add a new peep to the list' do
    visit('/')
    click_button 'Sign up'
    fill_in('email', :with => "to@ni.com")
    fill_in('password', :with => '1234')
    fill_in('name', :with => 'toni')
    fill_in('username', :with => 'tonino')
    click_button 'Submit'
    fill_in('peep', :with => 'I want to visit Budapest')
    click_button 'Submit'

    expect(page).to have_content 'I want to visit Budapest'
  end
end
