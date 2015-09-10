=begin
name : ex11.rb
author : laoling
email : <838618014@qq.com>
------------------------------------
description:本实例我们演示的是ruby中
如何接受字符的输入。
------------------------------------
=end

print "How old are you?"
age = gets.chomp()
print "How tall are you?"
height = gets.chomp()
print "How much do you weight?"
weight = gets.chomp()

puts "So,you're #{age} old, #{height} tall and #{weight} heavy."