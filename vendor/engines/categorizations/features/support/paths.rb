module NavigationHelpers
  module Refinery
    module Categorizations
      def path_to(page_name)
        case page_name
        when /the list of categorizations/
          admin_categorizations_path

         when /the new categorization form/
          new_admin_categorization_path
        else
          nil
        end
      end
    end
  end
end
