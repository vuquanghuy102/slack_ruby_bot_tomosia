class BaseController < ApplicationController
  layout :layout_by_resource

  def layout_by_resource
    return 'application' unless devise_controller?
    'devise'
  end
end