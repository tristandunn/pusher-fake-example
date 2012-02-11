Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^([^I]+) should see "([^"]*)"$/ do |name, text|
  using_session(name) do
    step %{I should see "#{text}"}
  end
end
