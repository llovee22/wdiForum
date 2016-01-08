class AddViewToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :view, :integer
  end
end
