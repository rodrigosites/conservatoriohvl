class SalasController < ApplicationController
  before_action :set_sala, only: [:show, :edit, :update, :destroy]

  def index
    @salas = Sala.all.paginate(page: params[:page]).per_page(10)
  end

  def show
  end

  def new
    @sala = Sala.new
  end

  def edit
  end

  def create
    @sala = Sala.new(sala_params)

    respond_to do |format|
      if @sala.save
        gera_notificacao("admin",@sala)
        format.html { redirect_to @sala, notice: "sala #{@sala.nome} criado com sucesso." }
        format.json { render action: 'show', status: :created, location: @sala }
      else
        format.html { render action: 'new' }
        format.json { render json: @sala.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sala.update(sala_params)
        format.html { redirect_to @sala, notice: "Dados da sala #{@sala.nome} foram atualizados com sucesso." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sala.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @sala.destroy
    respond_to do |format|
      format.html { redirect_to salas_path}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sala
      @sala = Sala.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sala_params
      params.require(:sala).permit(:nome)
    end
end
