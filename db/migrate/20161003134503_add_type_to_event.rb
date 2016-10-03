class AddTypeToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :creator_type, :string
  end
end
