class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, presence: true
  validates :description, presence: true
  validates :serving_size, presence: true
  
  # 材料は配列として保存（PostgreSQLのarray型またはJSONを使用）
  # 例: [
  #   { name: "玉ねぎ", quantity: "1", unit: "個" },
  #   { name: "豚肉", quantity: "200", unit: "g" }
  # ]
  
  # 買い物リストを取得するメソッド
  def shopping_list
    ingredients.map do |ingredient|
      "#{ingredient[:name]} #{ingredient[:quantity]}#{ingredient[:unit]}"
    end
  end
end