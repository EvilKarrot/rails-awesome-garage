class AddImgUrlToCar < ActiveRecord::Migration[7.1]
  def change
    add_column :cars, :img_url, :string
  end
end
