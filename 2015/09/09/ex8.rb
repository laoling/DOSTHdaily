=begin
name : ex7.rb
author : laoling
email : <838618014@qq.com>
------------------------------------
description:本实例我们演示的是ruby中
字符串的格式化输出。
------------------------------------
=end

formatter = "%s %s %s %s"

puts formatter %[1, 2, 3, 4]
puts formatter %["one", "two", "three", "four"]
puts formatter %[true, false, false, true]
puts formatter %[formatter, formatter, formatter, formatter]
puts formatter %[
    "I had this thing.",
    "That you could type up right.",
    "But it didn't sing.",
    "So I said goodnight."
]