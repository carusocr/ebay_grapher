#!/usr/bin/env ruby
=begin
start with capybara for testing, then switch to mechanize?
adv search criteria: we want...
- keyword
- only SOLD items
- ?
- choose max results (200)

Once we get results, parse through and get:

- duration of auction
- price sold for
- number of bids

=end
require 'rinruby'
require 'capybara'
require 'mechanize'

Capybara.current_driver = :selenium
include Capybara::DSL

#$agent = Mechanize.new
$target_site = 'http://www.ebay.com/sch/ebayadvsearch'
#abort "Enter a keyword" unless ARGV[0]
#search_item = ARGV[0]

def graph_results
  x_coords = [2,4,1,2,3,9,6,5,7,6]
  y_coords = [0,3,8,2,6,5,6,3,1,5]        
  R.xc, R.yc = x_coords, y_coords

  # this saves graph to a png file
  #R.image_path = "sample2.png"
  #R.eval("png(filename=image_path)")
  R.eval "plot(xc,yc)"
  sleep 3
  #R.eval("dev.off()")
end

def collect_results(search_item)
  checkboxes = ['Used','Sold listings','Auction','Buy It Now']
  visit $target_site
  page.fill_in("_nkw", :with => search_item)
  checkboxes.each do |c|
    page.check(c)
  end
  page.first(:button,"Search").click
  page.all(:xpath,"//li[@class='sresult lvresult clearfix li']").each do |n|
    puts n.first(:xpath,".//li[@class='lvprice prc']").text
    timesold = Time.parse(n.first(:xpath,".//li[@class='timeleft']").text)
    # NEED THAT DOT BEFORE THE DOUBLE SLASH! Otherwise it searches entire document
  end
  
#  puts page.first(:xpath,"//ul[@id='ListViewInner']").text
end

collect_results('kettlebell')
