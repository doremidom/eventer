class AddColumnsToEvent < ActiveRecord::Migration[5.0]
  def change
    #add_reference :event, :creator, references: :users, index: true
	add_foreign_key :event, :users, column: :creator_id
  end
end
