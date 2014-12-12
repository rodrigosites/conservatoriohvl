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

  def verifica_nivel
    not_authenticated unless current_user.nivel == "admin"
  end

  def gera_notificacao(tipo,destinatario,modelo)
    @notificacao = Notificacao.new
    @notificacao.conteudo = "#{Date.today.to_formatted_s(:rfc822)} - #{current_user.username} cadastrou o(a) #{controller_name.capitalize.singularize} #{modelo.nome}."
    @notificacao.tipo = tipo
    @notificacao.visualizado = false
    @destinatarios = User.where("nivel = '#{destinatario}'")
    
    @destinatarios.each do |destinatario|
      @notificacao.user_id = destinatario.id
      @notificacao.save
    end
    
  end

end
