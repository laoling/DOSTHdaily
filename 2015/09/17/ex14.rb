=begin
name : ex13.rb
author : laoling
email : <838618014@qq.com>
------------------------------------
description:��ʵ��������ʾ����ruby��
������Ʋ���������Ļ���ʹ�á�
------------------------------------
=end

user = ARGV.first
prompt = '> '

puts "Hi #{user},I'm the #{$0} script."
puts "I'd like to ask you a few questions."
puts "Do you like me #{user}?"
print prompt
likes = STDIN.gets.chomp()

puts "Where do you live #{user}?"
print prompt
lives = STDIN.gets.chomp()

puts "What kind of computer do you have?"
print prompt
computer = STDIN.gets.chomp()

puts "Alright, so you said #{likes} about liking me."
puts "You live in #{lives}. Not sure where that is."
puts "And you have a #{computer} computer. Nice."