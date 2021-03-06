class CategorizationsController < ApplicationController

  before_filter :find_all_categorizations
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @categorization in the line below:
    present(@page)
  end

  def show
    @categorization = Categorization.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @categorization in the line below:
    present(@page)
  end

protected

  def find_all_categorizations
    @categorizations = Categorization.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/categorizations")
  end

end
