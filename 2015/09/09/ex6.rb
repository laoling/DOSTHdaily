=begin
name : ex6.rb
author : laoling
email : <838618014@qq.com>
------------------------------------
description:本实例我们演示的是ruby中
的字符串用途。这里将介绍字符串中变量
的显示和印出。
1、格式化字符串
2、字符串插值
------------------------------------
=end

#格式化字符串
name1 = "Joe"
name2 = "Mary"

puts "Hello %s, where is %s?" %[name1, name2]

#字符串插值
puts "Hello #{name1}, where is #{name2}?"

#这样我们可以大量输出字符串和变量
x = "There are #{10} types of people."
binary = "binary"
do_not = "don't"
y = "There who know #{binary} and those who #{do_not}."

puts x
puts y

puts "I said: #{x}."
puts "I also said: '#{y}'."

hilarious = false
joke_evaluation = "Isn't that joke so funny?! #{hilarious}"

puts joke_evaluation

w = "This is the left side of..."
e = "a string with a right side."

puts w + e