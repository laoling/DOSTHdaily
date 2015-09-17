=begin
name : ex13.rb
author : laoling
email : <838618014@qq.com>
------------------------------------
description:本实例我们演示的是ruby中
命令设计参数的基本使用。
------------------------------------
=end

first, second, third = ARGV

puts "The script is called: #{$0}"
puts "Your first variable is: #{first}"
puts "Your second variable is: #{second}"
puts "Your third variable is #{third}"