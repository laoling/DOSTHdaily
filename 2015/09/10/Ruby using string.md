# Ruby入门系列4——字符串及用法 #

Ruby语言的字符串是简单的8位字节序列。它们通常保存可打印字符序列，但也可以保存二进制数据。字符串是String类的对象。由于字符串应用非常广泛，我们这里就专门介绍一下。

## 1、字符串基本用法 ##

前面演示过字符串的基本使用，包括字符串的输入，引号的作用，转义字符的使用。都与其他常见语言类似，这里就不再详细介绍。我们这里主要看下Ruby的字符串处理功能。

Ruby字符串可以使用__字符串插值__功能。即可以使用`#{表达式}`来把任何Ruby表达式的值插入到字符串中。如果那个表达式是全局变量，类变量或实例变量，就可以省略大括号。如：

```ruby
a = "my age : #{11 + 11}" 
b = "line No. #$."

puts a  # my age : 22
puts b  # line No.6
```

还可以使用__构造字符串__，如%q，%Q等插入长字符串。%q和%Q用来界定单引号和双引号的范围，即字符串的起止点。跟在‘q’或者‘Q’后面的字符是分隔符，如果那个字符是括号，大括号，圆括号或者小于等于号，那么程序会一直向下读直到遇到最近的停止符号，或者到匹配到相应的符号才停止，然后把读入的字符作为一个字符串整体。如：

```ruby
a = % q/i am Andrown Pascal/
b = % Q!i am Andrown Pascal!
c = % Q(i am Andrown Pascal)

puts a
puts b
puts c 
# 运行结果全部显示i am Andrown Pascal
```

## 2、字符串常用方法 ##

#### 1）*符号

将字符串的内容重复指定次数之后，返回新字符串，案例如下：

```ruby
name = "Andrown"
name = name * 3
puts name
# 运行结果显示AndrownAndrownAndrown
```

#### 2）[]符号

对于字符串str,str[nth]以整数形式（字符代码）返回第nth字节的内容，若nth为负，则从字符串尾部算起，或nth超出范围则返回nil。

str[nth,len]返回从第nth字节算起的长度为len字节的子字符串。若nth为负数则从字符串尾部算起。若nth超出范围则返回nil。

例子如下：

```ruby
string "ThisisAromanticStory"
puts string[-1]
puts string[-6]
puts string[5]
puts string[6]
puts "- - - - - - - -"
puts string[0].chr
puts string[-1].chr
puts string[-6].chr
puts string[5].chr
puts "- " * 8

bstring = "ThisisBromanticStory"
puts bstring[0, 2]
puts bstring[-1, 3]
```

#### 3）next,next!,succ和succ!

next,next!,succ,succ!这四个方法用来返回下一个字符串。下一个是指：按照26个字母顺序或10进制数的顺序继续向下数时得到的结果。这里不考虑负号问题。若字符串中包含字母或数字的话，则其他字符将保持不变，相反地，若不包含字母或数字的话，就返回下一个ASCII字符。如果遇到多节字符串的话，则只把它当做普通的字符串来处理。另外，没有与succ动作相反的方法。

注意：next!和succ!会强制修改字符串的内容。

#### 4）[substr]符号

若字符串当中包含substr，则生成并返回一致的字符串。若不包含substr的话，就返回nil，例子如下：

```ruby
string = "This is a string"
puts string["is"] # is
puts string["su"] # nil
```

#### 5）[regexp]和[regexp, nth]符号

[regexp]和[regexp, nth]符号用来完成正则表达式匹配，与正则表达式相关的内容在后面介绍。

返回最初与regexp相匹配的子字符串。与匹配操作相关的信息被存入内部变量$~中。若与regexp的匹配失败则返回nil。

若使用了nth参数，则返回最初那个与regexp中第nth个括号相匹配的子字符串。若nth为0，则返回整个匹配的字符串。若匹配失败或没有与nth相对应的括号时，返回nil，例子如下：

```ruby
string = "This is a string"
puts string[/is/]  # is
puts $~.begin(0)   # 2
```

#### 6）length和size

length和size用来返回字符串的字节数。

```ruby
string = "This is a string"
puts string.length              # 16
puts string.size                # 16
puts "Mountain is high".length  # 16
puts "That is OK".size          # 10
```

#### 7）[first..last]符号

[first..last]用来生成并返回一个包含从索引first到索引last之间所有内容的字符串。当last超过字符串长度时，就认为它的值等于（字符串长度-1）。当first小于0或大于字符串长度，或者first>last+1时返回nil。但是若first和last中的一个或两个都为负数时，将会补足字符串的长度然后再次执行。

```ruby
string = "This is a string"
puts string[2..4]   # is
puts string[2..5]   # is i
puts string[2..6]   # is is
puts string[-2..5]  # nil
```

#### 8）[first...last]符号

将字符串的头部看做序号为0的缝隙，将字符串的末尾看做序号为字符串.length个缝隙，然后生成并返回一个包含从第first个缝隙到第last个缝隙之间的所有内容的字符串。当last大于字符串长度时，就认为它的值等于字符串的长度。

当first小于0或大于字符串长度，或者first>last时返回nil。但是若first和last中的一个或者两个都为负数时，将会补足字符串的长度然后再次执行。

```ruby
string = "This is a string"
puts string[2...6]   # is i
puts string[2..6]   # is is
```

#### 9）[nth] = val

以val来代替第nth字节的内容。若val是0~255之间的整数时，就把它看作是字符代码，并以该代码所对应的字符来进行替换操作，返回val。

```ruby
string = "This is a string"
puts string
puts string[2]
puts string[2] = "papapa"
puts string

# 运行结果：
# This is a string
# i
# papapa
# Thpapapas is a string
```

#### 10）[nth, len] = val

以val来替换从第nth字节起长度为len字节的子字符串。若nth为负数则从尾部算起，返回val。

```ruby
string = "This is a string"
puts string
puts string[2]
puts string[2, 4] = "papapa"
puts string

# 运行结果：
# This is a string
# i
# papapa
# Thpapapas a string
```

#### 11）[substr] = val

以val来替换字符串中第一个与substr相对应的子字符串。若self中不包含substr时，将引发IndexError异常。返回val。

```ruby
string = "This is a string"
puts string
puts string["is"] = "love"
puts string

# 运行结果：
# This is a string
# love
# Thlove is a string
```

#### 12）[regexp] = val 和 [regexp, nth] = val

以val来替换第一个与正则表达式regexp相匹配的子字符串。若使用了参数nth，则以val替换第一个与正则表达式regexp中第nth个括号相匹配的子字符串。若nth为0时，则以val来替换整个匹配部分。若正则表达式的匹配失败则引发IndexError异常。返回val。


