class StoriesController < ApplicationController

    def index
    end
    
    def new
        @story = Story.new
    end

    def create
        @story = Story.new(story_params)
        if @story.save
            redirect_to story_path(@story)
        else
            redirect_to new_story_path
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    private

    def story_params
        params.require(:story).permit(:title, :summary)
    end

end