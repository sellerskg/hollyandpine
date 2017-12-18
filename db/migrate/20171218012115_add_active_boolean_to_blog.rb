class AddActiveBooleanToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :active, :boolean
  end
end
