class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :forbid_user_vote!, only: [:vote]
  after_action :add_recipient_id!, only: [:vote]
  

    def shared_vote(instance)
      if params[:vote] == 'up'
        instance.liked_by current_user
        instance.vote_bool = 1
        instance.save
      else
        instance.downvote_from current_user
        instance.vote_bool = 0
        instance.save
    end

    if instance.vote_registered?
      instance.set_carma(params[:vote], current_user)
      message = params[:vote] == 'up' ? 'Liked your' : 'Disliked your'
      flash[:notice] = 'Thanks for your vote!'
    else
      flash[:danger] = 'You\'ve already voted that post!'
    end

  end

  def like_dislike!
    last_active = PublicActivity::Activity.last
    if last_active.trackable_type == 'Phrase'
      phrase_like = Phrase.find(last_active.trackable_id)
      if phrase_like.vote_bool == 1
        last_active.like = 1
        last_active.save
      else
        last_active.like = 0
        last_active.save
      end
    else
      last_active.save
    end
  end

  private
  def forbid_user_vote!
    if params[:controller] == 'examples'
      phrase = Phrase.friendly.find(params[:phrase_id])
      cheater = phrase.examples.find_by(id: params[:example_id]).user == current_user
    else
      cheater = Phrase.friendly.find(params[:id]).user == current_user
    end

    if cheater
      flash[:danger] = 'You can\'t vote for yourself little cheater !'
      redirect_back(fallback_location: root_path)
    end
  end

  def add_recipient_id!
    @activ = PublicActivity::Activity.all
    @activ.each do |t|
      if t.trackable_type == 'Phrase'
        find_phrase = Phrase.find(t.trackable_id)
        t.recipient_id = find_phrase.user_id
        if t.owner_id == t.recipient_id
          t.recipient_id = nil
        end
        t.save
      elsif t.trackable_type == 'Example'
        find_example = Example.find(t.trackable_id)
        t.recipient_id = find_example.user_id
        if t.owner_id == t.recipient_id
          t.recipient_id = nil
      end 
      t.save
      else
        t.recipient_id = nil
        t.save      
      end
    end
    like_dislike!
  end
  
  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end


end
  


