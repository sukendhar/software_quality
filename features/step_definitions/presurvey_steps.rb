Given /^I parse$|^the survey$/ do |string|
  Surveyor::Parser.parse(string)
end
