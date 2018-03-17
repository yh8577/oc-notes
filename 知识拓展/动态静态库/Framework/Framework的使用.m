

// 注意点:
// Framework 在创建的时候默认是动态库
// 在这里导入其他需要公开的头文件
// 导入需要公开的头文件格式必须是 #import <YHTool/YHTool.h> ? xcode9 #import "YHTool.h"
// 然后还需要在 xcode -> targets - > Build phass -> Headers -> project 中想要暴露出去的头文件拖到 Public 中

// Framework 在创建的时候默认是动态库
// Framework 在项目中需要在 xcode -> targets -> General -> Embedded Binarues 中添加对应对的

// Framework 改为静态库
// 在 xcode -> targets -> Build Setting -> mach-o Type 选项修改为 static Library
