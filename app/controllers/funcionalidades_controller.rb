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
    @clientes = Cliente.search(params[:search], params[:page], true)
    @mensalidade_total = 0
    Matricula.all.each do |matricula|
      @mensalidade_total += matricula.valor_mensal
    end
    @total_matriculas = Matricula.all.size
  end

  def visualiza_folha
    @mes = params[:mes]
    @ano = params[:ano]
    unless @mes.nil? && @ano.nil?
      @mes = @mes.to_i
      @ano = @ano.to_i
      @total_salarios = 0
      @total_aulas = 0
      @folha_pagamento = []
      @professores = Professor.all
      @professores.each do |professor|
        salario = 0
        n_aulas = 0
        professor.horarios.each do |horario|
          if horario.matriculas.any? && horario.matriculas.where("data_matricula <= ?", Date.civil(@ano,@mes,-1)).size > 0
            n_aulas += 1
            if horario.matriculas.size == 1 && horario.matriculas.first.data_matricula >= Date.civil(@ano,@mes,1)
              dia = horario.dia[0].to_i
              inicio = horario.matriculas.first.data_matricula.to_date
              fim = Date.civil(@ano,@mes,-1)
              salario_parcial = 0
              inicio.upto(fim) do |x|
                if x.wday == dia && salario_parcial < professor.valor_aula
                  salario_parcial += professor.valor_aula/4
                end
              end
              salario += salario_parcial
            else
              salario += professor.valor_aula
            end
          end
        end
        # Busca nas matrículas inativas e calcula o valor do salário com base na data de matricula
        Matinativa.where("professor_id = ? OR professor_teoria_id = ?", professor.id, professor.id).each do |inativa|
          n_aulas += 1
          if inativa.professor_id == professor.id
            dia = inativa.dia_pratica
          else
            dia = inativa.dia_teoria
          end
          if inativa.data_matricula >= Date.civil(@ano,@mes,1)
            inicio = inativa.data_matricula.to_date
          else
            inicio = Date.civil(@ano,@mes,1)
          end
          if inativa.termino_matricula >= Date.civil(@ano,@mes,1) && inativa.termino_matricula <= Date.civil(@ano,@mes,-1)
            fim = inativa.termino_matricula.to_date
          else 
            fim = Date.civil(@ano,@mes,-1)
          end
          unless inicio == Date.civil(@ano,@mes,1) && fim == Date.civil(@ano,@mes,-1)
            salario_parcial = 0
            inicio.upto(fim) do |x|
              if x.wday == dia && salario_parcial < professor.valor_aula
                salario_parcial += professor.valor_aula/4
              end
            end
            salario += salario_parcial
          else
            salario += professor.valor_aula
          end
        end
        # salva o professor na collection de salarios e organiza por nome
        p = FolhaPagamento.new(professor_id: professor.id, user_id: current_user.id, mes: @mes, ano: @ano, salario: salario, n_aulas: n_aulas)
        @folha_pagamento << p
        @folha_pagamento.sort! { |a,b| Professor.find(a.professor_id).nome <=> Professor.find(b.professor_id).nome }
        @total_salarios += salario
        @total_aulas += n_aulas
      end
    end
    respond_to do |format|
      @anos = []
      @meses = (1..12).to_a
      Circular.all.each do |circular|
        @anos << circular.data_circular.year
      end
      @anos << Date.today.year
      format.html          
      format.js
    end
  end

end
