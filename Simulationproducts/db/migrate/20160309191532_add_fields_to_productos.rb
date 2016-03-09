class AddFieldsToProductos < ActiveRecord::Migration
  def change
    add_column :productos, :tela, :string
    add_column :productos, :tipo_producto, :string
    add_column :productos, :categoria, :string
  end
end
