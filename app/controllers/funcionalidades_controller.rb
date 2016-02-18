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

    if Date.today.day >= 28 && !FolhaPagamento.where(mes: Date.today.month, ano: Date.today.year).any?
      @folha = true
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
    @total_matriculas = Matricula.all.size
  end

  def salario_professores
    @professores = Professor.all
    @total_salarios = 0
    @folha_pagamento = []
    @professores.each do |professor|
      salario = 0
      n_aulas = 0
      professor.horarios.each do |horario|
        if horario.matriculas.any? && horario.matriculas.where("extract(month from data_matricula) = ?", Date.today.month).count == 0
          n_aulas += 1
          if horario.matriculas.size > 1 || horario.matriculas.size == 1 && horario.matriculas.first.data_matricula.month < Date.today.month-1
              salario += professor.valor_aula
          else
            dia = horario.dia[0].to_i
            inicio = horario.matriculas.first.data_matricula.to_date
            fim = Date.civil(Date.today.year,Date.today.month-1,-1)
            salario_parcial = 0
            inicio.upto(fim) do |x|
                if x.wday == dia && salario_parcial < professor.valor_aula
                  salario_parcial += professor.valor_aula/4
                end
            end
            salario += salario_parcial
          end
        end
      end
      p = FolhaPagamento.new(professor_id: professor.id, user_id: current_user.id, mes: Date.today.month, ano: Date.today.year, salario: salario, n_aulas: n_aulas)
      @folha_pagamento << p
      @folha_pagamento.sort! { |a,b| Professor.find(a.professor_id).nome <=> Professor.find(b.professor_id).nome }
      @total_salarios += salario
    end
  end

  def salvar_folha
    if FolhaPagamento.where(mes: Date.today.month, ano: Date.today.year).any?
      redirect_to salario_professores_path, alert: "A folha de pagamento do mês #{Date.today.month}/#{Date.today.year} já existe."
      return
    else
      @professores = Professor.all
      @folha_pagamento = []
      @professores.each do |professor|
        salario = 0
        n_aulas = 0
        professor.horarios.each do |horario|
          if horario.matriculas.any? && horario.matriculas.where("extract(month from data_matricula) = ?", Date.today.month).count == 0
            n_aulas += 1
            if horario.matriculas.size > 1 || horario.matriculas.size == 1 && horario.matriculas.first.data_matricula.month < Date.today.month-1
                salario += professor.valor_aula
            else
              dia = horario.dia[0].to_i
              inicio = horario.matriculas.first.data_matricula.to_date
              fim = Date.civil(Date.today.year,Date.today.month-1,-1)
              salario_parcial = 0
              inicio.upto(fim) do |x|
                  if x.wday == dia && salario_parcial < professor.valor_aula
                    salario_parcial += professor.valor_aula/4
                  end
              end
              salario += salario_parcial
            end
          end
        end
        p = FolhaPagamento.new(professor_id: professor.id, user_id: current_user.id, mes: Date.today.month, ano: Date.today.year, salario: salario, n_aulas: n_aulas)
        @folha_pagamento << p
        @folha_pagamento.sort! { |a,b| Professor.find(a.professor_id).nome <=> Professor.find(b.professor_id).nome }
      end
      @folha_pagamento.each do |professor|
        @pagamento = FolhaPagamento.new
        @pagamento = professor
        @pagamento.save
      end
      redirect_to salario_professores_path, notice: "Folha de Pagamento referente ao mês #{Date.today.month}/#{Date.today.year} criada com sucesso."
    end
  end

  def visualiza_folha
    respond_to do |format|
      format.html           
      format.js { @folha_pagamento = FolhaPagamento.where(mes: params[:mes], ano: params[:ano])}
    end    
  end

  def rematricular_base
    @matriculas = Matricula.all
    @matriculas.each do |matricula|
      # registra a matricula com a data atual nas inativas
      @inativa = Matinativa.new
      @inativa.aluno_id = matricula.aluno_id
      @inativa.curso_id = matricula.curso_id
      @inativa.data_matricula = matricula.data_matricula
      @inativa.termino_matricula = Date.today
      @inativa.ano = matricula.ano
      @inativa.teoria_ano = matricula.teoria_ano
      @inativa.valor_mensal = matricula.valor_mensal
      @inativa.id_ativa = matricula.id
      @inativa.save
      #atualiza a data de matricula para a data desejada
      matricula.update_attribute(:data_matricula, params[:data])
      if matricula.teoria_ano != 99
        if matricula.curso.basico?
          mensalidade = Circular.where(vigente: true).first.valor_mensalidade
        else
          mensalidade = Circular.where(vigente: true).first.valor_profissionalizante
        end
        matricula.update_attribute(:valor_mensal, mensalidade)
      else
        matricula.update_attribute(:valor_mensal, Circular.where(vigente: true).first.valor_extra)
      end
    end
    redirect_to matriculas_path, notice: "Base de alunos rematriculada com sucesso para o dia #{params[:data]}."
  end

end
