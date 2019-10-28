require 'spec_helper'
describe ‘user tries to access index page’ do
  context ‘when not logged in ’ do
      it ‘redirect to log in page’ do
          get :index
          expect(response).to redirect_to ‘/users/sign_in’
      end
  end
end