#!/usr/bin/env ruby

tally = Hash.new(0)
   File.open('gettysburg.txt').each_line do |line|
      line.downcase.split(/\W+/).each { |w| tally[w] += 1 }
   end
total = tally.values.inject { |sum,count| sum + count }
tally.delete_if { |key,count| count < 3 || key.length < 4 }

require "rinruby"
         
x_coords = [2,4,1,2,3,9,6,5,7,6]
y_coords = [0,3,8,2,6,5,6,3,1,5]
R.keys, R.counts = tally.keys, tally.values
         
R.xc, R.yc = x_coords, y_coords
=begin
Plots a bar graph

R.eval <<EOF
   names(counts) <- keys
   barplot(rev(sort(counts)),main="Frequency of Non-Trivial Words",las=2)
   mtext("Among the #{total} words in the Gettysburg Address",3,0.45)
   rho <- round(cor(nchar(keys),counts),4)
EOF
puts "The correlation between word length and frequency is #{R.rho}."

This plots a set of points to an image file

R.image_path = ("sample.png").to_s
R.eval("numbers <- c(12,34,56,20,44,65)")
R.eval("png(filename=image_path)")
R.eval("plot(numbers)")
R.eval("dev.off()")

eBay dev site
https://go.developer.ebay.com/

=end

R.image_path = "sample2.png"
R.eval("png(filename=image_path)")
R.eval "plot(xc,yc)"
R.eval("dev.off()")
