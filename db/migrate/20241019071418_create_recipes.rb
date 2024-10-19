class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :description
      t.integer :serving_size
      t.json :ingredients  # PostgreSQLの場合
      # t.text :ingredients  # SQLiteの場合（serializeを使用）
      t.references :user, null: false, foreign_key: true  # ユーザーとの関連付け


      t.timestamps
    end
  end
end
