class PhrasesController < ApplicationController

  before_action :set_phrase!, only: [:edit, :update, :destroy, :show]


  def new
    @phrase = Phrase.new
    @phrase.examples.new
  end

  def index
    @phrases = Phrase.includes(:user).paginate(:page => params[:page])
   
  end

  def show
    @examples = @phrase.examples.paginate(page: params[:page], per_page: 10)
    @new_example = @phrase.examples.new
    
  end

  def edit
  end   

  def update
    if @phrase.update_attributes(phrase_params)
      flash[:notice] = 'Phrase has been updated!'
      redirect_to user_path(@phrase.user)
    else
      flash[:danger] = @phrase.errors.full_messages.to_sentence
      render :edit
    end
  end


  def create
    @phrase = current_user.phrases.new(phrase_params)
    if @phrase.save
      flash[:notice] = 'Phrase has been created!'
      redirect_to root_path
    else
      flash[:danger] = @phrase.errors.full_messages.to_sentence
      render :new
    end
  end  

  def destroy
    @phrase.destroy
    flash[:notice] = 'Phrase has been deleted!'
    redirect_to user_path(@phrase.user)
  end

    private 

    def phrase_params
      params.require(:phrase).permit(:phrase, :translation, :category, :user_id, :phrase_id, examples_attributes:[:example, :user_id])
    
    end

   
    def set_phrase!
      @phrase = Phrase.friendly.find(params[:id])
    end
  
end




 