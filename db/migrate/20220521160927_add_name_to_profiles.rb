class AddNameToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :name, :string
  end
end
