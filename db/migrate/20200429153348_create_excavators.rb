class CreateExcavators < ActiveRecord::Migration[6.0]
  def change
    create_table :excavators do |t|
      t.references :ticket, index: true, foreign_key: true

      t.string :company_name, null: false
      t.jsonb :address, null: false, default: {}
      t.boolean :crew_on_site, null: false, default: false

      t.timestamps
    end
  end
end
