# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_01_09_150654) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "empresas", force: :cascade do |t|
    t.decimal "aliquota_imposto"
    t.string "cnpj"
    t.datetime "created_at", null: false
    t.string "nome"
    t.datetime "updated_at", null: false
  end

  create_table "fornecedores", force: :cascade do |t|
    t.string "cnpj"
    t.datetime "created_at", null: false
    t.bigint "empresa_id", null: false
    t.string "nome"
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_fornecedores_on_empresa_id"
  end

  create_table "notas_fiscais", force: :cascade do |t|
    t.string "chave"
    t.datetime "created_at", null: false
    t.bigint "fornecedor_id", null: false
    t.decimal "impostos"
    t.string "numero"
    t.bigint "pedido_compra_id", null: false
    t.integer "score_conformidade"
    t.string "status"
    t.datetime "updated_at", null: false
    t.decimal "valor_total"
    t.index ["fornecedor_id"], name: "index_notas_fiscais_on_fornecedor_id"
    t.index ["pedido_compra_id"], name: "index_notas_fiscais_on_pedido_compra_id"
  end

  create_table "pedido_compras", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "empresa_id", null: false
    t.bigint "fornecedor_id", null: false
    t.string "numero"
    t.datetime "updated_at", null: false
    t.decimal "valor_previsto"
    t.index ["empresa_id"], name: "index_pedido_compras_on_empresa_id"
    t.index ["fornecedor_id"], name: "index_pedido_compras_on_fornecedor_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "allow_password_change", default: false
    t.datetime "confirmation_sent_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "image"
    t.string "name"
    t.string "nickname"
    t.string "provider", default: "email", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.json "tokens"
    t.string "uid", default: "", null: false
    t.string "unconfirmed_email"
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "fornecedores", "empresas"
  add_foreign_key "notas_fiscais", "fornecedores", column: "fornecedor_id"
  add_foreign_key "notas_fiscais", "pedido_compras"
  add_foreign_key "pedido_compras", "empresas"
  add_foreign_key "pedido_compras", "fornecedores", column: "fornecedor_id"
end
