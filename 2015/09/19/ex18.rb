=begin
name : ex18.rb
author : laoling
email : <838618014@qq.com>
------------------------------------
description:本实例我们演示的是ruby中
函数的定义方法和基本使用。
函数的作用：
1、包含代码段并命名
2、接受参数
3、综合1、2项
------------------------------------
=end

# 我们先模仿前面的ARGV脚本写参数
def puts_two(*args)
  arg1, arg2 = args
  puts "arg1: #{arg1}, arg2: #{arg2}"
end

# 我们上面*args这样的参数实际中是无意义的
# 接收两个参数我们通常这样写
def puts_two_again(arg1, arg2)
  puts "arg1: #{arg1}, arg2: #{arg2}"
end

# 只接收一个参数的函数
def puts_one(arg)
  puts "arg: #{arg}"
end

# 没有参数的函数
def puts_none()
  puts "I got nothing."
end

puts_two("Zed", "Shaw")
puts_two_again("Hetea", "Angles")
puts_one("First!")
puts_none()

=begin
运行结果：
arg1: Zed, arg2: Shaw
arg1: Hetea, arg2: Angles
arg: First!
I got nothing.
=end