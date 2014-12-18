class HorariosController < ApplicationController
before_action :set_horario, only: [:show, :edit, :update, :destroy, :remove_sala]

  def index
    @horarios = Horario.all
  end

  def show
  end

  def new
    @horario = Horario.new
  end

  def edit
  end

  def create
    @horario = Horario.new(horario_params)

    respond_to do |format|
      if @horario.save
        gera_notificacao("admin",@horario)
        format.html { redirect_to @horario, notice: "Horario #{@horario.dia.slice(2,@horario.dia.length-1)} - #{@horario.horario.to_s.slice(10..15)} criado com sucesso." }
        format.json { render action: 'show', status: :created, location: @horario }
      else
        format.html { render action: 'new' }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @horario.update(horario_params)
        format.html { redirect_to horarios_path, notice: "Dados da horario #{@horario.dia.slice(2,@horario.dia.length-1)} - #{@horario.horario.to_s.slice(10..15)} foram atualizados com sucesso." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @horario.destroy
    respond_to do |format|
      format.html { redirect_to horarios_path}
      format.json { head :no_content }
    end
  end

  def remove_sala
    respond_to do |format|
      if @horario.update_attribute(:sala_id,"")
        format.html { redirect_to horarios_path, notice: "Sala desvinculada com sucesso." }
      else
        format.html { redirect_to horarios_path, alert: "Erro ao tentar desvincular a sala." }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
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
      params.require(:horario).permit(:dia, :horario, :professor_id, :sala_id)
    end
end