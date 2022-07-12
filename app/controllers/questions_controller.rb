class QuestionsController < ApplicationController
    
#=============callback =========

before_action :find_question, only: [:edit, :update, :show, :destroy]

#=========create ============    
    def new
        @question = Question.new
    end

    def create
        @question = Question.new(question_params)
        if @question.save
            flash[:notice]= "Question created sucessfully!"
            redirect_to question_path(@question)   
        else
            render :new
        end
    end

#=================read==============
    def index
        @questions = Question.order(created_at: :desc)
    end

    def show
        @answers = @question.answers.order(created_at: :desc)
        @answer = Answer.new
    end

#========================update==========================
    def edit
        
    end

    def update
        if @question.update(question_params)
            redirect_to question_path(@question)
        else
            render :edit
        end
    end


#=================delete========================

    def destroy
        @question.destroy
        redirect_to questions_path 
    end

#=============private====================
    private

    def question_params
        params.require(:question).permit(:title, :body)
        # the form use  form_with model:@question, so the form name-value pair will store under the 
        #params[:question], that's why we need to requeire(:question)
    end

    def find_question
        @question = Question.find params[:id]
    end

end
