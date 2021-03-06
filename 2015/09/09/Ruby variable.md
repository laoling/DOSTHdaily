# Ruby入门系列3——变量 #

Ruby语言中变量有三类，Ruby中的变量我们不需要声明，由首字母标示符来分类。

## 1、变量的命名 ##

变量的命名由下面几个限制：

* 必须以英文字母（大小写均可）、下划线开头。（也可用汉字，但不提倡）
* 第二个字符开始可以使用数字、英文字母、下划线。
* 不能使用保留字做变量的名称。

__保留字__：保留字是给系统使用的，不能使用保留字作为变量名。

Ruby的保留字如下：

	alias   def    false  nil    return unless
	and     do     for    not    self   until
	begin   else   if     or     super  when
	break   elseif in     redo   then   while
	case    end    module rescue true   yield
	class   ensure next   retry  undef  

## 2、全局变量 ##

全局变量由$开头，可以在程序的任何位置访问到。在初始化之前，全局变量有一个特殊的值nil。

```ruby
$t
puts $t
$t = "Mark"
puts $t

==begin
运行结果：
nil
Mark
==end
```

注意：由于全局变量可以在任何地方被访问，所以使用时一定要慎重。

下面列出了以$开头的特殊变量，需要注意：

* $! ：最近一次的错误信息
* $@ ：错误产生的位置
* $_ ：gets最近读的字符串
* $. ：解释器最近读的行数
* $& ：最近一次与正则表达式匹配的字符串
* $~ ：作为子表达式组的最近一次匹配
* $n ：最近匹配的第n个子表达式（和$~[n]一样）
* $= ：是否区别大小写的标志
* $/ ：输入记录分隔符
* $\ ：输出记录分隔符
* $0 ：Ruby脚本的文件名
* $* ：命令行参数
* $$ ：解释器进程ID
* $? ：最近一次执行的子进程退出状态

## 3、实例变量 ##

在Ruby中实变量由@开头，它的范围限制在self对象内。两个不同的对象即使属于同一个类也可以拥有不同值的实例变量。从对象外部看，实例变量不能改变甚至观察（如Ruby的实例变量从来不是公共的）除非方法由程序员明确声明。

像全局变量一样，实例变量在初始化前的值是nil。Ruby的实例变量也不用声明。实际上每个实例变量都是在第一次出现时动态加入对象的。

```ruby
class Test
  def set_t(t)
	@t = t
  end
  def set_n(n)
	@n = n
  end
end
```

## 4、局部变量 ##

局部变量由小写字母或下划线开头，局部变量不像全局变量和实例变量一样在初始化前含nil值。如果不进行初始化，将会出错。局部变量就是普通意义上的变量。

## 5、常量 ##

变量介绍完我们再看一下Ruby中的常量。

常量由大写字母开头，最多被赋值一次。不论常量是否定义在类中，它都可以在类外被访问。而且常量还可以定义在模块中。重复对常量赋值会产生警告。

```ruby
PASS = 5
Advanced = 12

puts PASS
puts Advanced
```