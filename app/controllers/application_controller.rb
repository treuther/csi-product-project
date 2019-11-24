class ApplicationController < ActionController::Base

    private

    def current_user
        #the result that's found by the session user_id. Only calls the database once, using current_user more than once.
        @current_user ||= User.find_by_id(session[:user_id])
    end
end
