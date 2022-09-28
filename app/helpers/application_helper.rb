module ApplicationHelper

    def admin?
        if current_user && current_user.admin == true
            return true 
        end
    end
end
