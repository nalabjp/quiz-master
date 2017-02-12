class QuizController < ApplicationController
  before_action :set_question, only: [:show, :answer]

  def show
  end

  # PATCH /questions/1/answer
  def answer
    if @question.correct_answer?(answer_params[:answer])
      redirect_to root_url, notice: 'Congrats ! Your answer is correct !'
    else
      flash[:notice] = 'Oooops, incorrect .'
      render action: :show
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def answer_params
      params.require(:question).permit(:answer)
    end
end
