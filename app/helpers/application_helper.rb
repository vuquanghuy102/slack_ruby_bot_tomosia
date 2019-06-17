module ApplicationHelper
  def add_class_active(path)
    current_route = Rails.application.routes.recognize_path(path)
    "active" if current_page?(path) or params[:controller] == current_route[:controller]
  end

  def display_submenu(path)
    current_route = Rails.application.routes.recognize_path(path)
    "in" if current_page?(path) or params[:controller] == current_route[:controller]
  end

  def add_active_sub_menu_action_new(path)
    current_route = Rails.application.routes.recognize_path(path)
    "active" if current_page?(path) or (params[:controller] == current_route[:controller] and controller.action_name == 'new')
  end

  def add_active_sub_menu(path)
    current_route = Rails.application.routes.recognize_path(path)
    "active" if current_page?(path) or (params[:controller] == current_route[:controller] and controller.action_name != 'new')
  end
end
