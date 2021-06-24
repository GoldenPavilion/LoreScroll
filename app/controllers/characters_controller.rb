class CharactersController < ApplicationController

    def index
        if params[:world_id]
            @characters = World.find(params[:world_id]).characters
        else
            @characters = Character.all
        end
    end

    def new
        @character = Character.new
    end

    def create
        @character = Character.new(character_params)
    end

    def show
        @character = Character.find_by(id: params[:id])
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