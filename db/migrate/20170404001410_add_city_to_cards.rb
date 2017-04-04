class AddCityToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :city, :string
  end
end
