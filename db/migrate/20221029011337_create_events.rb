class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :issue, null: false, foreign_key: true
      t.text :action

      t.timestamps
    end
  end
end
