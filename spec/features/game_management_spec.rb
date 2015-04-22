require 'spec_helper'
require_relative 'helpers/sessions'

include SessionHelpers

feature 'Can accept 2 players' do

  before(:each) do
    player1 = User.create(user_name: 'Ed', email: 'ed@ed.com',
                          password: '123', password_confirmation: '123')
    player2 = User.create(user_name: 'Eddy', email: 'ed@ed.co.uk',
                          password: '321', password_confirmation: '321')
  end

  def in_browser(name)
    old_session = Capybara.session_name
    Capybara.session_name = name
    yield
    Capybara.session_name = old_session
  end

  scenario 'can create a game' do
    sign_in('Ed', '123')
    click_button 'Create Game'
    expect(page).to have_content('Waiting for Opponent')
    expect(Game.first.player1.user_name).to eq 'Ed'
  end

  scenario 'joining a game' do
    in_browser :firefox do
      sign_in('Ed', '123')
      click_button 'Create Game'
    end
    in_browser :chrome do
      sign_in('Eddy', '321')
      click_button 'Join Game'
      expect(page).to have_content('Pick Your Move')
      expect(Game.first.player2.user_name).to eq 'Eddy'
    end

  end

end