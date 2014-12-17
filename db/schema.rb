# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141217161101) do

  create_table "alunos", force: true do |t|
    t.integer  "cliente_id"
    t.string   "nome"
    t.string   "endereco"
    t.string   "rg"
    t.string   "cpf"
    t.string   "telefone"
    t.string   "celular"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clientes", force: true do |t|
    t.string   "nome"
    t.string   "endereco"
    t.string   "rg"
    t.string   "cpf"
    t.string   "telefone"
    t.string   "celular"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.date     "nascimento"
    t.string   "bairro"
    t.string   "uf"
    t.string   "cidade"
    t.string   "cep"
    t.string   "pai"
    t.string   "mae"
    t.string   "nacionalidade"
    t.string   "profissao"
  end

  create_table "cursos", force: true do |t|
    t.string   "nome"
    t.float    "valor"
    t.integer  "anos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "horarios", force: true do |t|
    t.integer  "professor_id"
    t.integer  "sala_id"
    t.string   "dia"
    t.time     "horario"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lecionam", force: true do |t|
    t.integer  "curso_id"
    t.integer  "professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matriculas", force: true do |t|
    t.integer  "aluno_id"
    t.integer  "curso_id"
    t.integer  "horario_id"
    t.datetime "data_matricula"
    t.datetime "termino_matricula"
    t.integer  "ano"
    t.float    "valor_mensal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notificacoes", force: true do |t|
    t.string   "conteudo"
    t.boolean  "visualizado"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "professores", force: true do |t|
    t.string   "nome"
    t.string   "endereco"
    t.string   "rg"
    t.string   "cpf"
    t.string   "telefone"
    t.string   "celular"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salas", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",         null: false
    t.string   "crypted_password", null: false
    t.string   "salt",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nivel"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
