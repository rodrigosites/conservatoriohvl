# encoding: UTF-8
class CircularesController < ApplicationController
  before_action :set_circular, only: [:show, :edit, :update, :destroy, :circular_vigente]

  def index
    @circulares = Circular.search(params[:search], params[:page])
  end

  def show
  end

  def new
    @circular = Circular.new
  end

  def edit
  end

  def create
    @circular = Circular.new(circular_params)
    respond_to do |format|
      if @circular.save
        gera_notificacao("admin",@circular, action_name)
        format.html { redirect_to @circular, notice: "Circular nº #{@circular.numero_circular} criado com sucesso." }
        format.json { render action: 'show', status: :created, location: @circular }
      else
        format.html { render action: 'new' }
        format.json { render json: @circular.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @circular.update(circular_params)
        gera_notificacao("admin",@circular, action_name)
        format.html { redirect_to @circular, notice: "Dados da Circular nº #{@circular.numero_circular} foram atualizados com sucesso." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @circular.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @circular.destroy
    gera_notificacao("admin",@circular, action_name)
    respond_to do |format|
      format.html { redirect_to circulares_path}
      format.json { head :no_content }
    end
  end

  def circular_vigente
    @circular_antiga = Circular.where(vigente: true).first
    if @circular_antiga && @circular_antiga.id != @circular.id
      @circular_antiga.update_attribute(:vigente, false)
    end
    respond_to do |format|
      if @circular.update_attribute(:vigente, true)

        @professores = Professor.all

        @professores.each do |professor|
          professor.update_attribute(:valor_aula, @circular.salario_aula)
         end

        format.html { redirect_to circulares_path, notice: "Circular nº #{@circular.numero_circular} foi definida como vigente." }
      else
        format.html { redirect_to circulares_path, alert: "Erro ao tentar definir a Circular nº #{@circular.numero_circular} como vigente." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circular
      @circular = Circular.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def circular_params
      params.require(:circular).permit(:numero_circular,:data_circular,:valor_mensalidade,:valor_extra,:valor_profissionalizante,
      :desconto,:vigente,:taxa_matricula,:salario_aula)
    end
end
