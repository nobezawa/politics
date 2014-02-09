# -*- coding: utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :cookie_id, null: false
      t.integer :gender, null: false #性別(0:男, 1:女)
      t.text :age, null: false
      t.text :electoral_zone, null: false
      t.text :party, null: false
      t.text :voting, null: false
      t.text :policy1, null: false
      t.text :policy2, null: false
      t.text :policy3, null: false
    end
  end
end
