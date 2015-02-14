class CreateCallRequests < ActiveRecord::Migration
  def change
    create_table :call_requests do |t|
      t.string :from
      t.references :user, index: true
      t.string :response

      t.timestamps null: false
    end
    add_foreign_key :call_requests, :users
  end
end
