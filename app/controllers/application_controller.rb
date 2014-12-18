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

  def gera_notificacao(destinatario,modelo,tipo="aviso")
    @destinatarios = User.where("nivel = '#{destinatario}'")
    
    @destinatarios.each do |destinatario|
      @notificacao = Notificacao.new
      if controller_name == "matriculas"
        @notificacao.conteudo = "#{I18n.l Date.today} - #{current_user.username} cadastrou a #{controller_name.capitalize.singularize} nº #{modelo.id} - #{modelo.aluno.nome}."
      elsif controller_name == "horarios"
        @notificacao.conteudo = "#{I18n.l Date.today} - #{current_user.username} cadastrou o #{controller_name.capitalize.singularize} #{modelo.dia} às #{modelo.horario.to_s.slice(10..15)} - Professor #{modelo.professor.nome}."
      else
        @notificacao.conteudo = "#{I18n.l Date.today} - #{current_user.username} cadastrou #{controller_name.capitalize.singularize} #{modelo.nome}."
      end
      @notificacao.tipo = tipo
      @notificacao.visualizado = false
      @notificacao.user_id = destinatario.id
      @notificacao.save
    end  
  end

end
