class PhrasesController < ApplicationController
  def new
    @phrase = Phrase.new()
  end

  def index
    @phrases = Phrase.page(params[:page]).order(:created_at)
  end

  def create
    @phrase = Phrase.new(phrase_params)
    if @phrase.save
      flash[:notice] = 'Phrase has been created'
      redirect_to root_path
    else
      flash[:danger] = @phrase.errors.full_messages.to_sentence
      render :new
    end
  end  

    private 

    def phrase_params
      params.require(:phrase).permit(:phrase, :translation, :category)
    end
end




 