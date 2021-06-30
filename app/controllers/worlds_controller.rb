class WorldsController < ApplicationController

    def index
        @worlds = World.most_recent
    end

    def new
        @world = World.new
    end

    def create
        @world = current_user.worlds.build(world_params)
        if @world.save
            redirect_to world_path(@world)
        else
            flash[:notice] = "Your world needs a name. Try again!"
            render 'new'
        end
    end

    def show
        @world = World.find_by(id: params[:id]) 
    end


    def edit
        @world = World.find_by(id: params[:id])
    end

    def update
        @world = World.find_by(id: params[:id])
        @world.update(world_params)
        redirect_to world_path(@world)
    end

    def destroy
        @world = World.find_by_id(params[:id])
        @world.destroy
        redirect_to user_path(current_user)
    end

    private

    def world_params
        params.require(:world).permit(:name, :scale, :description, :user_id)
    end

end