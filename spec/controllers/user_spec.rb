require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    it_behaves_like 'has index action'
  end

  describe 'GET show/:id' do
    it_behaves_like 'has show action', :user
  end
end   
