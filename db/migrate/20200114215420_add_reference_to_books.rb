# frozen_string_literal: true

class AddReferenceToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :my_csv, index: true, foreign_key: true
    remove_reference :books, :user
  end
end
