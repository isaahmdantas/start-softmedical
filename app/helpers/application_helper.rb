module ApplicationHelper
    def active_header_menu?(controllers)
        controllers.each do |controller|
            next unless controller[0] == params[:controller]
            return 'active' if controller[1] == '*' || controller[1].include?(params[:action])
        end
    end
    
    def active_collapse_menu?(controllers)
        controllers.each do |controller|
          next unless controller[0] == params[:controller]
          return 'here show' if controller[1] == '*' || controller[1].include?(params[:action])
        end
    end
end
