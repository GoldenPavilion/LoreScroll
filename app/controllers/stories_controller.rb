class StoriesController < ApplicationController
    before_action :require_login
    before_action only: [:edit, :update] do
        authorize_to_edit(Story)
    end

    def index
        @stories = Story.most_recent
    end
    
    def new
        @story = Story.new
    end

    def create
        @story = current_user.stories.build(story_params)
        if @story.save
            redirect_to story_path(@story)
        else
            render 'new'
        end
    end

    def show
        @story = Story.find_by_id(params[:id])
    end

    def edit
        @story = Story.find_by_id(params[:id])
    end

    def update
        @story = Story.find_by_id(params[:id])
        @story.update(story_params)
        redirect_to story_path(@story)
    end

    def destroy
        @story = Story.find_by_id(params[:id])
        @story.destroy
        redirect_to user_path(@story.user)
    end

    private

    def story_params
        params.require(:story).permit(:title, :medium, :summary, :user_id, genre_ids:[], genres_attributes: [:name])
    end
    
end