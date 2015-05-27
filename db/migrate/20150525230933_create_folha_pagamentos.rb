class CreateFolhaPagamentos < ActiveRecord::Migration
  def change
    create_table :folha_pagamentos do |t|
      t.integer :professor_id
      t.integer :user_id
      t.integer :mes
      t.integer :ano
      t.float :salario
      t.integer :n_aulas
      t.date :data_aprovacao
      t.timestamps
    end
  end
end
