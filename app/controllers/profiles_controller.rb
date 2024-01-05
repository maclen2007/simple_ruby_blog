class ProfilesController < ApplicationController

    before_action :authenticate_user!, only: [:index]

    def index
        @user = User.find(current_user.id)
        @posts = @user.post
    end

    def show
        @user = User.find(params[:id])
        @posts = @user.post
        render :index
    end

end
