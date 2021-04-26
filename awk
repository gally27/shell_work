awk中的语法格式
	awk 'BEGIN{} pattern {comands} END{}' file_name

	BEGIN{} 正式处理数据之前处理
	pattern 匹配模式
	{commands} 处理命令，可能多行
	END{} 处理完所有匹配数据后执行

awk的内置变量：
	$0  整行内容
	NF  当前行的字段个数据，也就是多少列
	NR  当前行的行号，从1开始计数
	
