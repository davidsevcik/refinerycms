class Admin::CategoriesController < Admin::BaseController

  before_filter :load_categorization
  
  crudify :category,
          :title_attribute => "name",
          :order => "lft ASC",
          :include => [:children, :parent],
          :paging => false


  def new
    @category = @categorization.categories.build
  end


  protected

  def load_categorization
    @categorization = Categorization.find(params[:categorization_id])
  end


  def crudify_redirect
    admin_categorization_categories_path(@categorization)
  end

  def crudify_conditions
    {:parent_id => nil, :categorization_id => @categorization.id}
  end

end

