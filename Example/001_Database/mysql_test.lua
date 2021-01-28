-- win 需要先安装luaforwindows
-- linux 需要安装 luarocks 并 luarocks install luasql-mysql 
require"luasql.mysql"
 
--创建环境对象
env=luasql.mysql()
 
--连接数据库
conn=env:connect("数据库名","用户名","密码","IP地址",端口)
 
--设置数据库的编码格式
conn:execute"SET NAMES GB2312"
 
--执行数据库操作
cur=conn:execute("select * from role")
 
row=cur:fetch({},"a")
 
while row do
var=string.format("%d%s\n",row.id,row.name)
 
print(var)
 
row=cur:fetch(row,"a")
end
 
conn:close()--关闭数据库连接
env:close()--关闭数据库环境
