class AddUrlNameToproducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :url_name, :string
  end
end
