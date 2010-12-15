class Admin::CategorizationsController < Admin::BaseController

  crudify :categorization,
          :title_attribute => 'name'


end
