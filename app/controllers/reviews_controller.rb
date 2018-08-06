class ReviewsController < ApplicationController

    before_action :authenticate_user!, only: [:destroy]
    before_action :authorize_user!, only: [:destroy]

    def create
        # render json: params
        @idea = Idea.find params[:idea_id]

        @review = Review.new(review_params)
        @review.idea = @idea

        @review.user = current_user

        if @review.save 
            redirect_to idea_path(@idea)
        else
            @reviews = @idea.reviews.order(created_at: :desc)
            render "ideas/show"
        end
    end

    def destroy
        @review = Review.find params[:id]
        @review.destroy

        redirect_to idea_path(@review.idea)
    end

    private
    def review_params
        params.require(:review).permit(:body)
    end

    def authorize_user!
        @review = Review.find params[:id]
        @idea = Idea.find params[:idea_id]

        unless can?(:manage, @review)
            flash[:danger] = "Access Denied!"
            redirect_to idea_path(@review.Idea)
        end
    end
end
