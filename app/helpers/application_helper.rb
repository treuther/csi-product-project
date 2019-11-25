module ApplicationHelper

    def render_nav_links
        if current_user
            render partial: 'layouts/nav_links'
        end
    end
end
