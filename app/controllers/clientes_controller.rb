# coding: utf-8
class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy, :alterna_cliente]

  def index
    @clientes = Cliente.search(params[:search], params[:page], true)
=begin
    #remover após alterar sistema com o atributo "ativo"
    @clientes.each do |cliente|
      cliente.update_attribute(:ativo, true) unless cliente.ativo?
    end
=end
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
        gera_notificacao("admin",@cliente, action_name)
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
        gera_notificacao("admin",@cliente, action_name)
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
    if @cliente.alunos.any?
      redirect_to clientes_path, alert: "Não foi possível excluir o(a) cliente #{@cliente.nome}. Primeiro você precisa excluir os alunos vinculadas."
    else
      if @cliente.destroy
        gera_notificacao("admin",@cliente, action_name)
        respond_to do |format|
          format.html { redirect_to clientes_path}
          format.json { head :no_content }
        end
      end
    end
  end

  def inativos
    @inativos = Cliente.search(params[:search], params[:page], false)
=begin
    #remover após alterar sistema com o atributo "ativo"
    @inativos.each do |inativo|
      @cliente = Cliente.new
      @cliente.id = inativo.id_ativo
      @cliente.nome = inativo.nome
      @cliente.endereco = inativo.endereco
      @cliente.rg = inativo.rg
      @cliente.cpf = inativo.cpf
      @cliente.telefone = inativo.telefone
      @cliente.celular = inativo.celular
      @cliente.email = inativo.email
      @cliente.nascimento = inativo.nascimento
      @cliente.bairro = inativo.bairro
      @cliente.cidade = inativo.cidade
      @cliente.uf = inativo.uf
      @cliente.cep = inativo.cep
      @cliente.pai = inativo.pai
      @cliente.mae = inativo.mae
      @cliente.nacionalidade = inativo.nacionalidade
      @cliente.profissao = inativo.profissao
      @cliente.ativo = false
      @cliente.save
    end
=end
  end

  def alterna_cliente
    if @cliente.ativo?
      if @cliente.alunos.any?
        redirect_to clientes_path, alert: "Exclusão cancelada. O cliente #{@cliente.nome} tem alunos vinculados. Favor excluir os alunos."
        return
      else  
        @cliente.update_attribute(:ativo, false)
      end
    else
      @cliente.update_attribute(:ativo, true)
    end
    redirect_to clientes_path, notice: "Status do cliente #{@cliente.nome} alterado com sucesso."
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
