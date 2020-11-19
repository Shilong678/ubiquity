class AddReferenceToMyCsv < ActiveRecord::Migration[6.0]
  def change
    add_reference :my_csvs, :user, index: true, foreign_key: true
  end
end
