class ColorToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :color, :strings
  end
end
