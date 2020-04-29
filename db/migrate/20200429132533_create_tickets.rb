class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :request_number, null: false
      t.string :request_type, null: false

      t.string :sequence_number, null: false

      t.datetime :response_due_date_time_at, null: false

      t.string :primary_sa_code
      t.string :additional_sa_codes, array: true, default: []

      t.st_polygon :digsite_info, using: :gist, null: false

      t.timestamps
    end
  end
end
