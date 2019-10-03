class RenameSubstring < ActiveRecord::Migration[5.0]
  def change
    rename_column :portfolios, :substring, :subtitle 
  end
end
