# coding: utf-8

class HorariosController < ApplicationController
before_action :set_horario, only: [:show, :edit, :update, :destroy, :remove_sala]

  def index
    @horarios = Horario.joins(:matriculas).group('horarios.id').page(params[:page]).per_page(10)
  end

  def show
  end

  def new
    @horario = Horario.new
  end

  def edit
  end

  def create
    horarios = params[:horario][:horario]
    horarios.shift
    erro = false
    unless horarios[0].nil?
      horarios.each do |horario|
        @horario = Horario.new(horario_params)
        @horario.horario = horario
        @horario.save ? gera_notificacao("admin",@horario, action_name) : erro = true
      end
    else
      @horario = Horario.new(horario_params)
      @horario.horario = params[:diferenciado][:horario]
      @horario.save ? gera_notificacao("admin",@horario, action_name) : erro = true
    end
    respond_to do |format|
      unless erro
        format.html { redirect_to controlar_horarios_path(id: @horario.professor_id), notice: "Horários cadastrados com sucesso." }
      else
        format.html { redirect_to disponivel_path(professor_id: params[:horario][:professor_id]), alert: "Houve um erro ao tentar cadastrar os horários." }
      end
    end
  end

  def update
    respond_to do |format|
      if @horario.update(horario_params)
        gera_notificacao("admin",@horario, action_name)
        format.html { redirect_to @horario.professor, notice: "Horário #{dia(@horario.dia)} - 
        #{hora(@horario.horario)} foram atualizados com sucesso." }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    respond_to do |format|
      if @horario.destroy
        gera_notificacao("admin",@horario, action_name)
        format.html { redirect_to controlar_horarios_path(id: @horario.professor_id)}
      else
        format.html { redirect_to @horario.professor, alert: "Não foi possível excluir o horário pois existem matrículas atreladas a ele."}
      end
    end
  end

  def remove_sala
    respond_to do |format|
      if @horario.update_attribute(:sala_id,"")
        format.html { redirect_to horarios_path, notice: "Sala desvinculada com sucesso." }
      else
        format.html { redirect_to horarios_path, alert: "Erro ao tentar desvincular a sala." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horario
      @horario = Horario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def horario_params
      params.require(:horario).permit(:dia, :professor_id, :sala_id, :horario => [])
    end
end