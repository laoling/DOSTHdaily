# Ruby入门系列1——概述及基本输出 #

## Ruby概述 ##

这里先列出一些概述点：

1. Ruby是纯粹的面向对象语言。
2. Ruby的Web开发框架Rails是完善的MVC模式的web框架。
3. Ruby优点
	* 解释执行
		Ruby是解释型语言，因此不需要编译即可运行，这就提高了调试速度。当然也存在解释型语言执行效率低的问题。
	* 变量无类型
	* 变量不需要声明
	* 语法简单
	* 不需要内存管理
	    具有垃圾回收功能（garbage collect，GC），能自动回收不再使用的对象。
	* 纯粹的面向对象
		Ruby是纯粹的面向对象语言，因此包括整数等基本数据类型都是对象，他们都有发送信息的统一接口。在Java里面，基本类型和类是不一样的（如int是基本类型，Integer则是类）。
	* 迭代器
		迭代器可以将循环抽象化，从而使代码简洁。
	* 功能强大的字符串操作
		Ruby以Perl为样板创造出了功能强大的字符串操作和正则表达式检索功能。
	* 超长整数
		可以计算非常大的整数。
	* 可以直接访问操作系统
		Ruby可以使用UNIX的绝大部分的系统调用，单独使用Ruby也可以进行系统编程。
	* 特殊方法
	* 用模块进行混合插入
		Ruby故意舍弃了多重继承，但拥有混合插入功能。使用模块来超越类的界限以共享数据和方法等。
	* 闭包
		可以将某过程片段对象化，对象化后的该过程片段就称作闭包。
	* 功能强大的正则表达式
	* 具有错误处理功能
	* 动态加载

4. Ruby的流行

	Ruby将许多常用的功能以方法的形式提供了出来，这使得很多时候都不需要去编写函数来实现需要的功能。许多人使用过Ruby后，都发现编程的效率大大提高了。使用Ruby编程很快，开发效率高，程序员就可以提高工作效率。于是这语言越来越流行。

## 基本知识 ##

1、基本输出

我们学习一门语言，基本上都是从一个程序开始的：输出Hello World！

在ruby中这个程序很简单，如下：

```ruby
puts "Hello World!"
```

在ruby中，最基本的输出方法是puts和print。还有一个是与C语言中类似的printf，适合做格式化输出。

上面这行语句的执行有两种方式：

一种在命令行直接进行执行操作，如下

	$ ruby -e 'puts "Hello World!"'

另一种将上面的语句写入文本，保存为ex0.rb，在命令行执行

	$ ruby ex0.rb

2、引号的用法

Ruby中引号有单引号和双引号两种，单引号可以包含双引号，双引号也可以包含单引号。在大多数情况下，这两种符号是通用的。

3、转义字符输出

一个语句中字符串含义一个上标逗号，或者是双引号等等情况，这些符号都可以正常被输出语句输出。但是如果一个很长的字符串中包含多种情况呢，会造成什么情况？

我们写下面这个语句执行

```ruby
puts "I'd like a dog named "wangzai",this is a truth."
```

执行后会提示：syntax error,unexpected tIDENTIFIER,expecting end-of-input...。单双引号多重使用使得程序判断出现错误，字符串中的单双引号对结构中的引号造成混乱。

对于这样的情况，我们需要对语句中需要输出的符号进行转义，ruby中转义字符是\。修改上面的语句

```ruby
puts "I\'d like a dog named \"wangzai\",this is a truth."
```

另外，ruby中转义可以使用ASCII码表中的转义控制字符。

注意这里有个独特的东西，有些程序语言中也会有：连行符。

当语句过长时，我们希望分成多行去写，但不希望语句逻辑被中断。这个时候，我们在行末加上\符号，来达到连接语句的作用。

```ruby
puts "I\'d like a dog \
named \"wangzai\",\
this is a truth."
```

这样也能够达到上面的语句执行结果。

4、注释符

Ruby中的注释符包括两种，单行注释和多行注释。单行注释使用#符号，多行注释使用=begin和=end块。

```ruby
puts "This is a example of Commet:"
# puts "I can not see."
puts "I can see."
=begin
puts "I can not see."
puts "I can not see."
puts "I can not see."
puts "I can not see."
puts "I can not see."
=end
puts "I can see again."
```