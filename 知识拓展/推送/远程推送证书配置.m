
//远程通知


#pragma mark 1 --  远程通知原理
一. 开发iOS 程序的推动功能,iOS端需要做得事
1. 请求苹果获得deviceToken
2. 得到苹果返回的deviceToken
3. 发送deviceToken给公司的服务器
4. 监听用户对通知的点击

#pragma mark 2 --  配置证书
调试iOS的远程推送功能,必备条件.
1. 真机
2. 调试推送系统证书文件
1>aps_Development.cer : 某个电脑就能某个app的推送服务
2>ios_Development.cer : 让电脑具备真机调试的能力(调试设备)
3>iPhone5_qq.mobileprovision : 某台电脑就能利用某台设备调试某个程序

三,发布具有推送服务的app
1>aps_Development.cer : 如果发布的程序中包含了推送服务,就必须安装这个证书
2>ios_Development.cer : 让电脑建议呗发布程序的能力
3>qq.mobileprovistion : 某台电脑就能发布某个程序
