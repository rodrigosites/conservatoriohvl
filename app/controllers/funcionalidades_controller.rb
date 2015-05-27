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
    @notificacoes = Notificacao.where("user_id = '#{current_user.id}'")
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
  
  def valor_boletos
    @clientes = Cliente.search(params[:search], params[:page])
    @mensalidade_total = 0
    Matricula.all.each do |matricula|
      @mensalidade_total += matricula.valor_mensal
    end
  end

  def salario_professores
    @professores = Professor.all
    @total_salarios = 0
    @professores.each do |professor|
      salario = 0
      professor.horarios.each do |horario|
        if horario.matriculas.any?
          #salario += 60
          if horario.matriculas.size > 1 || horario.matriculas.size == 1 && horario.matriculas.first.data_matricula.month < Date.today.month
            salario += 60
          else
            dia = horario.dia[0].to_i
            inicio = horario.matriculas.first.data_matricula.to_date
            fim = Date.civil(2015,Date.today.month,-1)
            inicio.upto(fim) do |x|
              if x.wday == dia
                salario += 15
              end
            end
          end
        end
      end
      @total_salarios += salario
    end
    @professores = Professor.search(params[:search], params[:page])
  end

  def salvar_folha
  end

end
