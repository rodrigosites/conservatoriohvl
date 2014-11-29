# coding: utf-8

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login
  skip_before_filter :require_login, only: [:welcome]

  def welcome
  end

  private
  def not_authenticated
    redirect_to root_path, alert: "Você não pode acessar esta página sem estar autenticado."
  end
end
