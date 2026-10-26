class CreateInteractions < ActiveRecord::Migration[7.2]
  def change
    create_table :interactions do |t|
      t.string :interaction_type
      t.text :history
      t.datetime :occurred_at
      t.references :customer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
