
// 注意点:生成静态库必须是真机生成真机用.模拟器生成模拟器用.不能通用.切记.....

// 如果使用第三方库创建项目时默认会包含Bitcode (yes) 如果真机运行时报错,解决方式,在xcode -> targets -> build setting -> 将Bitcode改为NO



// 在 targets -> build phases -> copy files 中添加要暴露给外界的.h文件
// Debug-iphonesimulator 模拟器架构生成的文件夹
// Debug-iphoneos 真机架构生成的文件夹
// 如果xcode -> targets -> build setting -> build active architecture only ->  配置为YES 默认生成当前选择机型的架构. NO代表生成所有架构
// 查看静态库类型
// 命令 lipo -info 静态库文件名
// 简写 lipo -i 文件名

// 合并静态库命令
// lipo -create 文件1 文件2 -output 合成文件名
// 简写 lipo -c 文件1 文件2  -o 合成文件名

// 为了方便调试建议生成一个支持所有架构的库

// armv7s默认已经不输出了.如果要输出需要修改配置信息
// xcode -> targets -> build setting -> architectutes 手动添加 armv7s armv7 arm64
// 根据自己手机架构进行瘦身
// lipo 文件名称 -thin 架构 -output 文件名称
// lipo debugserver -thin armv7 -output debugserver_armv7

// 图片资源包问题
// 如果静态库中图片和项目中图片出现文件重名,为避免重名静态库应该使用Bundle文件夹

// 在项目中边开发边调试静态库,
// 首先在项目中xcode -> targets -> 点击下面加号添加一个静态库
// 然后编写好静态库选择对应静态库的targets 编译好后在 xcode -> targets -> LinkedFrameworks and Librarise 中添加对应的静态库


