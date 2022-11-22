class AddUserToEntity < ActiveRecord::Migration[7.0]
  def change
    add_reference :entities, :user, null: false, foreign_key: {to_table: :users}
  end
end
