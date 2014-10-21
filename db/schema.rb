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

ActiveRecord::Schema.define(version: 20141021202745) do

  create_table "alunos", force: true do |t|
    t.integer  "idcliente"
    t.string   "nome"
    t.string   "endereco"
    t.string   "rg"
    t.string   "cpf"
    t.string   "telefone"
    t.string   "celular"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classes", force: true do |t|
    t.integer  "idprofessor"
    t.integer  "idhorario"
    t.float    "salario_professor"
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
  end

  create_table "cursos", force: true do |t|
    t.string   "nome"
    t.float    "valor"
    t.integer  "semestres"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cursos_professores", id: false, force: true do |t|
    t.integer "professor_id", null: false
    t.integer "curso_id",     null: false
  end

  add_index "cursos_professores", ["curso_id"], name: "index_cursos_professores_on_curso_id", using: :btree
  add_index "cursos_professores", ["professor_id"], name: "index_cursos_professores_on_professor_id", using: :btree

  create_table "disponibilidades", force: true do |t|
    t.integer  "idprofessor"
    t.datetime "horario"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "horarios", force: true do |t|
    t.integer  "idsala"
    t.datetime "horario"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matriculas", force: true do |t|
    t.integer  "idaluno"
    t.integer  "idcurso"
    t.integer  "idclasse"
    t.datetime "data_matricula"
    t.datetime "termino_matricula"
    t.integer  "semestre"
    t.float    "valor_mensal"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "usuarios", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end
