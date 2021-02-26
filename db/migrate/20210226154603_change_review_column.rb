class ChangeReviewColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :review, :text
    add_column :bookings, :review, :integer
  end
end
