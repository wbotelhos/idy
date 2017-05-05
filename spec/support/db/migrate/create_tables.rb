# frozen_string_literal: true

class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :abcdefghijklms do |t|
    end

    create_table :articles do |t|
      t.string :title
    end

    create_table :cleans do |t|
    end

    create_table :comments do |t|
      t.string :body

      t.references :article, index: true, foreign_key: true
    end

    create_table :posts do |t|
      t.string :title
    end

    create_table :users do |t|
      t.string :name
    end
  end
end
