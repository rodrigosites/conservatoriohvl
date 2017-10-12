# coding: utf-8

class FinancasController < ApplicationController

  def visualiza_boletos
    @mes = params[:mes]
    @ano = params[:ano]
    unless @mes.nil? && @ano.nil?
      @mes = @mes.to_i
      @ano = @ano.to_i
      @dados_cliente = []
      @total_mensalidades = 0
      @total_matriculas = 0
      Cliente.all.each do |cliente|
        valor = 0
        n_matriculas = 0
        cliente.alunos.each do |aluno|
          aluno.matriculas.each do |matricula|
            if matricula.data_matricula.to_date <= Date.civil(@ano,@mes,-1)
              valor += matricula.valor_mensal
              n_matriculas += 1
            end
          end
          aluno.matinativas.each do |matricula|
            if matricula.data_matricula.to_date <= Date.civil(@ano,@mes,-1) && matricula.termino_matricula.to_date >= Date.civil(@ano,@mes,1)
              valor += matricula.valor_mensal
              n_matriculas += 1
            end
          end
        end
        if valor > 0
          @dados_cliente << [cliente.id,cliente.nome,valor,n_matriculas]
          @total_mensalidades += valor
          @total_matriculas += n_matriculas
        end
      end
    end
    respond_to do |format|
      @anos = (Matinativa.first.data_matricula.year.to_i..Matricula.last.data_matricula.year.to_i).to_a
      @meses = (1..12).to_a
      format.html          
      format.js
    end
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
      @aulas = []
      @professores = Professor.all
      @professores.each do |professor|
        salario = 0
        n_aulas = 0
        professor.horarios.each do |horario|
          if horario.matriculas.any? && horario.matriculas.where("data_matricula <= ?", Date.civil(@ano,@mes,-1)).size > 0
            if horario.matriculas.size == 1 && horario.matriculas.first.data_matricula >= Date.civil(@ano,@mes,1)
              dia = horario.dia[0].to_i
              inicio = horario.matriculas.first.data_matricula.to_date
              fim = Date.civil(@ano,@mes,-1)
              salario_parcial = 0
              n_aulas_aux = 0
              inicio.upto(fim) do |x|
                if x.wday == dia && salario_parcial < professor.valor_aula
                  n_aulas += 1
                  n_aulas_aux += 1
                  salario_parcial += professor.valor_aula/4
                end
              end
              salario += salario_parcial
              @aulas << [professor.id, horario.matriculas.first.aluno.id, horario.id, n_aulas_aux]
            else
              salario += professor.valor_aula
              n_aulas += 4
              @aulas << [professor.id, horario.matriculas.first.aluno.id, horario.id, 4]
            end
          end
        end
        # Busca nas matrículas inativas e calcula o valor do salário com base na data de matricula
        Matinativa.where("professor_id = ? AND termino_matricula >= ?", professor.id, Date.civil(@ano,@mes,1)).each do |inativa|
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
            n_aulas_aux = 0
            inicio.upto(fim) do |x|
              if x.wday == dia && salario_parcial < professor.valor_aula
                n_aulas += 1
                n_aulas_aux += 1
                salario_parcial += professor.valor_aula/4
              end
            end
            salario += salario_parcial
            @aulas << [professor.id, inativa.aluno_id, n_aulas_aux]
          else
            n_aulas += 4
            salario += professor.valor_aula
            @aulas << [professor.id, inativa.aluno_id, 4]
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
