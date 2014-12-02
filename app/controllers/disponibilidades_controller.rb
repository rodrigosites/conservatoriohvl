class DisponibilidadesController < ApplicationController

  before_action :set_disponibilidade, only: [:show, :edit, :update, :destroy]

  def index
    @disponibilidades = Disponibilidade.all
  end

  def show
  end

  def new
    @disponibilidade = Disponibilidade.new
  end

  def edit
  end

  def create
    @disponibilidade = Disponibilidade.new(disponibilidade_params)

    respond_to do |format|
      if @disponibilidade.save
        format.html { redirect_to @disponibilidade, notice: "disponibilidade #{@disponibilidade.horario} criado com sucesso." }
        format.json { render action: 'show', status: :created, location: @disponibilidade }
      else
        format.html { render action: 'new' }
        format.json { render json: @disponibilidade.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @disponibilidade.update(disponibilidade_params)
        format.html { redirect_to @disponibilidade, notice: "Dados da Disponibilidade #{@disponibilidade.horario} foram atualizados com sucesso." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @disponibilidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @disponibilidade.destroy
    respond_to do |format|
      format.html { redirect_to disponibilidades_path}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disponibilidade
      @disponibilidade = Disponibilidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disponibilidade_params
      params.require(:disponibilidade).permit(:dia, :horario, :idprofessor)
    end

end
