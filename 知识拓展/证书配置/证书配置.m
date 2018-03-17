
配置 Certificates
Production 发布证书
Development 调试证书
1. iOS App Development 调试证书
//2. Apple Push Notification service SSL (Sandbox) 调试推送证书
1>进入apple证书网页,添加证书,iOS App Development下一步要求让你上传一个CertificateSigningRequest文件,然后回到mac中选择钥匙串->钥匙串访问->证书助理->从证书颁发机构请求证书
2>邮箱地址随便填->常用名称随便->存储到磁盘->继续.
3>将保持到磁盘的文件上传到,apple证书网站->然后选择download下载到mac中
4>将下载后的 ios_development.cer 双击安装

配置Identifiers 选择Identifiers->点击加号添加->App ID Description Name: 给id起个名称,
选择选项
选项1 Explicit App ID(精确id) 格式com.huig.www
选项2 Wildcard App ID(通配符id) 格式com.huig.*
// 有些功能用不了

配置设备 Devices
1>添加一台要调试的手机

配置 Provisioning Profiles
进入Provisioning Profiles -> 选择类型 -> continue -> 选择证书 -> 选择允许那个账号使用.一般全选 Select All -> continue -> 选择那台设备可以使用 -> 也是Select All -> 给描述文件起个名称 -> continue -> download下载 





