# coding: utf-8
include ApplicationHelper

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
      case controller_name 
      when "matriculas"
        if action_name == "create"
          @notificacao.conteudo = "#{I18n.l Date.today} - #{current_user.username.capitalize} cadastrou a Matrícula nº #{modelo.id} - #{modelo.aluno.nome}."
        elsif action_name == "update"
          @notificacao.conteudo = "#{I18n.l Date.today} - #{current_user.username.capitalize} editou dados da Matrícula nº #{modelo.id} - #{modelo.aluno.nome}."
        else
          @notificacao.conteudo = "#{I18n.l Date.today} - #{current_user.username.capitalize} excluiu a Matrícula nº #{modelo.id} - #{modelo.aluno.nome}."
        end
      when "horarios"
        if action_name == "create"
          @notificacao.conteudo = "#{I18n.l Date.today} - #{current_user.username.capitalize} cadastrou o Horário #{dia(modelo.dia)} às #{hora(modelo.horario)} - Professor #{modelo.professor.nome}."
        elsif action_name == "update"
          @notificacao.conteudo = "#{I18n.l Date.today} - #{current_user.username.capitalize} editou dados do Horário #{dia(modelo.dia)} às #{hora(modelo.horario)} - Professor #{modelo.professor.nome}."
        else
          @notificacao.conteudo = "#{I18n.l Date.today} - #{current_user.username.capitalize} excluiu o Horário #{dia(modelo.dia)} às #{hora(modelo.horario)} - Professor #{modelo.professor.nome}."
        end
      when "users"
        if action_name == "create"
          @notificacao.conteudo = "#{I18n.l Date.today} - #{current_user.username.capitalize} cadastrou o Usuário #{modelo.username}."  
        elsif action_name == "update"
          @notificacao.conteudo = "#{I18n.l Date.today} - #{current_user.username.capitalize} editou dados do Usuário #{modelo.username}."  
        else
          @notificacao.conteudo = "#{I18n.l Date.today} - #{current_user.username.capitalize} excluiu o Usuário #{modelo.username}."  
        end
      when "circulares"
        if action_name == "create" 
          @notificacao.conteudo = "#{I18n.l Date.today} - #{current_user.username.capitalize} cadastrou a Circular #{modelo.numero_circular}."  
        elsif action_name == "update"
          @notificacao.conteudo = "#{I18n.l Date.today} - #{current_user.username.capitalize} editou dados da Circular #{modelo.numero_circular}."  
        else
          @notificacao.conteudo = "#{I18n.l Date.today} - #{current_user.username.capitalize} excluiu a Circular #{modelo.numero_circular}."  
        end
      else
        if action_name == "create"
          @notificacao.conteudo = "#{I18n.l Date.today} - #{current_user.username.capitalize} cadastrou o #{controller_name.capitalize.singularize} #{modelo.nome}."
        elsif action_name == "update"
          @notificacao.conteudo = "#{I18n.l Date.today} - #{current_user.username.capitalize} editou dados do #{controller_name.capitalize.singularize} #{modelo.nome}."
        else
          @notificacao.conteudo = "#{I18n.l Date.today} - #{current_user.username.capitalize} excluiu o #{controller_name.capitalize.singularize} #{modelo.nome}."
        end
      end
      @notificacao.tipo = tipo
      @notificacao.visualizado = false
      @notificacao.user_id = destinatario.id
      @notificacao.save
    end  
  end
end
