class CreateUserCarBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :user_car_brands do |t|
      t.references :car_detail, null: false, foreign_key: true
      t.references :car_brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
