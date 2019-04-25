class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :user
      t.belongs_to :commenteable, polymorphic: true, index: true
    end
  end
end
