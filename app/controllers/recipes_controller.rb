class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: 'レシピが登録されました'
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'レシピが更新されました'
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_url, notice: 'レシピが削除されました'
  end

  def shopping_list
    # ユーザーのすべてのレシピの材料を集める
    @shopping_list = current_user.recipes.flat_map(&:shopping_list)
    
    # 材料を集約（同じ材料は合算）
    @consolidated_list = consolidate_shopping_list(@shopping_list)
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title, 
      :image,
      :description, 
      :serving_size,
      :ingredients
    ).merge(user_id: current_user.id)
  end

  def consolidate_shopping_list(list)
    # 同じ材料を集約するメソッド
    list.group_by { |item| item[:name] }
        .transform_values do |items|
          {
            name: items.first[:name],
            total_quantity: items.sum { |item| parse_quantity(item[:quantity]) },
            unit: items.first[:unit]
          }
        end
        .values
  end

  def parse_quantity(quantity)
    # 文字列の数量を数値に変換（簡易的な実装）
    quantity.to_f
  end
end