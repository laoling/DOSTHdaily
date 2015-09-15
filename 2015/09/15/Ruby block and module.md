# Ruby入门系列4——块与模块 #

这节笔记内容比较少，我们简单写三个小内容的介绍。第一是基本输入、第二是块（block）、第三是模块（module）。

## 基本输入 ##

Ruby使用gets方法来解决最基本的输入问题。如我们可以这样，用`str = gets`来将用户输入的字符保存在局部变量str中。

我们前面还在例子中见过`age = gets.chomp()`这样的输入语句。chomp方法我们在前面字符串用法中讲过，这里实际上就是对gets获取到的字符串直接使用chomp方法，将字符串尾部的\r\n去掉。是一种字符串格式化的方法。

## 块（block） ##

块（block）是Ruby的一个特性，它是一种可以和方法调用相关联的代码块，如同参数。有了块我们可以减少很多方法，使编程变得简单。

### 1、块的概念

块是在大括号或者do...end之间的一组代码。

像下面这样：

```ruby
{ puts "this is a string"}

do
  puts "this is a block"
  # other code...
end
```

创建的块可以与方法的调用相关联。把块的开始放在含有方法调用的源码行的结尾处，就可以实现关联。比如我们将含puts语句的块和my方法的调用相关联，就可以这样写：

```ruby
# my方法无参数
my { puts "this is a block" }
# my方法含参数
my("show") { puts "this is a block" }
```

### 2、块的基本使用

使用ruby的yield语句方法可以一次或多次调用相关联的块。如果某个方法含有yield语句并关联了块，那么执行到yield语句的时候，就会将其所关联的块进行调用。

```ruby
def test_block
  puts "Start"
  yield
  yield
  puts "End"
end
test_block { puts "test_block" }
```

### 3、带参数的块

使用ruby的yield语句方法可以一次或多次地调用相关联的块，还可以向块传递参数。带参数的块如下所示：

```ruby
{|a,b| puts a + b}
```

参数被两条竖线包围，多个参数之间使用逗号分隔。

```ruby
def test_block
  puts "Start"
  yield(1,2)
  yield(3,4)
  puts "End"
end
test_block { |a,b| puts a + b }
```

## 模块（module） ##

模块（module）是Ruby所特有的功能之一。大致来说，是只有程序部分的集合体。类与模块最大的不同在于：

* 模块不能建立实例；
* 模块不能继承。

### 1、模块的用法

在这里介绍模块最具代表性的用途。

#### 1）提供命名空间 

命名空间（namespace）是为了让方法、常数、类名称不互相冲突而设计的机制。命名时名称简洁明快虽然是个好习惯，但像size、start这种太普通的名称可能就很容易重复。这时定义成模块的内部名称，可防止名称的冲突。

例如，Ruby将取得文件信息的相关功能都放在FileTest模块里。以模块形式提供的方法必须使用“模块名.方法名”的方式调用。以这种形式调用的方法又称为模块函数。

```ruby
# 查询文件是否存在
p FileText.exist?("/usr/bin/ruby")   # => true
# 文件大小
p FileText.size("/usr/bin/ruby")     # => 137694
```

当模块内部定义的方法及常数的名称没有与现在命名空间冲突时，省略模块名称会比较方便。使用include可以将模块所拥有的方法名称与常数名称读入现在命名空间里。例如，数值运算用的Math模块：

```ruby
p Math::PI
p Math.sqrt(2)

include Math
p PI
p sqrt(2)
```

像这样，将相关的各种功能整理成一个模块，可以以相同的命名空间来管理这些功能。

#### 2）以Mix-in方式提供功能 

将模块混进类里，称为Mix-in。在类的定义内使用include，可以将模块里所定义的方法与常数纳入类定义里。

```ruby
module MyModule
  # 想要共同提供的方法等
end

class MyClass1
  include MyModule
  # MyClass1所特有的方法
end

class MyClass2
  include MyModule
  # MyClass2所特有的方法
end
```

像这样，就可以把MyClass1与MyClass2双方共同的功能定义在MyModule中。这与类继承很相似，但用于这种时候：

* 两个类只是具有相似功能，并不想归类于相同类型（类）时；
* Ruby的继承不允许同时有多个父类，已经继承别的父类时，就无法再以继承的方式加上其他功能。

这些情况就可以使用Mix-in更弹性的处置。继承与Mix-in的关系在后面会介绍。

### 2、自定义模块

定义模块要使用module语句，语法与类几乎相同。模块名习惯以大写字母开头。

	module 模块名
	  模块定义
	end

下面我们写一个Hello类定义成模块形式。

```ruby
module HelloModule
  Version = "1.0"                   # 定义常数
  def hello(name)                   # 定义方法
	print "Hello, ", name, ".\n"
  end
  module_function :hello            # 将hello以模块函数形式公开
end

p HelloModule::Version
HelloModule::hello("Alice")

include HelloModule
p Version
hello("Alice")
```

#### 1）定义常数

与类一样，模块内部定义的常数可以直接连接在模块名称后面引用。

```ruby
p HelloModule::Version
```

#### 2）定义方法

与类一样，module内部也可以定义方法。只是方法在定义以后，只能在模块内部调用，不能使用`模块名.方法名`的方式调用。要将方法对模块外部公开，必须使用module_function。它的实参是想要公开的方法名称的符号。

在模块函数内引用self（接收者），可以取得该模块本身。这样就可以使用模块函数去改写模块本身的状态了，但一般来说模块函数通常不会去使用self。

```ruby
module FooModule
  def foo
    p self
  end
  module_function :foo
end

FooModule.foo   # => FooModule
```

另外，在类中使用Mix-in功能的目的则是为该类增加实例方法。这时self会是Mix-in目标类的实例。

由于同一个方法，会因为调用的语法而有不同的意义，最好区别开进行设计。例如专门为Mix-in而设计的模块就不应该提供模块函数。




