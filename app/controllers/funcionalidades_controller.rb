# coding: utf-8

class FuncionalidadesController < ApplicationController
  
  def inicial
    @notificacoes = Notificacao.where(user_id: current_user.id)

    case Time.now.wday
      when 1
        @aulas = Aula.joins(:horario).where(horarios: {dia: '1-Segunda'})
      when 2
        @aulas = Aula.joins(:horario).where(horarios: {dia: '2-Terça'})
      when 3
        @aulas = Aula.joins(:horario).where(horarios: {dia: '3-Quarta'})
      when 4
        @aulas = Aula.joins(:horario).where(horarios: {dia: '4-Quinta'})
      when 5
        @aulas = Aula.joins(:horario).where(horarios: {dia: '5-Sexta'})
      when 6
        @aulas = Aula.joins(:horario).where(horarios: {dia: '6-Sábado'})
    end
    if @aulas
      @aulas.sort! { |a,b| a.horario.horario <=> b.horario.horario }
    end
  end

  def index
    @total = Notificacao.where(user_id: current_user.id).size
    @notificacoes = Notificacao.search(params[:search], params[:page], current_user.id)
  end

  def notificacao_lida
    @notificacao = Notificacao.find(params[:id])
    @notificacao.update_attribute(:visualizado,true)

    respond_to do |format|
      format.js { head :ok }
    end
  end

  def ler_notificacoes
    @notificacoes = Notificacao.where(user_id: current_user.id)
    @notificacoes.each do |notificacao|
      notificacao.update_attribute(:visualizado,true)
    end
    respond_to do |format|
      format.html { redirect_to inicial_path }
    end
  end

end
