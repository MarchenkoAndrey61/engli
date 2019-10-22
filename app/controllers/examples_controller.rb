class ExamplesController < ApplicationController

  before_action :set_phrase!, :authenticate_user!, only: [:create, :destroy]
  before_action :set_example!, only: [:destroy, :vote]
  def show
    @examples = @phrase.examples.paginate(page: params[:page], per_page: 10)
    @example = Example.find(params[:id])
    @new_example = @phrase.examples.new
    
  end

  def destroy
  
    @phrase.examples.find_by(id: params[:id]).destroy
    flash[:notice] = 'Example has been deleted!'
    redirect_to phrase_path(@phrase)
  end
  
  def create
    @example = @phrase.examples.new(example_params)
    if @example.save
      flash[:notice] = 'Example has been created!'
    else
      flash[:danger] = @example.errors.full_messages.to_sentence
    end
    redirect_to phrase_path(@phrase)
  end

  def vote
    shared_vote(@example)
    redirect_back(fallback_location: root_path)
  end

  private

  def example_params
    params.require(:example).permit(:example, :user_id, :phrase_id)
  end

  def set_phrase!
    @phrase = Phrase.friendly.find(params[:phrase_id])
  end

  def set_example!
    @example = Example.find(params[:example_id])
  end
  
end 
  