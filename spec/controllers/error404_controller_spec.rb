require 'rails_helper'

RSpec.describe Error404Controller, type: :controller do

  describe "GET #error" do
    it "returns http success" do
      get :error
      expect(response).to have_http_status(302)
    end
  end

end
