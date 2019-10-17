class ExamplesController < ApplicationController

  before_action :set_phrase!, only: [:create]
  
  def show
    @examples = @phrase.examples.paginate(page: params[:page], per_page: 10)
    @example = Example.find(params[:id])
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

  private

  def example_params
    params.require(:example).permit(:example, :user_id, :phrase_id)
  end

  def set_phrase!
    @phrase = Phrase.find(params[:example][:phrase_id])
  end
end 
  
