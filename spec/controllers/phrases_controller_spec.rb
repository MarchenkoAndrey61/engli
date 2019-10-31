require 'rails_helper'
require 'spec_helper'

RSpec.describe PhrasesController do
  describe 'user tries to access index page' do
    context 'when not logged in ' do
      it 'redirect to log in page' do
        get :index
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
  describe 'POST create' do
    before do
      user = create(:user)
      sign_in user
    end
  end

  context 'when the phrase is valid' do
    it 'creates a phrase ' do
      post :create, params: { phrase:  attributes_for(:phrase) }
      expect(flash[:alert]).not_to be_empty
      
    end
  end
  context 'when the phrase is invalid' do
    it 'creates a phrase' do
      post :create, params: { phrase: attributes_for(:phrase, :invalid) }

      expect(flash[:alert]).not_to be_empty
    end
  end

  describe 'PUT update/:id' do
    let(:user) { create(:user) }
    let(:phrase) { create(:phrase, user: user) }

    context 'when the user is the author ' do
      it 'updates the phrase and redirects to user :show' do
        sign_in user
        put :update, params: { id: phrase.id, phrase: attributes_for(:phrase, :update) }
        expect(flash[:notice]).not_to be_empty
        expect(response).to redirect_to user_path(user)
      end
    end
    context 'when the user is not an author' do
      it 'redirects to root_path' do
        not_author = create(:user)
        sign_in not_author
        put :update, params: { id: phrase.id, phrase: attributes_for(:phrase, :update) }
        expect(flash[:notice]).not_to be_empty 
      end
    end
  end
  describe 'DELETE destroy/:id' do
    let(:user) { create(:user) }
    let(:phrase) { create(:phrase, user: user) }

    context 'when the user is the author' do
      it 'deletes the phrase and redirects to user :show' do
        sign_in user

        delete :destroy, params: { id: phrase.id }

        expect(flash[:notice]).not_to be_empty
        expect(response).to redirect_to user_path(user)
      end
    end
    context 'when the user is not an author' do
      it 'does not delete the phrase ' do
        not_author = create(:user)
        sign_in not_author
        delete :destroy, params: { id: phrase.id }
        expect(flash[:notice]).not_to be_empty    
      end
    end
  end
  
  describe '#shared_vote example' do
    let(:author) { FactoryBot.create(:user) }
    let(:example_phrase) { FactoryBot.create(:phrase, user: author) }
    let(:example) { FactoryBot.create(:example, user: author, phrase: example_phrase) }

    context 'user upvotes a example' do
      it 'ups score of a example' do
        sign_in author

        redirect_to phrase_path(example.phrase.id)
        controller.shared_vote(example)

        
      end
    end
    context 'user downvotes a example' do
      it 'downs score of a example' do
        sign_in author
        redirect_to phrase_path(example.phrase.id)  
        controller.shared_vote(example)
        expect(author.carma).to eq -1
      end
    end  
  end
end

