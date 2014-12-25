# encoding: UTF-8

class MatriculasController < ApplicationController
  before_action :set_matricula, only: [:show, :edit, :update, :destroy, :encerrar]

  def index
    @matriculas = Matricula.where("termino_matricula is NULL")
  end

  def show
  end

  def new
    @matricula = Matricula.new
  end

  def edit
  end

  def create
    if params[:pratica][:horario_id].blank?
      redirect_to new_matricula_path, alert: "O campo Horário do curso principal não pode ficar em branco"
      return
    end
    @matricula = Matricula.new(matricula_params)
    respond_to do |format|
      if @matricula.save
        gera_notificacao("admin",@matricula)
        # salva na tabela many_to_many
        @aula = Aula.new
        @aula.horario_id = params[:pratica][:horario_id]
        @aula.matricula_id = @matricula.id
        @aula.teoria = false
        @aula.save
        unless params[:teorica][:horario_id].blank?
          @aula = Aula.new
          @aula.horario_id = params[:teorica][:horario_id]
          @aula.matricula_id = @matricula.id
          if params[:teorica][:teoria] == "Teoria"
            @aula.teoria = true
          elsif params[:teorica][:teoria] == "Musicalização Infantil"
            @aula.musicalizacao = true
          end
          @aula.save
        end
        format.html { redirect_to @matricula, notice: "Matricula criada com sucesso." }
        format.json { render action: 'show', status: :created, location: @matricula }
      else
        format.html { render action: 'new' }
        format.json { render json: @matricula.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @matricula.update(matricula_params)
        @matricula.aulas.each do |aula|
          if aula.teoria
            aula.update_attribute(:horario_id,params[:teorica][:horario_id])
          else
            aula.update_attribute(:horario_id,params[:pratica][:horario_id])
          end
        end
        format.html { redirect_to @matricula, notice: "Dados do matricula foram atualizados com sucesso." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @matricula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @matricula.destroy
    respond_to do |format|
      format.html { redirect_to matriculas_path }
      format.json { head :no_content }
    end
  end

  def busca_professores
    @curso = Curso.find params[:curso_id]
    @professores = @curso.professores
  end

  def busca_horarios
    @professor = Professor.find params[:professor_id]
    @horarios = @professor.horarios.order("dia, horario")
  end

  def busca_horarios_teoria
    @professor = Professor.find params[:professor_id]
    @horarios = @professor.horarios.order("dia, horario")
  end

  def busca_dados_curso
    @curso = Curso.find params[:curso_id]
  end

  def tipo_teoria
    if params[:tipo_teoria] == "Teoria"
      @curso = Curso.where(nome: params[:tipo_teoria]).first
      if @curso.try(:professores)
        @professores = @curso.professores
      else
        @professor = Professor.new
        @professor.nome = "Sem professores de teoria cadastrados..."
        @professores = [@professor]
      end
    elsif params[:tipo_teoria] == "Musicalização Infantil"
      @curso = Curso.where(nome: params[:tipo_teoria]).first
      if @curso.try(:professores)
        @professores = @curso.professores
      else
        @professor = Professor.new
        @professor.nome = "Sem professores de musicalização infantil cadastrados..."
        @professores = [@professor]
      end
    end
  end

  def encerrar
  end

  def encerradas
    @matriculas = Matricula.where("termino_matricula is not NULL")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matricula
      @matricula = Matricula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matricula_params
      params.require(:matricula).permit(:aluno_id, :curso_id, :data_matricula, :ano, :valor_mensal, :termino_matricula,
        :teoria_ano)
    end

end
