# Ruby入门系列5——命令行设计 #

ruby灵感来源于多个方面，ruby的执行我们在终端中一般输入 `ruby ex15.rb`、`ruby -e "puts 'Hello,world!'"`之类的命令。而实际上，命令中也可以直接接受输入，我们将其成为命令行脚本**指令参数**。

## 从命令行输入的数据 ##

要将数据传递给脚本程序，使用命令行是非常便捷的方式。要取得命令行所传入的数据，可以使用ARGV这个数组对象。在ARGV数组中，以字符串的形式存放着在命令行对指令脚本传入的实参。

利用命令行给指定脚本指定参数的场合，在参数之间，需要用空格隔开进行输入。

```ruby
# name print_argv.rb 
print "第一个实参： ", ARGV[0], "\n"
print "第二个实参： ", ARGV[1], "\n"
print "第三个实参： ", ARGV[2], "\n"

# ruby print_argv.rb 1st 2nd 3rd
# 第一个实参 ： 1st
# 第二个实参 ： 2nd
# 第三个实参 ： 3rd
```

使用ARGV数组，就不需要将数据都写在程序中了。因为是数组，所以也可以自由取出或存入数据。

```ruby
# happybirthday.rb
name = ARGV[0]
print "Happy Birthday, ", name, "!\n"

# ruby happybirthday.rb Ruby Python JAVA
# Happy Birthday, Ruby!
```

因为从命名行实参取得的数据会是字符串，如果用它来计算，则必须转换成数组。要将字符串转换为数值，必须使用to_i方法。

```ruby
# arg_arith.rb
num0 = ARGV[0].to_i
num1 = ARGV[1].to_i

print num0, " + ", num1, " = ", num0 + num1, "\n"
print num0, " - ", num1, " = ", num0 - num1, "\n"
print num0, " * ", num1, " = ", num0 * num1, "\n"
print num0, " / ", num1, " = ", num0 / num1, "\n"

# ruby arg_arith.rb 5 3
# 5 + 3 = 8
# 5 - 3 = 2
# 5 * 3 = 15
# 5 / 3 = 1
```

下节我们整理命令行下读写文件的内容。

