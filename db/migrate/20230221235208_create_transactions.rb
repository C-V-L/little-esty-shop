class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.bigint :credit_card_number
      t.datetime :credit_card_expiration_date
      t.integer :result
      t.belongs_to :invoice
      t.integer :result
      
      t.timestamps
    end
  end
end
