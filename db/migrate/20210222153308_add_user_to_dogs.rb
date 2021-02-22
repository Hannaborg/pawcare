class AddUserToDogs < ActiveRecord::Migration[6.0]
  def change
    add_reference :dogs, :user, null: false, foreign_key: true
  end
end
