class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.text :question
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
