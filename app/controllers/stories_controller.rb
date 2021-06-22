class StoriesController < ApplicationController

    def index
    end
    
    def new
        @story = Story.new
    end

    def create
        @story = Create.new(story_params)
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