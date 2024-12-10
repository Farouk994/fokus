class CreateBlocklists < ActiveRecord::Migration[8.0]
  def change
    create_table :blocklists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :domain
      t.string :app_name
      t.boolean :active

      t.timestamps
    end
  end
end
