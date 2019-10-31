require 'rails_helper'
require 'spec_helper'

RSpec.describe StaticPagesController do
  describe 'GET hello' do
    it 'renders the hello page' do
      user = create( :user)
      sign_in(user)
    end
  end
end

