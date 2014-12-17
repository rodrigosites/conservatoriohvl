class IncluiColunasEmClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :email, :string
    add_column :clientes, :nascimento, :date
    add_column :clientes, :bairro, :string
    add_column :clientes, :uf, :string
    add_column :clientes, :cidade, :string
    add_column :clientes, :cep, :string
    add_column :clientes, :pai, :string
    add_column :clientes, :mae, :string
    add_column :clientes, :nacionalidade, :string
    add_column :clientes, :profissao, :string
  end
end
