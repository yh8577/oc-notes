查看帮助 git help
查看指定命令 git help clone
搜索关键字 /clone
翻页: f 下一页 b 上一页
退出文档 输入 q

创建git文件仓库: git init
创建文件: touch cat.h
查看文件状态: git status (红色文件是没有被纳入git管理中)
添加到文件到 git 管理中: git add cat.h (添加到 git 管理中是绿色的)
提交文件: git commit -m "注释"
查看日志:  git log
添加当前目录下所有文件到git版本控制中 git add .
添加当个文件 git add 文件名

配置git账号信息 (一般只需要配置一次全局的账号即可)
配置局部账号 ----
如果没有配置默认的账号信息
添加用户名: git config user.name "huig" (用于区分谁开发的)
添加邮件地址: git config uesr.email "邮箱@outloock.com" (用于联系开发者)
文件被修改过会变成这样 modified:   cat.h
修改过的文件必须重新添加 git add .


-- 配置全局账号
git config -l (查看配置信息)
git config -e (编辑配置信息)
git config --global user.name "huig"
git config --global user.email "邮箱@outlook.com"
全局配置文件存放在电脑当前用户账号目录里 .gitconfig 文件中
注意点: 如果没有配置局部账号,会用全局账号.如果配置过局部账号会用局部账号

查看日志 : git log
git log -N (查看N个版本)
git log --pretty=oneline (用一行的方式查看简单点的日志信息)
版本号: 是40位的哈希值,是唯一的. 只要版本不一样就可以提交

增强版log : 配置一个带颜色的log别名 命令
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"

查看日志命令 git lg
只显示前7位版本包

给git命令配置起别名
配置局部命令别名
命令 git config alias.st "status" (给status 起个命名 st)
git config alias.ci "commit -m" (将参数也添加到别名中)

配置全局命令别名
命令 git config --global alias.st "status" (给status 起个命名 st)
git config --global alias.ci "commit -m" (将参数也添加到别名中)

git 版本回退/版本穿梭
git reset --hard HEAD^ (一个^代表回退一个版本)
git reset --hard f07349a (指定版本号回退)
如果文件有被commit可以通过这样进行版本穿梭

如果没有commit的文件,可以通过 git reset --hard HEAD 回退到当前最高版本
回退到当前分支的最高版本 git checkout cat.h (git中checkout可以做revert的操作,也就是版本回退)
git reflog 可以查看到每一次的修改,可以找到log查看不到的版本.
git diff (查看文件最新改动的地方)
git本地目录分为 工作区个版本库 .git文件夹就是版本库,.git以外的都是工作区
版本库: 暂存区 master --> svn trunk
master 是git创建的第一个分支
HEAD 用于指向当前分支

add : 添加到暂存区
commit : 添加到本地分支
push : 才会提交到服务器
pull : 服务器拉取

--- 多人开发 ---
git服务器可以是 ,文件夹,u盘,云盘
初始化服务器
git init --bare

克隆代码
git clone /Users/huig/Desktop/git/service
git clone 服务器路径 可以是本地服务器路径或网络路径

设置忽略文件
echo -e "然后粘贴代码最后在输入" > .gitignore
注意:
这里必须是先输入 echo -e " 代码 然后在输入 " > .gitignore
也可以手动创建一个文件把代码放进去后把文件名改成 .gitignore
.gitignore 文件必须和 .git 文件在同一级目录
将 .gitignore 文件推送到远程服务器
一定要在代码创建之前提交到服务器
git add .gitignore
git ci 提交忽略配置文件
git push

打tag标签
查看标签 git tag
打标签 git tag -a v1.0 -m "Version 1.0"
推送标签 git push origin v1.0

创建分支
git checkout -b bugfix1.0

xcode 会帮我们add 文件
只需要 commit push pull 先关操作即可

vim编辑器
想输入内容: i (地下会出现insert字样)
退出编辑: esc
退出编辑器: shift + : 输入 wq,保存退出
