class CreatePortfolios < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolios do |t|
      t.string :title
      t.string :subtitle
      t.string :string
      t.string :body
      t.string :text
      t.string :main_image
      t.string :text
      t.string :thumb_image
      t.string :text

      t.timestamps
    end
  end
end
