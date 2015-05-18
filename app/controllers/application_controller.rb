class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cache_header

  authem_for :developer

  if ENV['basic_auth']
    http_basic_authenticate_with name: ENV['auth_name'], password: ENV['auth_password']
  end

  helper_method :editable?

  private

  def editable?(post)
    current_developer && (current_developer == post.developer || current_developer.admin?)
  end

  def require_developer
    redirect_to root_path unless current_developer
  end

  def set_cache_header
    headers['Cache-Control'] = 'no-cache, no-store'
  end
end
