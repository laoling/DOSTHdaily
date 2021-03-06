# Ruby入门系列2——数学运算与逻辑运算 #

## 数字与数学运算 ##

1、数字

Ruby支持整型和浮点型两种数字类型。

整型可以是任意长度，最大值限制由机器的内存大小决定。在一定范围内，内部由二进制方式表示，内部类为Fixnum。大小超过这个范围的整数由Bignum表示，如果Fixnum计算之后超出范围，自动转换为Bignum。

因为在Ruby中所有一切都是对象，所有整数和浮点数都是按类来定义的。Numeric是所有数字类型的基类，Float和Integer类是Numeric的子类。Fixnum和Bignum都是Integer的子类型，它们分别定义了常规类型的整数和大型整数。

数字和类的关系可以从下面的例子中看出：

```ruby
puts 16665421.class
puts 5246154212145412570.class
```

输出的结果应该是：

>Fixnum
>Bignum

可以在使用整形的时候，在前面使用进制标示符，比如0表示八进制，0x表示十六进制，0b表示二进制等。而且整型数字中有一个下划线，这个下划线将被忽略。

```ruby
puts 123456
puts 123_45
puts -543
puts 123_456_789_123
puts 0xaab
puts 036
puts -0b101_01

# 输出结果
# 123456
# 12345
# -543
# 123456789123
# 2731
# 30
# -21
```

通过在一个ASCII字符或者一个转义字符前面加一个问号得到它的数字值。Control和Meta键的组合也可以使用。

```ruby
puts ?\a      # 字符的数字值
puts ?\n      # 换行符的数字值
puts ?\t      
puts ?\C-x    # Control+x的数字值
puts ?\M- \C-x
puts ?\C-?    # 删除字符的数值

# 输出结果
# 7
# 10
# 9
# 24
# 152
# 127
```

2、数字的常用方法

Numeric类具有如下常用方法，这些方法为一切数字所共有。

* abs：返回数字的绝对值。
* ceil：返回一个等于或大于数字的最小整数。
* div(other):返回数字除以other的整数商。
* modulo(other):返回数字除以other的余数。
* floor：返回一个不超过该数字的最大的整数。
* integer? :若数字为整数则返回真。
* nonzero? :若数字为0则返回nil，非0则返回自身。
* remainder(other):返回数字除以other的余数，但是余数的符号与self相同（或为0）。
* round：返回最接近该数字的整数。
* truncate:舍弃小数点后面的部分。
* zero? :若为0则返回真。
* to_s：将数字转换为字符串。

Integer类具有如下常用方法，这些方法为一切整数所共有。

* Integer.induced_from(num)：将num变为Integer类型并返回变换结果。
* chr:返回与字符代码相对应的1个字节的字符串。例如65.chr返回A。
* to_f:将整数值变为浮点数。
* to_s,to_s(base):将整数变为10进制字符串形式。若使用了参数，则把整数变为以参数为基数的字符串形式。基数只能是2-36之间的数，若超出范围则会引发ArgumentError异常。

Float类具有如下常用方法，这些方法为一切浮点数所共有。

* Float.induced_from(num):将num变换为Float并返回其结果。
* finite? :若某数值既非∞又非NaN则返回真。
* infinite? ：若某数值为+∞则返回1，若为-∞则返回-1，除此以外返回nil，浮点数除以0得∞。
* nan? :当某数值为NaN时返回真，浮点数的0除以0得NaN。
* to_i ：删除某数的小数部分后将其变为整数。

看个例子：

```ruby
i = 23
f = -33.53
puts "i:",i
puts "f:",f
puts "i.to_f:",i.to_f
puts "f.to_i:",f.to_i
puts "f.ceil:",f.ceil
puts "f.floor:",f.floor
puts "f.round:",f.round
p Math::PI
p Math:E
```

3、数学计算方法

数字常用来做数学运算，在Ruby中进行数字计算的函数集中在Math模块中。

在Math模块中，定义了两套内容相同的方法和特殊方法，因此既可以使用模块的特殊方法，又可以将模块包含到类中之后，使用它的普通方法。

Math模块的主要方法如下：

* 三角函数：Math.acos(x);Math.asin(x);Math.atan(x)。弧度返回x的反三角函数值，返回值的范围分别是[0, +π]、[-π/2, +π/2]、(-π/2, +π/2)。Math.atan2(y,x)返回[-π, +π]之间的y/x的反正切值。Math.acosh(x),Math.asinh(x),Math.atanh(x)返回x的反双曲线函数值。
* 误差函数：Math.erf(x),Math.erfc(x)返回x的误差函数、补余误差函数。
* 指数函数：Math.exp(x)返回x的指数函数的值。Math.frexp(x)返回实数x的指数部分和假数部分。
* 平方和：Math.hypot(x,y)返回sqrt(x*x + y*y)
* 指数：Math.ldexp(x,exp)先以2为底数进行exp的指数运算，然后乘以实数x，返回计算结果。
* 对数：Math.log(x)返回x的自然对数，x必为整数。若是负值返回NaN，若为0则返回-Infinity。
* 平方根：Math.sqrt(x)返回x的平方根，若x为负值，则引发ArgumentError异常，若为0引发Error::ERANGE异常。
* 常数：E自然对数的底数；PI圆周率。

## 运算符 ##

这里我们看下运算符：算术运算符，关系运算符，逻辑运算符。

1、算术运算符

符号 | 含义 | 符号 | 含义
:---|:-----|:----|:-----
`+` | 加 | `-` | 减
`*` | 乘 | `/` | 除
`%` | 取余数 | `++` | 自加
`--` | 自减 | `>>` | 右移
`<<` | 左移 | `**` | 乘方
`&` | 按位与（只用于整数） | `^` | 按位异或（只用于整数）
竖线符 | 按位或（只用于整数） | `~` | 按位非（只用于整数）

2、关系运算符

符号 | 含义 | 符号 | 含义
:---|:-----|:----|:-----
 `>` | 大于 | `>=` | 大于等于
 `<` | 小于 | `<=` | 小于等于
 `!=` | 不等于 | `==` | 等于
 eql? | 比较两个对象的值、类型是否相等 | equal? | 比较两个对象在内存中地址是否相同
 `<=>` | 比较两个对象的大小，大于、等于、小于分别返回1，0，-1 | `===` | 判断右边的对象是否在左边区间之内
 `=~` | 匹配：用来比较是否符合一个正则表达式 | `！~` | 不匹配

3、逻辑运算符

符号 | 含义 | 符号 | 含义
:---|:-----|:----|:-----
`&&` | 短路与 | and | 与
双竖线符 | 短路或 | or | 或
oxr | 异或 | `!` | 非
not | 非