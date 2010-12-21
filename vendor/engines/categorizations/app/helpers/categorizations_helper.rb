module CategorizationsHelper

  def categorization_options(categorization, options={})
    options.reverse_merge!(:mover => nil, :selected => nil)

    items = categorization.categories.roots
    result = []
    items.each do |root|
      result += root.self_and_descendants.map do |i|
        if options[:mover].nil? || options[:mover].new_record? || options[:mover].move_possible?(i)
          if block_given?
            [yield(i), i.id]
          else
            ["#{'-' * i.level} #{i.name}", i.id]
          end
        end
      end.compact
    end
    options_for_select(result, options[:selected])
  end
end