=begin
name : ex12.rb
author : laoling
email : <838618014@qq.com>
------------------------------------
description:本实例我们演示的是ruby中
模块的基本使用。
------------------------------------
=end

require 'open-uri'

open("http://laoling.96.lt") do |f|
  f.each_line{|line| p line}
  puts f.base_uri
  puts f.content_type
  puts f.charset
  puts f.content_encoding
  puts f.last_modified
end