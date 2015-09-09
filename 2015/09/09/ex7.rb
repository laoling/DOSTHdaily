=begin
name : ex7.rb
author : laoling
email : <838618014@qq.com>
------------------------------------
description:本实例我们演示的是ruby中
的字符串和变量的输出。
------------------------------------
=end

puts "Mary had a little lamb."
puts "It's fleece was white as %s." % 'snow'
puts "And everywhere that Mary went."
puts "." * 10  #打印一串重复字符

end1 = "C"
end2 = "h"
end3 = "e"
end4 = "e"
end5 = "s"
end6 = "e"
end7 = "B"
end8 = "u"
end9 = "r"
end10 = "g"
end11 = "e"
end12 = "r"

#注意这里我们使用print代替puts，看看有何不同之处
print end1 + end2 + end3 + end4 + end5 + end6
# puts "\n"
print end7 + end8 + end9 + end10 + end11 + end12