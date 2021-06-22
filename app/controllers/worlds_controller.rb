class WorldsController < ApplicationController

    def index
    end

    def new
        @world = World.new
    end

    def create
        @world = World.new(world_params)
        if @save
            redirect_to world_path(@world)
        else
            redirect_to new_world_path
        end
    end

    def show
        @world = World.find_by(id: params[:id]) 
    end


    def edit
    end

    def update
    end

    private

    def world_params
        params.require(:world).permit(:name, :scale, :description)
    end

end