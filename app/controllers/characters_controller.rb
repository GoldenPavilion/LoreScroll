class CharactersController < ApplicationController

    def index
    end

    def new
        @character = Character.new
    end

    def create
        @character = Character.new(character_params)
    end

    def show
    end

    def edit
    end

    def update
    end

    private

    def character_params
        params.require(:character).permit(:name, :role, :age, :gender, :species, :job, :physical, :description, :motivation, :world_id)
    end

end