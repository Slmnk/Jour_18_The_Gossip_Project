class CreatePmRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :pm_recipients do |t|
      t.references :recipient, index: true
      t.belongs_to :private_message
    end
  end
end
