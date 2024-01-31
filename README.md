## 第一部分

> 第一部分解决的情况是你的本地网络 ==> [梓喵tracker](https://tracker.azusa.wiki) 或 [梓喵主站](https://azusa.wiki) **无SNI劫持情况下的访问缓慢/不定时无法访问/访问不通**

### 1. 测试到Cloudflare的连接性并优选Cloudflare的IP。

#### 1.1 使用 [CloudflareSpeedTest](https://github.com/XIU2/CloudflareSpeedTest) 测试本地到Cloudflare最快的IP。

#### 1.2 下载 [此脚本](https://github.com/exernest/Files/releases/download/0.1/Cloudflare.bat) 并放入一个文件夹内运行，[此脚本](https://github.com/exernest/Files/releases/download/0.1/Cloudflare.bat) 会自动去 GitHub 拉取最新版 [CloudflareSpeedTest](https://github.com/XIU2/CloudflareSpeedTest)，需可正常访问 GitHub。

* 注: [此脚本](https://github.com/exernest/Files/releases/download/0.1/Cloudflare.bat) 为 Windows 脚本，仅支持64位系统；如果一直自动拉取不下来可尝试 [此连接](https://mirror.ghproxy.com/https://github.com/XIU2/CloudflareSpeedTest/releases/download/v2.2.5/CloudflareST_windows_amd64.zip) 或 [此连接](https://ghproxy.org/https://github.com/XIU2/CloudflareSpeedTest/releases/download/v2.2.5/CloudflareST_windows_amd64.zip) 下载 zip 后解压里面文件到脚本同一文件夹内。macOS和Linux用户可自行去 [CloudflareSpeedTest](https://github.com/XIU2/CloudflareSpeedTest) 项目页下载对应系统的 [CloudflareSpeedTest](https://github.com/XIU2/CloudflareSpeedTest)。

#### 1.3 运行脚本后选择要测速的项目，输入对应的数字即可开始测速。

<details>
<summary>运行脚本后类似此图</summary>
![运行脚本后类似此图](https://img.azusa.wiki/images/2024/01/28/2024-01-29-074322.png)
</details>

#### 1.4 耐心等待测速完毕并记录测速后的结果。

<details>
<summary>测速后的结果类似此图</summary>
![测速后的结果类似此图](https://img.azusa.wiki/images/2024/01/29/2024-01-29-081238.png)
</details>

* 1.4.1 如提示 **跳过下载测速/跳过输出结果**，则是当前网络环境无法连接到 Cloudflare。既此贴对你无用。
* 1.4.2 如未被 SNI劫持 只是访问 **速度慢/不通畅** 并且路由带 DNS 自定义解析功能可去路由器添加解析。
* 1.4.3 如未被 SNI劫持 只是访问 **速度慢/不通畅**；可尝试把测速结果排名靠前的任意一个 IP 写入 HOSTS 文件后关闭浏览器清空 DNS 缓存后测试访问本站。
* 1.4.4 建议优先尝试替换为 IPv6 的 IP 测速是否可以访问。

  把 [梓喵](https://azusa.wiki) 和 [梓喵tracker](https://tracker.azusa.wiki) 加入 hosts 类似这样:

  <details>
  <summary>HOSTS</summary>
  
  ```plaintext
  # 什么设备访问不了就修改什么设备的 HOSTS
  # 示例前面的 172.67.154.105 替换为你测速结果排名靠前的任意一个 IP
  # 在 HOSTS 文件添加这两行并确保其他行未添加下列俩个域名的条例
  172.67.154.105 azusa.wiki
  172.67.154.105 tracker.azusa.wiki
