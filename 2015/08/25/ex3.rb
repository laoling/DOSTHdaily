=begin
name : ex3.rb
author : laoling
email : <838618014@qq.com>
------------------------------------
description:本实例主要用于数学运算符
的使用，这里我们先主要演示整数的计算
和一些简单逻辑的判断。

本实例后面我们会接着进行这方面的扩展
1、浮点数的运算
2、其他运算符
------------------------------------
=end
puts "I will now count my chickens:"

puts "Hens", 25 + 30 / 6
puts "Roosters", 100 - 25 * 3 % 4

puts "Now I will count the eggs:"
puts 3 + 2 + 1 -5 + 4 % 2 - 1 / 4 + 6

puts "Is it true that 3 + 2 < 5 - 7 ?"
puts 3 + 2 < 5 - 7

puts "What is 3 + 2 ?", 3 + 2
puts "What is 5 - 7 ?", 5 - 7

puts "Oh,that's why it's false."

puts "How about some more."

puts "Is it greater?", 5 > -2
puts "Is it greater or equal?", 5 >= -2
puts "Is it less or equal?", 5 <= -2