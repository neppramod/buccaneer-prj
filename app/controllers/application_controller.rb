class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_login

  #skip_before_filter :require_login, only: [:index, :new, :create]
  skip_before_filter :require_login, only: [:index]

  #skip_before_filter :require_login, except: [:destroy]
  skip_before_filter :require_login, except: [:destroy, :show]
end
