class UsersController < ApplicationController

    def new
        @user = User.new #define a new user
    end

end
