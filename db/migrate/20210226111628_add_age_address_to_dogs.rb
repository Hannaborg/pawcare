class AddAgeAddressToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :age, :integer, default: 0, null: false
    add_column :dogs, :address, :text, default: "", null: false
  end
end
