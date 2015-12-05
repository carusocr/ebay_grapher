#!/usr/bin/env ruby
=begin
start with capybara for testing, then switch to mechanize?
adv search criteria: we want...
- keyword
- only SOLD items
- ?

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
  visit $target_site
  page.fill_in("_nkw", :with => search_item)
  sleep 2
end

collect_results('zugs')