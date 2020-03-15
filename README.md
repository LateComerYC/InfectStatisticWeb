# 结对第二次作业疫情程序
疫情统计-WEB完成流程：
## 学号姓名

### 221701215杨明伟

### 221701222陈志达

### 作业链接
     -https://edu.cnblogs.com/campus/fzu/2020SPRINGS/homework/10460

## 项目介绍
     - 结对仓库，仓库名为InfectStatisticWeb，根目录下为README，codestyle文档和main文件夹。
     main文件夹下，为ignore文件以及WEB程序文件，index.jsp,Data.java,temp.jsp,varytrend.html和
     辅助文件china.js echarts.js。
     - Data.java实现了读取日志文件，处理文本信息，保存。提供getTotal，getUpdate等函数提供对
     应的全国统计信息，和昨日更新信息等接口。index.jsp渲染中国疫情地图和统计信息表格，调用Data
     提供的接口，载入数据，实现疫情数据的动态加载和可视化。varytrend.html提供全国增长趋势。
     - index.jsp可以选择日期，查看不同时间的疫情信息，格式为YYYY-MM-DD。

## 项目的构建与运行
     -这个项目是基于JavaEE的web项目，功能是实现疫情可视化。因为没有发布，所以需要用在Eclipse或者IDEA上用tomcat来预览。
     - 新建Dynamic Web Project项目，项目名为InfectStaticTest1。
     - 将index.jsp,temp.jsp,china.js,echarts.min.js,varytrend.html添加到WebContent目录下
     - 将Data.java添加到Java Resourse/src/DataTest包下
     - 将日志文件放在E：\echarts\log\目录下。
     - 运行Tomcat将项目部署到服务器上。
     - 打开浏览器，输入http://localhost:8080/InfectStaticTest1/index.jsp。


## 使用工具：
       - java：Eclipse，
       - 浏览器：谷歌chrome
       -网页：Dreamweaver
       -其他功能：echarts，git shell，Tomcat。
