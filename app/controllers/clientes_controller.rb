class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  def index
    @clientes = Cliente.all.paginate(page: params[:page]).per_page(10)
  end

  def show
  end

  def new
    @cliente = Cliente.new
  end

  def edit
  end

  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        gera_notificacao("admin",@cliente)
        format.html { redirect_to @cliente, notice: "Cliente #{@cliente.nome} criado com sucesso." }
        format.json { render action: 'show', status: :created, location: @cliente }
      else
        format.html { render action: 'new' }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: "Dados do cliente #{@cliente.nome} foram atualizados com sucesso." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to clientes_path}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:nome, :endereco, :rg, :cpf, :telefone, :celular, :email, :nascimento, :bairro, :cidade,
        :uf, :cep, :pai, :mae, :nacionalidade, :profissao)
    end
end
