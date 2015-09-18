=begin
name : ex16.rb
author : laoling
email : <838618014@qq.com>
------------------------------------
description:本实例我们演示的是ruby中
命令设计文件读写的基本使用。
基本命令：
close – 关闭文档。跟你编辑器的 文件->储存.. 是一样的意思。
read – 读取文档内容。你可以把结果赋给一个变量。
readline – 读取文档文字中的一行。
truncate – 清空文档，请小心使用该命令。
write(stuff) – 将 stuff 写入文档。
------------------------------------
=end

filename = ARGV.first
script = $0

puts "We're going to erase #{filename}."
puts "If you don't want that, hit CTRL-C (^C)."
puts "If you do want that, hit RETURN."

print "? "
STDIN.gets

puts "Opening the file..."
target = File.open(filename, 'w')

puts "Truncating the file. Goodbye!"
target.truncate(target.size)

puts "Now I'm going to ask you for three lines."

print "line 1: "; line1 = STDIN.gets.chomp()
print "line 2: "; line2 = STDIN.gets.chomp()
print "line 3: "; line3 = STDIN.gets.chomp()

puts "I'm going to write these to the file."

target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")

puts "And finally, we close it."
target.close()