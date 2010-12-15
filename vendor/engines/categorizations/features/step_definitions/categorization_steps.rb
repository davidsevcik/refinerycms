Given /^I have no categorizations$/ do
  Categorization.delete_all
end

Given /^I (only )?have categorizations titled "?([^"]*)"?$/ do |only, titles|
  Categorization.delete_all if only
  titles.split(', ').each do |title|
    Categorization.create(:name => title)
  end
end

Then /^I should have ([0-9]+) categorizations?$/ do |count|
  Categorization.count.should == count.to_i
end
