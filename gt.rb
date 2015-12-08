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
  sleep 4
#  page.all(:xpath,"//li[@class='sresult lvresult clearfix li']").each do |node|
  # this will parse through page of search results
end

collect_results('kettlebell')
=begin
Sample of single ebay list item
  <li id="item4d3bfe1e90" _sp="p2045573.m1686.l2048" listingId="331718991504" class="sresult lvresult clearfix li"
   r="1" >
   <div class="lvpic pic img left" iid="331718991504" >
      <div class="lvpicinner full-width picW">
         <a href="http://www.ebay.com/itm/Kettlenetics-Workout-Kettle-4-LB-Weight-Guide-Workout-Chart-Sweat-Bands-/331718991504?hash=item4d3bfe1e90:g:e~sAAOSwwE5WWLua" class="img imgWr2">
         <img  
            src="http://thumbs.ebaystatic.com/images/g/e~sAAOSwwE5WWLua/s-l225.jpg" class="img" alt='Kettlenetics Workout Kettle 4 LB Weight,  Guide, Workout Chart, &amp; Sweat Bands' />
         </a>
      </div>
   </div>
   <h3 class="lvtitle"><a href="http://www.ebay.com/itm/Kettlenetics-Workout-Kettle-4-LB-Weight-Guide-Workout-Chart-Sweat-Bands-/331718991504?hash=item4d3bfe1e90:g:e~sAAOSwwE5WWLua"  class="vip" title="Click this link to access Kettlenetics Workout Kettle 4 LB Weight,  Guide, Workout Chart, &amp; Sweat Bands">Kettlenetics Workout Kettle 4 LB Weight,  Guide, Workout Chart, & Sweat Bands</a>
   </h3>
   <ul class="lvprices left space-zero">
      <li class="lvprice prc">
         <span  class="bold bidsold">$2.00</span>
      </li>
      <li class="lvformat">
         <span >2 bids</span>
      </li>
      <li class="lvextras">
         <div class="hotness bold">
         </div>
         <div class="anchors">
            <div class="group">
               <a class="anchor" href="http://www.ebay.com/sch/sis.html?_kw=Kettlenetics+Workout+Kettle+4+LB+Weight%2C++Guide%2C+Workout+Chart%2C+%26+Sweat+Bands&_id=331718991504&_sibeleafcat=179814&_isid=0&_fis=2&_ssn=adehart&ssPageName=SRCH%3ACMPL%3AVS&_bts=http%3A%2F%2Fwww.ebay.com%2Fsch%2Fi.html%3F_sacat%3D0%26LH_Sold%3D1%26_udlo%3D%26_udhi%3D%26LH_Auction%3D1%26LH_BIN%3D1%26LH_ItemCondition%3D4%26_samilow%3D%26_samihi%3D%26_sadis%3D15%26_stpos%3D19111%26_sop%3D12%26_dmd%3D1%26_ipg%3D50%26LH_Complete%3D1%26_nkw%3Dkettlebell" >View similar active items</a><br><a class="anchor" href="http://cgi5.ebay.com/ws/eBayISAPI.dll?SellLikeItem&item=331718991504&ssPageName=STRK:MEWN:LILTX" >Sell one like this</a>
            </div>
         </div>
      </li>
   </ul>
   <ul class="lvdetails left space-zero full-width">
<li class="timeleft" >
   <span class="tme" >        
   <span>Dec-04 12:25</span></span>
</li>
=end