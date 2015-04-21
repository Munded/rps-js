require 'spec_helper'
require_relative 'helpers/sessions'

include SessionHelpers

feature 'Can accept 2 players' do

  before(:each) do
    User.create(user_name: 'Ed', email: 'ed@ed.com',
                password: '123', password_confirmation: '123')
    User.create(user_name: 'Eddy', email: 'ed@ed.co.uk',
                password: '321', password_confirmation: '321')
  end

  scenario 'can create a game' do
    sign_in('Ed', '123')
    click_button 'Create Game'
    expect(page).to have_content('Waiting for Opponent')
    expect(Game.first.player1).to eq('Ed')
  end

end