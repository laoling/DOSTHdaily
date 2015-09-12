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

#### 13）[first..last] = val 和 [first...last] = val

以val来替换从first到last之间的内容。返回val。

#### 14）capitalize 和 capitalize!

将首字符（若为字母的话）改为大写字母，其余的改为小写字母。

capitalize生成并返回修改后的字符串。而capitalize!会修改字符串本身并返回结果，若未作修改时返回nil。

若没有正确设置$KCODE，部分汉字代码也会被修改（在shiftJIS编码中就会发生这种情况）。相反，即使设置了$KCODE，也不会修改多字节字符的字母。

#### 15）一些格式化字符串的方法

```ruby
center(width)
ljust(width)
rjust(width)
center(width[,padding])
ljust(width[,padding])
rjust(width[,padding])
```

分别返回居中、靠左、靠右的字符串，当字符串长度超过width时，将返回原字符串的拷贝。若使用了第二个参数padding的话，将使用padding来填充空白。

```ruby
string = "rubylanguage"
p string.center(26)
p string.ljust(26)
p string.rjust(26)
p string.center(26,"*%")
p string.ljust(26,"*%")
p string.rjust(26,"*%")
```

#### 16）chomp([rs]) 和 chomp!([rs])

删除字符串尾部的换行符，该换行符由rs指定。rs默认值取自变量$/的值。若rs的取值是nil的话，将不作任何动作。若rs是空字符串（段落模式）的话，将删除字符串尾部的所有的连续换行符。chomp生成并返回修改后的字符串。而chomp!会修改字符串本身并返回结果，若没有修改时返回nil。当rs的值为"\n"（默认值）时，将会把"\r"、"\r\n"、"\n"全部看作换行符并加以删除。

#### 17）chop和chop!

删除字符串末尾的字符（若字符串末尾是"\r\n"的话，就删除2个字符）。chop会生成并返回修改后的字符串，而chop!会修改字符串本身然后返回结果，若没作修改则返回nil。

#### 18）clone和dup

返回一个与原字符串内容相同的新字符串。对被冻结的字符串使用clone会得到一个同样被冻结的字符串。而使用dup就会得到一个内容相同但未被冻结的字符串。

#### 19）count(str[,str2[,…]])

返回在该字符串中str所含字符出现的次数。

str的形式为：'a-c'表示从a到c，而像'^0-9'这样在头部出现取反符号时表示取反。只有当-出现在字符串内部，而非两端时才表示指定一个范围。同样地，只有当取反符出现在字符串头部时才表示取反。另外可以使用反斜线\来对- ^ \进行转义操作。

若给多个参数，则意味着会使用所有参数的交集。

#### 20）delete 和 insert

delete(str[,str2[,…]])和delete!(str[,str2[,…]])从该字符串中删除str包含的字符。

delete会生成并返回修改后的字符串，而delete!会修改字符串本身并返回结果，若没作修改则返回nil。

insert(nth, other)在第nth个字符的前面插入other字符串。（除了返回值以外）他等同于`self[nth, 0] = other`。

#### 21）downcase 和 downcase!

将字符串中的大写字母都改为小写字母，downcase生成并返回修改后的字符串。而downcase!则会修改字符串本身并返回结果，若没有作修改，则返回nil。

若没有正确设置$KCODE，部分汉字代码也会被修改。相反，即使设置了$KCODE，也不会修改多节字符的字母。

#### 22）dump

使用反斜线表示法替换字符串中的非显示字符，并返回修改后的字符串。

#### 23）empty?

若字符串为空（也就是其长度为0），则返回真。

```ruby
puts "char".empty?  # false
puts "".empty?      # true
```

#### 24）hex 和 oct

hex：把字符串看作16进制数形式，并将其变为整数，"0x"和"0X"前缀将被忽略。若遇到[_0-9a-fA-F]之外的字符时，就只转换它前面的部分。若变换对象是空字符串，则返回0。

oct：将字符串看作是8进制字符串，并将其变为整数。oct可根据字符串的前缀（0，b，0B，0x，0X）来进行8进制以外的相关处理。若遇到不能看作整数的字符，就只变换此前的内容。若变换对象为空字符串，则返回0。

#### 25）include?(substr)

若字符串中包含substr子字符串，就返回真。若substr是从0-255之间的Fixnum时，将它看作字符代码，若包含该代码所对应的字符，就返回真。

#### 26）index(pattern[, pos]) 和 rindex(pattern[, pos])

index方法按照从左到右的顺序搜索子字符串，并返回搜索到的子字符串的左侧位置。若没有搜素到则返回nil。在参数pattern中，可以使用字符串、0-255之间的字符代码或正则表达式来指定想要搜索的子字符串。

若给出了pos，则从相应的位置开始搜索。省略pos时其默认值为0。若pos为负，则从字符串尾部找到和对应位置后开始搜索。

rindex方法按照从右向左的顺序来搜索子字符串，并返回找到的子字符串左侧的位置。若搜素失败则返回nil。在参数pattern中，可以使用字符串，从0~255之间的字符代码或正则表达式来指定想要搜素的子字符串。若给出pos，就从相应位置开始搜索。该方法的运作情况并非与index完全相反。开始搜索时，起始位置是从右向左移动，但是对比子字符串时还是从左向右进行的。

#### 27）scan

scan(re)和scan(re){|s|...}是使用正则表达式re反复对字符串进行匹配操作，并以数组的形式返回匹配成功的子字符串。若正则表达式中包含括号，则返回与括号内的pattern匹配成功的子字符串的数组。若带块调用，匹配成功的子字符串（若包含括号，则是与括号内的pattern匹配成功的字符串的数组）将成为块的形参。

#### 28）slice

slice方法的作用与[]符号类似。包含以下几种形式：

	slice(nth[, len])
	slice(substr)
	slice(first..last)
	slice(first...last)
	slice(regexp[, nth])
	slice!(nth[, len])
	slice!(substr)
	slice!(first..last)
	slice!(first...last)
	slice!(regexp[, nth])

注意，若参数超出返回则返回nil。