require 'open-uri'
require 'pp'

rk_base = "http://runkeeper.com"
# http://runkeeper.com/user/dalcorn/activity/21763726
url = "http://runkeeper.com/user/dalcorn/activity"

doc = Nokogiri::XML(open(url, :redirect => true))

menu_items = doc.css(".accordianCellContents .menuItem")
puts "Found #{menu_items.size} activities"

activity = { }
activity["ID"] = doc.css(".menuItem.selected").first[:link][-8..-1]
activity["Type"] = doc.css("#activityTypeText").first.content
date_str = doc.css("#activityDateText").first.content
activity["Date"] = date_str.gsub(/^\s*/,'').gsub(/::.*/,'').chomp
activity["Route"] = doc.css("#mapRouteName").first.content.gsub(/^\s*/,'').gsub(/\s*$/,'')
doc.css(".activityStatsItem").each do |elem|
  label = elem.css(".labelText").first.content
  value = elem.css(".mainText").first.content
  unit = elem.css(".unitText").first.content
  activity[label] = "#{value} #{unit}"
end
activity["Notes"] = doc.css("#notes p").first.content.gsub(/\s+/,' ').gsub(/\s*$/,'')

puts pp(activity)
