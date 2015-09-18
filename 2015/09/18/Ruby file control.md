# Ruby入门系列6——读写文件 #

Ruby脚本接收的输入不止是从命令行，还可以直接从文件中读取数据。这里我们就试着使用Ruby处理文件。

## 1、读入文件内的文本数据并显示 ##

首先，试着来写一段程序显示文本文件内的所有内容。要达到目的，我们的程序流程如下：

1. 打开文件。
2. 读入文件内的文本数据。
3. 输出读入的文本数据。
4. 关闭文件。

下面我们用程序来实现这个流程。

```ruby
# read_text.rb
filename = ARGV
file = open(filename)
text = file.read
print text
file.close
```

## 2、从文件逐行读入数据并显示出来 ##

前面已经成功地一口气把文本数据读进来并输出到屏幕上了，但前面这种做法存在以下问题：

* 一口气读入输入很花时间；
* 瞬间大量的数据要塞进内存，文件很大的时候就不妙了。

有时候文件可能大小过百万行，而我们只需要前面的几行内容。这时，等待程序把整个文件全部读进来，只能说是时间与内存的浪费。

要解决这个问题，就必须放弃使用之前将文件全部读进来以后才开始处理的这种方式。在这里，将程序改写为每读入一行就马上显示出来，这样，使用到的内存就只有一行文字占用量而已。

```ruby
# get_text.rb
filename = ARGV
file = open(filename)

while text = file.gets do
  print text
end

file.close
```

改变从第三行代码开始。使用while语句，当条件是真的时候，才会不断反复执行。

而在此程序中，条件是`text = file.gets`。每次在调用gets方法时，就会从文件中读取出一行字符串，直到读取到文件的结尾处，会返回nil。在进行条件判断时，nil会被视为假值，所以在这里的运行情况会是这样的：

* 有读入数据时就为真 -> 继续循环；
* 没有办法继续读入数据时就为假 -> 退出循环。

## 3、只显示文件里符合特定样式的几行 ##

在UNIX中grep指令，可以使用正则表达式，从文件里找出符合特定样式的部分并显示出来。ruby中也可以写出类似的指令：

```ruby
# simple_grep.rb
pattern = Regexp.new(ARGV[0])
filename = ARGV[1]

file = open(filename)
while text = file.gets do
  if pattern =- text
	print text
  end
end

file.close
```

我们研究下这段代码：

第一行我们用一个参数来建立正则表达式对象，并存入pattern变量中。if语句这是将text获取到的一行数据与pattern加以匹配，当text匹配成功时，会打印出来。由于没有else，匹配失败时候什么事情都不会发生。在读得到的数据时，循环会不断地继续下去。