class FrontController < ApplicationController
  def index
    @sub_category_recent = Article.recent
    @category1 = Category.first
  end

  def admin
    if current_user.try(:isadmin?)
      @m_category = Category.all
      @m_subcategory = SubCategory.all
    else
      redirect_to '/login'
    end
  end
end
