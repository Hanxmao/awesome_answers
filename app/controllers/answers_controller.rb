class AnswersController < ApplicationController
    before_action :find_question
    def create
        @answer = Answer.new(params.require(:answer).permit(:body))
        @answer.question = @question
        if @answer.save
            redirect_to question_path(@question)
        else
            @answers = @question.answers.order(created_at: :desc)
            render '/questions/show', status: 303
        end
    end

    def destroy
        @answer = Answer.find params[:id]
        @answer.destroy
        redirect_to question_path(@question)
    end



    private

    def find_question
        @question = Question.find params[:question_id]
    end

end
