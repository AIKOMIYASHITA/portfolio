class CreateUserComments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_comments do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :body

      t.timestamps
    end
    add_index :user_comments,:sender_id
    add_index :user_comments,:receiver_id
  end
end
