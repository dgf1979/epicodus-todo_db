require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new list', {:type => :feature}) do
  #As a user, I want to see a welcome page that includes where I can go and what I can do.
  #As a user, I want to create new lists of different categories so that I can keep similar tasks together (phone calls, school work, house work, errands to run, bills to pay, etc)
  it('allows a user to click a list to see the tasks and details for it') do
    visit('/')
    click_link('Add New List')
    fill_in('name', :with =>'Epicodus Work')
    click_button('Add List')
    #expect(page).to have_content('Success!')
    expect(page).to have_content('Epicodus Work')
  end

  #As a user, I want to see all of the lists that I have created so that I can manage them one at a time.
  it('displays all lists created by user') do
    visit('/list/new')
    fill_in('name', :with =>'Epicodus Work')
    click_button('Add List')
    visit('/lists')
    expect(page).to have_content('Epicodus Work')
  end

  #As a user, I want to add tasks to a list.
  #As a user, I want to select a single list and see the tasks for it.
  it('adds a task to a list') do
    #add a new list
    visit('/list/new')
    fill_in('name', :with =>'Chores')
    click_button('Add List')
    visit('/lists')
    #click link for list
    click_link('Chores')
    #add a new task in the form
    fill_in('description', :with => 'Mow Lawn')
    click_button('Add Task')
    expect(page).to have_content('Mow Lawn')
  end

end
