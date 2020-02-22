class AddUserRefToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :creator, references: :users
  end
end
