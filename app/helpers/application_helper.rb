module ApplicationHelper

    def render_nav_links
        if current_user
            render partial: 'layouts/nav_links'
        else
            nil
        end
    end
end
