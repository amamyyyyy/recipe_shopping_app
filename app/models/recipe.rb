class Recipe < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :serving_size, presence: true
  
  # 材料は配列として保存（PostgreSQLのarray型またはJSONを使用）
  # 例: [
  #   { name: "玉ねぎ", quantity: "1", unit: "個" },
  #   { name: "豚肉", quantity: "200", unit: "g" }
  # ]
  

  def shopping_list
    # テキストから材料リストを生成
    ingredients.to_s.split("\n").map do |ingredient|
      # 材料の形式を解析（例：「100g 卵」や「卵 2個」など）
      parts = ingredient.split(/\s+/)
      
      if parts.length > 1 && parts.first.match?(/^\d+\.?\d*/)
        {
          name: parts[1..-1].join(' '),
          quantity: parts.first,
          unit: parts.length > 2 ? parts[2] : ''
        }
      else
        {
          name: ingredient,
          quantity: '1',
          unit: ''
        }
      end
    end
  end
end