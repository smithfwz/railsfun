class ChangeProductsPrice < ActiveRecord::Migration
  def up
  	change_column :products, :price, :decimal, precision: 10, scale: 2
  end

  def down
  	change_column :products, :price, :decimal, precision: 6, scale: 2
  end
end
