个人开发者:调试证书最多有2个
证书分很多种:
简单点的区分: 调试Development / 发布Production

1. 打开 https://developer.apple.com/
2. 进入证书配置,右上角点击 +
3. 选择证书类型
    Development (调试证书) --> iOS App Development
    Production (发布正式)
4. 需要配置一个请求文件 : 打开钥匙串 --> 证书助理 --> 从证书颁发机构请求证书 --> 填入邮箱/常用名称/保存到磁盘
5. 上传csr文件,然后点击Generate
6. 下载证书

配置App ID
1. 进入App ID配置,点右上角添加 +
2. App ID description --> name (给Bundle ID起个名称用于区分)
3. App ID Suffix
    Explicit App ID --> 精确的App ID (com.huig.www)
    Wildcard App ID --> 通配符App ID (com.huig.*)
    App Services -->
        精确的App ID 都可以使用
        通配符App ID 能使用点的功能比较少
4. 提交

配置设备Devices
1. Register Device 注册单个设备
        设备名称
        设备UDID -> 就是设备上得UUID
    点击 Continue 添加
2. Register Multiple Devices 注册多个设备

个人账号只能添加100台设备.

配置描述文件
iOS Provisioning Profiles
点击添加 +
选择和你上面设置对应的 Development --> iOS App Development
点击 Continue
选择Select App ID 选择你添加的Bundle ID
选择证书勾选对应的证书 (默认可以全部勾选)
点击 Continue
选择设备 (就是允许使用这个账号调试的设备,一般默认全选.方便调试)
Profile Name --> 给描述文件起个名称
点击 Continue
点击下载描述文件,

配置完成,安装证书和配置文件.
一般先安装证书在安装描述文件.
安装证书会添加到钥匙串里面.
安装配置文件会打开xcode


配置发布证书
1. 打开 https://developer.apple.com/
2. 进入证书配置,右上角点击 +
3. 选择证书类型
Production (发布正式) --> App Store and Ad Hoc
点击 Continue 添加
(如果之前配置过,可以跳过这步)4. 需要配置一个请求文件 : 打开钥匙串 --> 证书助理 --> 从证书颁发机构请求证书 --> 填入邮箱/常用名称/保存到磁盘
5. 上传csr文件,然后点击Generate
6. 下载证书

配置描述文件
iOS Provisioning Profiles
点击添加 +
选择和你上面设置对应的 Distribution --> App Store
点击 Continue
选择Select App ID 选择你添加的Bundle ID
选择证书勾选对应的证书 (默认可以全部勾选)
点击 Continue
选择设备 (就是允许使用这个账号调试的设备,一般默认全选.方便调试)
Profile Name --> 给描述文件起个名称
点击 Continue
点击下载描述文件,

在打包发布之前要先去开发者网站添加版本信息
选择 iTunes Connect 进入
选择 我的App
点击 + 新建一个App
填写先关信息
回到xcode点击Product -> Archive
在右边的先关按钮检测App文件最后点击Upload to  App Store
上传成功后回到 网页中,添加构建版本,最后提交审核.


