-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2021-11-29 09:02:16
-- 服务器版本： 8.0.24
-- PHP 版本： 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `person_nav`
--

-- --------------------------------------------------------

--
-- 表的结构 `love_tree`
--

CREATE TABLE `love_tree` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `id_key` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `love_tree`
--

INSERT INTO `love_tree` (`id`, `name`, `date`, `content`, `id_key`) VALUES
(1, '教师松', '2021-11-03T02:48', 'sds', 'kqdqirg2p41'),
(2, '陈杰琼', '2019-08-28T20:59', '我还想你，我每天都思恋你，偷偷看你qq，看你动态，希望有一天能再次相遇！！！', '2681w3rtu42'),
(3, '陈杰琼', '2021-11-18T02:05', '我还想你，我每天都思恋你，偷偷看你qq，看你动态，希望有一天能再次相遇！！！', 'dkhj6oo82t3'),
(4, '教师松', '2021-11-16T15:04', '22362323', 'ugr3iirg1s4'),
(5, '张三', '2021-09-16T15:19', 'woaini', 'prl6rr2hyk5'),
(6, 'ceshi ', '2021-11-01T15:25', 'ssd', 'kuoe4lg57s6'),
(7, 'ceshi ', '2021-11-01T15:25', 'ssd', '55hpeir8t66'),
(8, '陈', '2019-08-18T18:34', '如果可以，我想和你一直一直在一起，不管结局是好是坏，你都不能从我的世界里消失，可惜燕辞难去，聚散无常，那便珍重吧。', '2es6ls1fof8'),
(9, '陈', '2019-08-28T18:01', '如果可以，我想和你一直一直在一起，不管结局是好是坏，你都不能从我的世界里消失，可惜燕辞难去，聚散无常，那便珍重吧。', '3ieeql632y9'),
(10, '陈', '2019-08-28T11:27', '如果可以，我想和你一直一直在一起，不管结局是好是坏，你都不能从我的世界里消失，可惜燕辞难去，聚散无常，那便珍重吧。', '4guqpslyjh10'),
(11, '琼琼', '2021-07-07T01:38', '我爱你', 's5e17grhge11');

-- --------------------------------------------------------

--
-- 表的结构 `note`
--

CREATE TABLE `note` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '代码文件',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '富文本图片',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `other` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `note`
--

INSERT INTO `note` (`id`, `name`, `answer`, `code_file`, `image`, `url`, `other`, `create_time`) VALUES
(4, 'js中监听事件addEventListener第三个参数的理解（事件的冒泡与捕获）', '第三个参数就是事件的捕获与冒泡， 为true时捕获，false时冒泡。', '', '', 'https://blog.csdn.net/AiHuanhuan110/article/details/104989237', 'javascript,监听器', '2021-07-12 03:06:36'),
(7, '使用node安装包时出现4048错误？？？', '## 原因：node 的版本太低，有些功能应用不了，下载了一个新的版本，直接安装了，没有删除低版本，但是能够安装，也能用，只是在用npm下载某些包，或者用npm 运行某个命令时，就会报4048的错误。\n\n解决：\n\n1. 删除npmrc文件，删除C:\\Users\\Administrator.npmrc文件\n2. C:\\Users\\Administrator\\AppData\\Roaming\\npm-cache 清空，\n3. 删除项目下：node_modules，\n4. 用命令清理，控制台输入：\n\n   `npm cache clean --force`\n', '', '', 'https://blog.csdn.net/dreamimport/article/details/102969431', 'node,npm', '2021-07-17 12:49:08'),
(8, '简述小程序生命周期及页面生命周期？', '> 前言：很多同学容易将小程序生命周期和页面的生命周期混淆为一起，这两个其实应该是不同却又相互关联的生命周期，所以，用实际代码操作并结合官方理论讲讲这个，好好捋捋。\n\n### 小程序生命周期\n\n* 首先小程序的生命周期函数是在`app.js`里面调用的，`App(Object)`函数用来注册一个小程序。接受一个 `Object` 参数，指定其小程序的生命周期回调；一般有`onLaunch`监听小程序初始化、`onShow`监听小程序显示、`onHide`监听小程序隐藏等生命周期回调函数。\n\n```js\n\nonLaunch() {\n  console.log(\'onLaunch监听小程序初始化\');\n}\n\nonShow() {\n  console.log(\'onShow监听小程序显示\');\n}\n\nonHide() {\n  console.log(\'onLaunch监听小程序隐藏\');\n}\n```\n\n* 从中我们可以知道小程序的生命周期函数的调用顺序为：`onLaunch`>`onShow`>`onHide`\n\n### 页面的生命周期\n\n* 页面生命周期函数就是当你每进入/切换到一个新的页面的时候，就会调用的生命周期函数。`Page(Object)` 函数用来注册一个页面。接受一个`Object`类型参数，其指定页面的初始数据、生命周期回调、事件处理函数等。\n\n```js\nonLoad(options) {\n    console.log(\'onLoad监听页面加载\');\n  }\n\n  onReady() {\n    console.log(\'onReady监听页面初次渲染完成\');\n  }\n\n  onShow() {\n    console.log(\'onShow监听页面显示\');\n  }\n\n  onHide() {\n    console.log(\'onHide监听页面隐藏\');\n  }\n\n  onUnload() {\n    console.log(\'onUnload监听页面卸载\');\n  }\n```\n\n* 从中我们可以知道小程序的生命周期函数的调用顺序为：`onLoad`>`onShow`>`onReady`。\n* 至于`onHide`函数就是当隐藏页面的时候触发。\n', 'uploads/Note_codeFile/20210717/461ec7b90745a18c4ba5e364390b7a26.js', '', 'https://www.jianshu.com/p/3f43eaa83bbd', '小程序生命周期', '2021-07-17 15:41:04'),
(10, '使用webpack进行项目的构建打包？', '> ### Webpack 是一个前端资源加载/打包工具。它将根据模块的依赖关系进行静态分析，然后将这些模块按照指定的规则生成对应的静态资源。\n\n```js\n\nconst path = require(\'path\')\nconst html = require(\'html-webpack-plugin\')\n\nmodule.exports = {\n	entry:\'./src/main.js\',\n	output:{\n		filename :\'index.js\',\n		path : path.join(__dirname,\'dist\')\n	},\n	module:{\n		rules:[\n                       {\n				test:/\\.css$/,\n				use:[\n					\'style-loader\',\n					\'css-loader\'\n				],\n			},\n			{\n				test:/\\.less$/,\n				use:[\'style-loader\',\'css-loader\',\'less-loader\']\n			},\n			{\n				test:/\\.(jpg|png|gif)$/,\n				loader:\'url-loader\',\n				options:{\n					// limit:8*1024\n				}\n			}\n		]\n	},\n\n	plugins:[\n		new html({\n			template:\'./src/index.html\'\n		})\n	],\n	mode:\'development\'\n}\n\n```\n', 'uploads/Note_codeFile/20210718/cb14d726e0f0607dce13e627e6671e02.js', '', 'https://webpack.docschina.org/', 'webpack,打包工具', '2021-07-18 12:24:13'),
(12, 'js中如何将Set结构转化成Array数组?', '### 在JavaScript中，想要将Set(集合)转换为Array数组，可以通过以下3种方式实现。\n\n```js\nlet set = new Set([1,2,3,4])\n```\n\n1. **使用Array.from()方法**\n\n   ```js\n   let arr1 = Array.from(set)\n   console.log(arr1)\n   ```\n2. **使用扩展运算符(三点运算符)**\n\n   ```js\n   let arr2 = [...set]\n   console.log(arr2)\n   ```\n3. **使用forEach**\n\n   ```js\n   let arr3 = []\n   set.forEach(item=>arr3.push(item))\n   console.log(arr3)\n   ```\n\n   相关资源：[set转array](https://blog.csdn.net/weixin_33237865/article/details/112810417)\n', '', '', '', 'javascript,ES6', '2021-07-18 16:29:42'),
(13, 'js中实现数组去重的方法？', '### javascript中去重有一下几种常见方法：\n\n```js\n    let arr = [1,2,2,3]\n```\n\n1. **使用Set结构特性去重**\n\n   ```js\n   let arr1 = Array.from(new Set(arr))\n   console.log(arr1)\n   ```\n2. **使用forEach+index.Of()去重**\n\n   ```js\n   let arr2 = []\n   arr.forEach((item,index,array)=>{\n        if(arr2.indexOf(item) == -1){\n   	 arr2.push(item)\n        }\n   })\n   console.log(arr2)\n   ```\n3. **使用filter+index.Of()去重**\n\n   ```js\n   let arr3 = []\n   arr3 = arr.filter((item,index,array) => array.indexOf(item) == index)\n   console.log(arr3)\n   ```\n4. **使用对象key不重复性去重**\n\n   ```js\n   let arr4 = []\n   let obj = {}\n\n   arr.forEach(item=>{\n           if(!obj[item]){\n              obj[item] = 1\n   	   arr4.push(item)\n   	}\n   })\n   console.log(arr4)\n   ```\n\n---\n\n其他资源：[js数组去重](https://blog.csdn.net/weixin_42412046/article/details/81459294)\n', '', '', '', '数组去重,javascript,ES6', '2021-07-18 16:59:14'),
(14, 'js中实现数组扁平化？', '### 数组扁平化：将一个多维数组转换为一个一维数组的过程就是数组的扁平化\n\n```js\nlet arr = [1,[2,[true,\'你好\'],6],[\'斩杀\',\'true\']]\n```\n\n1. **ES6中的方法：flat方法**\n\n   > 可指定深度，默认深度为1，表示只扁平化一层，传Infinity表示彻底扁平化，即arr.flat(infinity)\n   >\n\n   ```js\n   let arr1 = arr.flat(Infinity)\n   console.log(arr1)\n   ```\n2. **join split 数据类型有变化**\n\n   ```js\n   let arr2 = arr.join(\',\').split(\',\')\n   console.log(arr2)\n   ```\n3. **(同上)toString split 数据类型有变化**\n\n   ```js\n   let arr3 = arr.toString().split(\',\')\n   console.log(arr3)\n   ```\n4. **... 扩展运算符**\n\n   > ES6的扩展运算符能将二维数组转换成一维数组，根据这个结果我们可以做一个遍历，若 arr 中含有数组则使用一次扩展运算符，直至没有为止。\n   >\n\n   ```js\n   let arr4 = arr\n   while(arr4.some(item=>Array.isArray(item))) {\n   	arr4 = [].concat(...arr4);\n   }\n   console.log(arr4)\n   ```\n5. **forEach Arrat.isArray() 遍历数组，碰到数组就递归**\n\n   ```js\n   let arr5 = []\n   var flatten = function(array){\n   	array.forEach(item=>{\n   		if(Array.isArray(item)){\n   			flatten(item)\n   		}else{\n   			arr5.push(item)\n   		}\n   	})\n   }\n   flatten(arr)\n   console.log(arr5)\n   ```\n6. **使用reduce**\n\n\n   > 遍历数组每一项，若值为数组则递归遍历，否则 concat，同上\n   >\n\n   ```js\n   function flatten1(arr) {  \n   	return arr.reduce((result, item)=> {\n   		return result.concat(Array.isArray(item) ? flatten1(item) : item);\n   	}, []);\n   }\n   console.log(flatten1(arr))\n   ```\n', '', '', '', 'javascript,数组扁平化,ES6', '2021-07-19 04:15:06'),
(15, 'ES6中所包含的新语法及新特性？', '# ECMAScript 6 简介\n\n> ECMAScript 6.0（以下简称 ES6）是 JavaScript 语言的下一代标准，已经在 2015 年 6 月正式发布了。它的目标，是使得 JavaScript 语言可以用来编写复杂的大型应用程序，成为企业级开发语言。\n\n* **let和const声明变量**\n* **变量的解构赋值**\n* **模板字符串**\n* **箭头函数**\n* **扩展运算符（...）**\n* **Promise对象 async/await**\n* **改变this的指向函数 call、apply、bind**\n* **Set和Map数据结构**\n* **class类的继承**\n* **数组的循环方法 forEach、filter、some**\n* **模块化 export导出 import引入**\n* **use strict 严格模式**\n* **对象新增方法 is、assign、keys、values**\n* **symbol变量类型 独一无二的值**\n* **proxy 代理拦截**\n\n---\n\n相关资源：[ECMAScript6 入门](https://es6.ruanyifeng.com/#docs/proxy)   [ES6新增语法](https://www.jianshu.com/p/0120580f39aa)  [ES6核心特性](https://zhuanlan.zhihu.com/p/51132140)\n', '', '', 'https://es6.ruanyifeng.com/', 'ES6', '2021-07-19 08:07:32'),
(16, '如何使用git命令回退版本？', '### Git之回退版本\n\n1. #### git log\n\n\n   > 该命令显示从最近到最远的提交日志。每一次提交都有对应的 **commit id** 和  **commit message** 。\n   >\n\n   > 如果嫌弃输出的信息杂乱无章，那么加上 **--pretty=oneline** 参数试试吧！\n   >\n\n   ```\n   git log\n   ```\n\n   ```\n   git log --pretty=online\n   ```\n2. #### git reset --hard id\n\n\n   > 根据**id**回退到指定的版本，这个**id**就是刚刚**git log**查询到的**commit id**\n   >\n\n   ```\n   git reset --hard 8f04c614237bcf25a434b33fe2dd7810666367c6\n   ```\n3. #### git push\n\n\n   > 推送到本地到远程仓库：让远程仓库代码和你本地一样，到当前你本地的版本\n   >\n\n   ```\n   git push\n   ```\n\n---\n\n#### 这个时候突然又发现不需要回退了，刚才那些消失的代码又要重新找回来了，别担心，咱们 Git 强大着呢！\n\n> * **git reflog**\n>\n>   查看命令操作的历史，查找到你要的操作id ，依旧使用上文说的  ***git reset --hard id*** 。又回退到当初一模一样的版本啰！\n', '', '', 'https://www.jianshu.com/p/3020740561a8', 'Git', '2021-07-19 13:31:40'),
(17, '如何使用git分支?', '## Git之分支管理\n\n> 分支之间彼此互不干扰，各自完成各自的工作和内容，最后再 **合并到总分支(原分支)** 上，安全、不影响其他分支工作\n\n### 查看当前工作分支\n\n```js\ngit branch\n// *master\n```\n\n> 从项目创建之初，有且唯一的分支就是主分支，之后如果创建分支，就是一个一个的从分支，主分支被叫做`master`\n\n### 创建新分支\n\n```js\ngit checkout -b dev\n```\n\n> 此时就会有两个分支，并且创建好之后默认就指向 `dev分支`\n\n### 提交分支\n\n> 此时在分支dev上进行的所有提交，拉取等操作都是不影响master主分支的，跟主分支无关\n\n### 切回主分支并进行合并\n\n```js\ngit checkout master\n```\n\n```js\ngit merge master\n```\n\n> 这一次的合并称之为快速合并 `fast-forward`。只是将master的指针指向了dev最后一次提交的位置。\n\n### 删除分支\n\n```js\ngit branch -d dev\n```\n\n---\n\n相关资源：  [分支冲突](https://blog.csdn.net/silence_pinot/article/details/111478596)\n', '', '', '', 'Git', '2021-07-19 14:23:30'),
(18, '关闭浏览器当前窗口？', '#### window.close(); 关闭浏览器窗口\n', '', '', 'https://www.cnblogs.com/Nightsky-Dec/p/5776584.html', '浏览器,window对象', '2021-07-20 11:53:33'),
(19, '数组排序之sort方法原理？', '#### sort原理使用的是冒泡排序!!!\n\n* sort接收一个参数，默认是以字符编码排序；\n* 如果想按照其他标准进行排序，就需要提供比较函数，该函数要比较两个值，然后返回一个用于说明这两个值的相对顺序的数字。比较函数应该具有两个参数 a 和 b；\n* 若 a 小于 b，在排序后的数组中 a 应该出现在 b 之前，则返回一个小于 0 的值。\n* 若 a 等于 b，则返回 0。\n* 若 a 大于 b，在排序后的数组中 a 应该出现在 b 之后，则返回一个大于 0 的值。\n\n##### 举个栗子\n\n`let arr = [1,4,2,3]`\n\n`arr.sort((a,b)=>a-b)            // [1,2,3,4]`\n\n`arr.sort((a,b)=>b-a)           // [4,3,2,1]`\n\n##### 冒泡排序\n\n```js\nfor (var i = 0; i < arr.length - 1; i++) {\n	for (var j = 0; j < arr.length - i -1 ; j++) {\n		if(arr[j]>arr[j+1]){\n			let temp = arr[j]\n			arr[j] = arr[j+1]\n			arr[j+1] = temp\n		}\n	}\n}\n```\n\n\n---\n\n其他排序算法：  [十大经典排序](https://www.cnblogs.com/onepixel/articles/7674659.html)\n', '', '', 'https://www.cnblogs.com/onepixel/articles/7674659.html', 'sort,排序算法,冒泡排序', '2021-07-20 16:22:37'),
(20, '对Http状态码的理解？', '## Http之状态码\n\n当浏览者访问一个网页时，浏览者的浏览器会向网页所在服务器发出请求。当浏览器接收并显示网页前，此网页所在的服务器会返回一个包含HTTP状态码的信息头（server header）用以响应浏览器的请求。\n\n下面是常见的HTTP状态码：\n\n* 200 - 请求成功\n* 301 - 资源（网页等）被永久转移到其它URL\n* 404 - 请求的资源（网页等）不存在\n* 500 - 内部服务器错误\n\n### HTTP状态码分类\n\n> HTTP状态码由三个十进制数字组成，第一个十进制数字定义了状态码的类型。HTTP状态码共分为5种类型：\n\n| 分类 | 详细描述                                       |\n| :--- | :--------------------------------------------- |\n| 1xx  | 信息，服务器收到请求，需要请求者继续执行操作   |\n| 2xx  | 成功，操作被成功接收并处理                     |\n| 3xx  | 重定向，需要进一步的操作以完成请求             |\n| 4xx  | 客户端错误，请求包含语法错误或无法完成请求     |\n| 5xx  | 服务器错误，服务器在处理请求的过程中发生了错误 |\n\n### 状态码详细系列\n\n| 状态码 | 状态码英文名称                  | 中文描述                                                                                                                                                                           |\n| ------ | ------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |\n| 100    | Continue                        | 继续。客户端应继续其请求                                                                                                                                                           |\n| 101    | Switching Protocols             | 切换协议。服务器根据客户端的请求切换协议。只能切换到<br />更高级的协议，例如，切换到HTTP的新版本协议                                                                               |\n|        |                                 |                                                                                                                                                                                    |\n| 200    | OK                              | 请求成功。一般用于GET与POST请求                                                                                                                                                    |\n| 201    | Created                         | 已创建。成功请求并创建了新的资源                                                                                                                                                   |\n| 202    | Accepted                        | 已接受。已经接受请求，但未处理完成                                                                                                                                                 |\n| 203    | Non-Authoritative Information   | 非授权信息。请求成功。但返回的meta信息不在原始的服务<br />器，而是一个副本                                                                                                         |\n| 204    | No Content                      | 无内容。服务器成功处理，但未返回内容。在未更新网页的<br />情况下，可确保浏览器继续显示当前文档                                                                                     |\n| 205    | Reset Content                   | 重置内容。服务器处理成功，用户终端（例如：浏览器）应<br />重置文档视图。可通过此返回码清除浏览器的表单域                                                                           |\n| 206    | Partial Content                 | 部分内容。服务器成功处理了部分GET请求                                                                                                                                              |\n|        |                                 |                                                                                                                                                                                    |\n| 300    | Multiple Choices                | 多种选择。请求的资源可包括多个位置，相应可返回一个资<br />源特征与地址的列表用于用户终端（例如：浏览器）选择                                                                       |\n| 301    | Moved Permanently               | 永久移动。请求的资源已被永久的移动到新URI，返回信息<br />会包括新的URI，浏览器会自动定向到新URI。今后任何新<br />的请求都应使用新的URI代替                                         |\n| 302    | Found                           | 临时移动。与301类似。但资源只是临时被移动。客户端应<br />继续使用原有URI                                                                                                           |\n| 303    | See Other                       | 查看其它地址。与301类似。使用GET和POST请求查看                                                                                                                                     |\n| 304    | Not Modified                    | 未修改。所请求的资源未修改，服务器返回此状态码时，不<br />会返回任何资源。客户端通常会缓存访问过的资源，通过提<br />供一个头信息指出客户端希望只返回在指定日期之后修改的<br />资源 |\n| 305    | Use Proxy                       | 使用代理。所请求的资源必须通过代理访问                                                                                                                                             |\n| 306    | Unused                          | 已经被废弃的HTTP状态码                                                                                                                                                             |\n| 307    | Temporary Redirect              | 临时重定向。与302类似。使用GET请求重定向                                                                                                                                           |\n|        |                                 |                                                                                                                                                                                    |\n| 400    | Bad Request                     | 客户端请求的语法错误，服务器无法理解                                                                                                                                               |\n| 401    | Unauthorized                    | 请求要求用户的身份认证                                                                                                                                                             |\n| 402    | Payment Required                | 保留，将来使用                                                                                                                                                                     |\n| 403    | Forbidden                       | 服务器理解请求客户端的请求，但是拒绝执行此请求                                                                                                                                     |\n| 404    | Not Found                       | 服务器无法根据客户端的请求找到资源（网页）。通过此代<br />码，网站设计人员可设置\"您所请求的资源无法找到\"的个性<br />页面                                                           |\n| 405    | Method Not Allowed              | 客户端请求中的方法被禁止                                                                                                                                                           |\n| 406    | Not Acceptable                  | 服务器无法根据客户端请求的内容特性完成请求                                                                                                                                         |\n| 407    | Proxy Authentication Required   | 请求要求代理的身份认证，与401类似，但请求者应当使用<br />代理进行授权                                                                                                              |\n| 408    | Request Time-out                | 服务器等待客户端发送的请求时间过长，超时                                                                                                                                           |\n| 409    | Conflict                        | 服务器完成客户端的 PUT 请求时可能返回此代码，服务器<br />处理请求时发生了冲突                                                                                                      |\n| 410    | Gone                            | 客户端请求的资源已经不存在。410不同于404，如果资源<br />以前有现在被永久删除了可使用410代码，网站设计人员可<br />通过301代码指定资源的新位置                                       |\n| 411    | Length Required                 | 服务器无法处理客户端发送的不带Content-Length的请求<br />信息                                                                                                                       |\n| 412    | Precondition Failed             | 客户端请求信息的先决条件错误                                                                                                                                                       |\n| 413    | Request Entity Too Large        | 由于请求的实体过大，服务器无法处理，因此拒绝请求。为<br />防止客户端的连续请求，服务器可能会关闭连接。如果只是<br />服务器暂时无法处理，则会包含一个Retry-After的响应信息          |\n| 414    | Request-URI Too Large           | 请求的URI过长（URI通常为网址），服务器无法处理                                                                                                                                     |\n| 415    | Unsupported Media Type          | 服务器无法处理请求附带的媒体格式                                                                                                                                                   |\n| 416    | Requested range not satisfiable | 客户端请求的范围无效                                                                                                                                                               |\n| 417    | Expectation Failed              | 服务器无法满足Expect的请求头信息                                                                                                                                                   |\n|        |                                 |                                                                                                                                                                                    |\n| 500    | Internal Server Error           | 服务器内部错误，无法完成请求                                                                                                                                                       |\n| 501    | Not Implemented                 | 服务器不支持请求的功能，无法完成请求                                                                                                                                               |\n| 502    | Bad Gateway                     | 作为网关或者代理工作的服务器尝试执行请求时，从远程服<br />务器接收到了一个无效的响应                                                                                               |\n| 503    | Service Unavailable             | 由于超载或系统维护，服务器暂时的无法处理客户端的请求。<br />延时的长度可包含在服务器的Retry-After头信息中                                                                          |\n| 504    | Gateway Time-out                | 充当网关或代理的服务器，未及时从远端服务器获取请求                                                                                                                                 |\n| 505    | HTTP Version not supported      | 服务器不支持请求的HTTP协议的版本，无法完成处理                                                                                                                                     |\n\n\n---\n\n其他相关资源： [菜鸟教程](https://www.runoob.com/http/http-status-codes.html)   [常见http状态码](https://www.cnblogs.com/xflonga/p/9368993.html)\n', '', '', '', 'Http,Http状态码', '2021-07-21 10:41:52'),
(21, 'MySQL与MongoDB数据库它们之间的区别？', '## MySQL是关系型数据库\n\n#### **优势：**\n\n* 在不同的引擎上有不同 的存储方式。\n* 查询语句是使用传统的sql语句，拥有较为成熟的体系，成熟度很高。\n* 开源数据库的份额在不断增加，mysql的份额页在持续增长。\n\n#### **缺点：**\n\n* 在海量数据处理的时候效率会显著变慢。\n\n## MongoDB是非关系型数据库(nosql ),属于文档型数据库\n\n> 存储方式：虚拟内存+持久化。\n>\n> 查询语句：是独特的Mongodb的查询方式。\n>\n> 适合场景：事件的记录，内容管理或者博客平台等等。\n>\n> 架构特点：可以通过副本集，以及分片来实现高可用。\n>\n> 数据处理：数据是存储在硬盘上的，只不过需要经常读取的数据会被加载到内存中，将数据存储在物理内存中，从而达到高速读写。\n>\n> 成熟度与广泛度：新兴数据库，成熟度较低，Nosql数据库中最为接近关系型数据库，比较完善的DB之一，适用人群不断在增长。\n\n#### **优势：**\n\n* 在适量级的内存的Mongodb的性能是非常迅速的，它将热数据存储在物理内存中，使得热数据的读写变得十分快。高扩展性，存储的数据格式是json格式！\n\n#### **缺点：**\n\n* 不支持事务，而且开发文档不是很完全，完善。\n', '', '', 'https://blog.csdn.net/weixin_42299032/article/details/113161144', 'MySQL,MongoDB', '2021-07-24 08:57:11'),
(22, 'CSS中display : none 与visibility: hidden 的区别？', '## display与元素的隐藏\n\n如果给一个元素设置了display: none，那么该元素以及它的所有后代元素都会隐藏，它是前端开发人员使用频率最高的一种隐藏方式。隐藏后的元素无法点击，无法使用屏幕阅读器等辅助设备访问，占据的空间消失。\n\n## visibility与元素的隐藏\n\n给元素设置visibility: hidden也可以隐藏这个元素，但是隐藏元素仍需占用与未隐藏时一样的空间，也就是说虽然元素不可见了，但是仍然会影响页面布局。\n\n## 区别：\n\n* display:none是会有回流，但是visibility: hidden; 是不会有回流的\n* 两者添加点击事件都不会被触发\n* visibility具有继承性，给父元素设置visibility:hidden;子元素也会继承这个属性。但是如果重新给子元素设置visibility: visible,则子元素又会显示出来。这个和display: none有着质的区别\n* visibility: hidden不会影响计数器的计数，如：ul>li有序列表\n* CSS3的transition支持visibility属性，但是并不支持display，由于transition可以延迟执行，因此可以配合visibility使用纯css实现hover延时显示效果。提高用户体验\n', '', '', 'https://blog.csdn.net/qq_38128179/article/details/80794397', 'CSS', '2021-07-24 10:04:16'),
(23, 'vscode下载缓慢或下载失败？', '首先在官网找到需要下载的文件，点击下载。\n\n在浏览器或者下载软件中就可以看到这么一个下载地址了，将其复制下来 这里没找到一个很好的复制方法，可以上下结合，只要最后保证下载连接的准确性和完整性即可\n\n\n**然后/stable地址之前的地址换为如下内容**：\n\n[vscode.cdn.azure.cn](https://link.zhihu.com/?target=http%3A//vscode.cdn.azure.cn/) <--------就是左边这个\n\n\n更新后的地址为：[http://vscode.cdn.azure.cn/stable/78a4c91400152c0f27ba4d363eb56d2835f9903a/VSCodeUserSetup-x64-1.52.1.exe](https://link.zhihu.com/?target=http%3A//vscode.cdn.azure.cn/stable/78a4c91400152c0f27ba4d363eb56d2835f9903a/VSCodeUserSetup-x64-1.43.0.exe)\n', '', '', 'https://blog.csdn.net/zhaomengszu/article/details/112261258', 'vscode', '2021-07-28 07:34:22'),
(24, '利用backdrop-filter css属性制作毛玻璃？', '* 你可以使用 `backdrop-filter` 对兼容它的浏览器非常简单的实现毛玻璃（磨砂玻璃）效果\n* 对于不兼容 `backdrop-filter` 的浏览器，如果它只是简单背景，可以使用 `background-attachment: fixed` 配合 `filter: blur()` 进行模拟\n* 对于 firefox 浏览器，你还可以使用 `moz-element()` 配合 `filter: blur()` 实现复杂背景毛玻璃效果\n* 对于不兼容的上述 3 种效果的其他浏览器，设置了毛玻璃效果的元素，可以通过设置类似 `background: rgba(255, 255, 255, 0.5)` 的样式，使之回退到半透明效果，也算一种非常合理的降级效果，不会引起 Bug\n', '', '', 'https://juejin.cn/post/6979391400844460068', 'Css', '2021-09-23 01:38:35'),
(25, '微信小程序的背景图无法渲染，在wxss文件引入背景图片不成功?', '![](https://p1-jj.byteimg.com/tos-cn-i-t2oaga2asx/gold-user-assets/2019/3/25/169b57d5457b5b1f~tplv-t2oaga2asx-watermark.awebp)\n\n对的，这个错误提示已经很明显了，本地资源图片无法通过 WXSS 获取，可以使用网络图片，或者 base64，或者使用<image/>标签。提到的第一个方法，就是把图片上传到服务器，用服务器上图片的链接代替，这个方法比较麻烦，我就放弃了。第二个方法就是转换成base64，然后把编码全部拷贝放到属性background-image当中，即background-image:url(\"编码\")。这个方法虽说挺简单方便，但是一大串编码放到wxss文件当中，会造成视觉疲劳，更有密集恐惧这恐怕会摔电脑吧哈哈，所以只能另辟蹊径。\n\n\n### 我是怎样解决的\n\n将文件转为png格式，压缩图片的大小到40k左右\n', '', '', 'https://juejin.cn/post/6844903807000772622', '小程序,Css', '2021-09-23 02:41:08'),
(26, '小程序苹果手机去除底部横线？', '### 第一种办法：通过padding-bottom赋一个安全值\n\n\n### 第二种办法：通过bottom赋一个安全值\n', '', '', 'https://blog.csdn.net/yehaocheng520/article/details/110231158', '兼容,uniapp', '2021-11-13 10:27:53'),
(27, 'javascript之url转义escape()、encodeURI()和decodeURI() ???', '一、encodeURI()　　//转义一个URI中的字符\n\n　　语法：encodeURI(uri)　　//这个在编码不同的AJAX请求时，解决中文乱码问题经常用到。\n\n```\n        var str1 = \"你好javascript\";\n        var str2 = encodeURI(str1);\n        document.write(str2);   //输出%E4%BD%A0%E5%A5%BDjavascript \n```\n\n二、decodeURI()　　//解码一个URI中的字符\n\n　　语法：decodeURI(uri)\n\n```\n        var str1 = \"你好javascript\";\n        var str2 = encodeURI(str1);\n        document.write(str2);   //输出%E4%BD%A0%E5%A5%BDjavascript\n        var str3 = decodeURI(str2);\n        document.write(\"<br/>\" + str3)  //输出    你好javascript\n```\n\n三、encodeURIComponent()　　//转义URI组件中的字符\n\n```\n        var str1 = \"你好javascript\";\n        var str2 = encodeURIComponent(str1);\n        document.write(str2);   //输出%E4%BD%A0%E5%A5%BDjavascript\n```\n\n四、decodeURIComponent()　　//解码一个URI组件中的字符\n\n```\n        var str1 = \"你好javascript\";\n        var str2 = encodeURIComponent(str1);\n        document.write(str2);   //输出%E4%BD%A0%E5%A5%BDjavascript\n        var str3 = decodeURIComponent(str2);\n        document.write(\"<br/>\" + str3)  //输出    你好javascript\n```\n\n五、escape()　　//编码一个字符串\n\n　　语法：escape(value);\n\n```\n        var str = \"javascript 你好\";\n        var str1 = escape(str);\n        document.write(str1);　　//javascript%20%u4F60%u597D\n```\n\n六、unecape()　　//解码一个由escape()函数编码的字符串\n\n```\n        window.onload = function () {\n            var str = \"javascript 你好\";\n            var str1 = escape(str);\n            document.write(str1); //javascript%20%u4F60%u597D\n            var str2 = unescape(str1);\n            alert(str2);　　　　　　//弹出 javascript你好\n        }\n```\n', '', '', 'https://www.cnblogs.com/itsharehome/p/10041883.html', 'javascript', '2021-11-17 16:22:07'),
(28, 'Refusing to install package with name \"webpack\" under a package', '在安装webpack的时候，会报如下错误\n原因是在初始化项目pack.json的时候npm init -y 默认把名字设置为webpack\n导致和安装webpack包的的名字一样，所以报错\n\n解决方案，将pack.json的name属性换成除webpack的其他名字\n\n再执行安装命令，就会成功安装webpack\n', '', '', 'https://blog.csdn.net/qq_38845858/article/details/103400647', 'webpack', '2021-11-23 21:25:17');

-- --------------------------------------------------------

--
-- 表的结构 `project`
--

CREATE TABLE `project` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目详细介绍',
  `introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '该项目的详细介绍',
  `image` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片（多张）',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目链接',
  `git_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代码远程仓库地址',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签',
  `skill` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当前项目使用的技术栈',
  `category` int NOT NULL COMMENT '1 自己的项目 2 参与过的项目 3 发现好的项目',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '项目发布时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `project`
--

INSERT INTO `project` (`id`, `name`, `detail`, `introduce`, `image`, `url`, `git_url`, `tag`, `skill`, `category`, `create_time`) VALUES
(1, '智慧校园选课系统', '该项目使用tp5.0框架开发，前后端混合，通过模板渲染页面。', '系统主要包括管理员子系统、教师子系统和学生子系统，对应的系统包含相应的功能；用于学生选课、查看课程以及对应教师，教师可以安排课程，设置课程等；管理员对该系统所有的用户的数据进行管理，以及对课程管理和安排', 'uploads/project_images/20210627/f883af72b18621626d90f923d25992ec.png,uploads/project_images/20210627/6b49257f885a4e262e74b9a3acc89408.png,uploads/project_images/20210627/b98759015e4e9027ee0d3f77efe241b0.png,uploads/project_images/20210627/aa66dea33de68fb147e27fdba189f0e4.png', 'http://xk.yangsong.cool', 'https://gitee.com/yangsong12/course-selection-system.git', 'PHP,Nginx,MySQL,Html,TP5', '', 1, '2021-06-27 15:25:59'),
(2, '电商后台管理系统', '基于vue+element+nodejs的电商后台管理系统，完整实现了整个流程，该项目为前后端分离项目。', '该项目是一个电商后台管理系统的前端项目，基于Vue+Element实现。 主要包括商品管理、订单管理、统计报表、权限管理、用户管理、设置等功能。', 'uploads/project_images/20210629/3bcf60b074be036af2835d5e7dbd4f97.png,uploads/project_images/20210629/9175a58881bc400bfac123aacc1f318d.png,uploads/project_images/20210629/e5e8e42ad4bc4385e16aacefc0dc3d43.png,uploads/project_images/20210629/5d986f02632c0f2cb802bd0c323ad3dd.png,uploads/project_images/20210629/56c9abb5ce50aeb85d12adcb1f3f1c5e.png', 'http://shop.yangsong.cool', 'https://gitee.com/yangsong12/vue_shop.git', 'Vue,MySQL,Nginx,NodeJS,ElementUI', '', 1, '2021-06-29 03:46:03'),
(3, '简历', '这是一款基于tp5框架搭建的pc端简历系统，前端通过模板进行渲染，使用ajax发送请求', '主要用于幼儿园、小学生及高中生在择校时向心仪学校投递简历，并且通过成为VIP即可享受专业人员的优质服务，可以帮忙筛选优质学校和提供更多的学校资源，同时还可以有多个简历模板免费下载使用，并且也可以选择导出Word和PDF等功能。', 'uploads/project_images/20210629/36bdc8a7a5a4bacc40dc8a341afa556f.png,uploads/project_images/20210629/3b12b5684463a563526230c334c408f2.png,uploads/project_images/20210629/c512a3b5d8ffed7fda3c8c80c9fb248f.png,uploads/project_images/20210629/e8ae8580ddae80f949b18f708fb7261a.png,uploads/project_images/20210629/edf1a6944ba91a8572baa660a980beda.png', 'https://jl.028xuexi.com', '', 'PHP,MySQL,TP5,JQuery,BootStrap', '', 2, '2021-06-29 04:06:33'),
(4, '易升学简历', '基于uniapp开发编译的微信小程序，前后端分离，后端主要用PHP编写。', '实现用户能够在手机端就能填写资料，且根据选择不同的简历模板导出Word或导出PDF，查看相关学校的详细信息。', 'uploads/project_images/20210629/9c11341f31904681ae767b06b5531c9a.png,uploads/project_images/20210629/0cece2bb027095e921576d1f8f344c1f.png,uploads/project_images/20210629/7a8376ce53d8175e8b7f69f9a6b97384.png,uploads/project_images/20210629/ab5a2a3a65efd75ad338283df4f96754.png,uploads/project_images/20210629/827266b613ace82eee379f6e42ce2391.png', '', '', '微信小程序,uniapp,Vue,PHP,tp5,uView', '', 2, '2021-06-29 04:41:14'),
(5, '个人论坛', '基于腾讯discuzq的论坛，分前端展示，后端管理界面。', 'Discuz! Q 使用主流的框架，前后分离的方式重写了全部代码，数百个接口全部开放，原生的连接微信生态和腾讯云，帮助开发者事半功倍 ；基于 Apache License 2.0 开源协议，开发者无后顾之忧，只需专注于业务场景的落地。', 'uploads/project_images/20210629/4da03b6d00ccba28ada182b417cf379a.png,uploads/project_images/20210629/122d8866f38f9cfcd1880568d64d0211.png,uploads/project_images/20210629/8f54790b9195625b78cfd81ec1c34983.png,uploads/project_images/20210629/9ea673eaa661d2e7155d8276a09d24b9.png,uploads/project_images/20210629/69b2ae83e995613a5aaf50d80fc3b088.png', 'http://bbs.yangsong.cool', 'https://gitee.com/yangsong12/discuzq.git', 'DiscuzQ,Vue,PHP,MySQL', '', 3, '2021-06-29 11:05:39'),
(6, '问卷表单', '基于uniapp开发编译的h5页面，类似于“问卷星”，用于数据收集和用户调查。', '主要分为两个端，用户端和管理端，管理端可以创建问卷调查，设置该问卷的相关基础信息，然后再向该问卷增加不同类型的表单问题；用户端可以看到已发布的表单调查，并可以进行问卷的填写等。', 'uploads/project_images/20210711/4dd8e648ad115a8ae16fd6df8ca0794a.png,uploads/project_images/20210711/dcc15705d699a6e7cb3eaf3bd53b3e50.png,uploads/project_images/20210711/4a35ca81af455829c0f15bd6110863cf.png,uploads/project_images/20210711/8750910a6e9acbe57686695bf8a9031b.png,uploads/project_images/20210711/c4ea98eaf59ea8cee6a26eb5e802ea47.png', '', 'https://gitee.com/yangsong12/wjx.git', 'uniapp,Vue,H5,PHP', '', 2, '2021-07-11 09:02:22'),
(8, 'i邦邻app', 'i邦邻app是一款由中建壹品物业专为业主开发打造的智能小区生活软件，通过本app可以更加方便的了解小区的各种通知和业主活动内容，同时还有超多智能化的业主报修和日常沟通服务，让您住的更加轻松舒适！', '将物业服务、信息通知、物业缴费、社区活动、社区圈子等诸多生活帮助信息及服务整合在手机里，为用户生活带来无限便利。物业各部门人员可很好的服务并解决业主日常居住生活中遇到的各种问题，可以有效提升管理水平，降低物业企业运营成本，提高物业服务效率，提升业主满意度。', 'uploads/project_images/20211116/58f42f58dab475e9552697c6a969e554.jpg,uploads/project_images/20211116/78dec048f8edc584fa65f9852b6948a6.jpg,uploads/project_images/20211116/eb5826191b08724d522099c570293a92.jpg', '', '', 'Vue,java', '', 2, '2021-11-16 11:16:16');

-- --------------------------------------------------------

--
-- 表的结构 `resume`
--

CREATE TABLE `resume` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名字',
  `file_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件类型',
  `file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件地址',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `resume`
--

INSERT INTO `resume` (`id`, `name`, `file_type`, `file_url`, `create_time`, `update_time`) VALUES
(9, '第一份简历.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'uploads/Resume_File/20211116/291670878f41262da7d2f792a95b4041.docx', '2021-11-15 17:09:19', '2021-11-15 17:09:19'),
(10, '简历1.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'uploads/Resume_File/20211116/ff9ce2ee783166ebfec23ee18e500545.docx', '2021-11-15 17:09:22', '2021-11-15 17:09:22');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` int NOT NULL COMMENT '0 女 1 男',
  `age` int NOT NULL,
  `birthday` timestamp NOT NULL,
  `phone` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `idcard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '照片',
  `identity` int NOT NULL COMMENT '身份 0 在校学生 1 打工人',
  `hometown` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '家庭住址',
  `experience` int NOT NULL COMMENT '工作年龄 ',
  `pay` int NOT NULL COMMENT '期望工资',
  `status` int NOT NULL COMMENT '当前工作状态 0 未入职 1 在职 2 离职 3 即将入职',
  `profession` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作职业',
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '期望工作城市',
  `college` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所读大学',
  `major` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业',
  `graduation_year` timestamp NOT NULL,
  `college_type` int NOT NULL COMMENT '学校类型 0 专科 1 本科 2 其他',
  `other` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '其他说明',
  `decription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '个人说明'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `name`, `sex`, `age`, `birthday`, `phone`, `email`, `idcard`, `avatar`, `identity`, `hometown`, `experience`, `pay`, `status`, `profession`, `city`, `college`, `major`, `graduation_year`, `college_type`, `other`, `decription`) VALUES
(1, '杨 *', 1, 23, '1998-09-26 16:00:00', '158****3491', '2048400850@qq.com', '500235*******', 'uploads/avatar_images/20210712/54fffdfea8385f4293676887e0ff7c9b.jpg', 1, '重庆市', 1, 1000000, 2, '前端开发工程师', '广州', '重庆大学****学院', '软件工程', '2021-06-23 16:00:00', 1, '', '一辈子很短，努力的做好两件事就好；第一件事是热爱生活，好好的去爱身边的人；第二件事是努力学习，在工作中取得不一样的成绩，实现自己的价值，而不是仅仅为了赚钱。');

-- --------------------------------------------------------

--
-- 表的结构 `website`
--

CREATE TABLE `website` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `detail` text COLLATE utf8mb4_general_ci NOT NULL,
  `introduce` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `image` text COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `git_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `skill` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `category` int NOT NULL COMMENT '6 框架 7 资源 8 ui库 9 语言 10 文档',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `website`
--

INSERT INTO `website` (`id`, `name`, `detail`, `introduce`, `image`, `url`, `git_url`, `tag`, `skill`, `category`, `created_time`) VALUES
(1, 'Vue', 'Vue.js 渐进式 JavaScript 框架', 'vue是一套用于构建用户界面的渐进式框架。与其它大型框架不同的是，Vue 被设计为可以自底向上逐层应用。Vue 的核心库只关注视图层，不仅易于上手，还便于与第三方库或既有项目整合。另一方面，当与现代化的工具链以及各种支持类库结合使用时，Vue 也完全能够为复杂的单页应用提供驱动。', 'uploads/project_images/20211116/b66a4eb5384830f9c09e673a0577709b.jpg', 'https://cn.vuejs.org/', '', 'Vue', '', 6, '2021-11-16 09:03:56'),
(2, 'React', '用于构建用户界面的 JavaScript 库', 'React 使创建交互式 UI 变得轻而易举。为你应用的每一个状态设计简洁的视图，当数据变动时 React 能高效更新并渲染合适的组件。', 'uploads/project_images/20211116/91253d398e4badf28fd3bbe7f8d583f0.jpg', 'https://react.docschina.org/', '', 'React', '', 6, '2021-11-16 09:29:02'),
(3, 'Element-UI', 'Element，一套为开发者、设计师和产品经理准备的基于 Vue 2.0 的桌面端组件库.', '我们为新版的 vue-cli 准备了相应的 Element 插件，你可以用它们快速地搭建一个基于 Element 的项目。', 'uploads/project_images/20211116/81c2dc617f68f70f9db3b331e33a061c.png', 'https://element.eleme.cn/#/zh-CN/component/installation', '', 'ElementUI', '', 8, '2021-11-16 10:00:09'),
(4, 'Ant Design Vue', '这里是 Ant Design 的 Vue 实现，开发和服务于企业级后台产品。', '提炼自企业级中后台产品的交互语言和视觉风格。\n开箱即用的高质量 Vue 组件。\n共享Ant Design of React设计工具体系。', 'uploads/project_images/20211116/47959098fa4be4d75f823fb0d4e75642.jpg', 'https://www.antdv.com/components/menu-cn/', '', 'AntDesign,Vue', '', 8, '2021-11-16 10:03:54'),
(5, 'uView', 'uView是uni-app生态专用的UI框架', 'uni-app 是一个使用 Vue.js 开发所有前端应用的框架，开发者编写一套代码， 可发布到iOS、Android、H5、以及各种小程序(微信/支付宝/百度/头条/QQ/钉钉)等多个平台(引言自uni-app网)。', 'uploads/project_images/20211116/87df4f8d6db6afb63ade6ba2b2691273.png', 'https://www.uviewui.com/components/intro.html', '', 'uView,uniapp', '', 8, '2021-11-16 10:15:24'),
(6, 'Vant', '轻量、可靠的小程序 UI 组件库', 'Vant 是有赞前端团队开源的移动端组件库，于 2017 年开源，已持续维护 4 年时间。Vant 对内承载了有赞所有核心业务，对外服务十多万开发者，是业界主流的移动端组件库之一', 'uploads/project_images/20211116/ac4d29a1ddf57c47551569d581c6c9bb.png', 'https://youzan.github.io/vant-weapp/#/home', '', 'vant', '', 8, '2021-11-16 10:18:42'),
(7, 'iView', '一套基于 Vue.js 的高质量 UI 组件库', 'View UI®，即原先的 iView，是一套基于 Vue.js 的开源 UI 组件库，主要服务于 PC 界面的中后台产品。', 'uploads/project_images/20211116/43ebfaa452c5ea155f82308f44973b01.png', 'http://v1.iviewui.com/', '', 'iview', '', 8, '2021-11-16 10:21:14'),
(8, 'vux', '一个凑合的 Vue.js 移动端 UI 组件库', 'VUX（读音 [v’ju:z]，同 views）是基于WeUI和Vue(2.x)开发的移动端UI组件库，主要服务于微信页面。\n基于webpack + vue-loader + vux可以快速开发移动端页面，配合vux-loader方便你在WeUI的基础上定制需要的样式。\nvux-loader保证了组件按需使用，因此不用担心最终打包了整个vux的组件库代码。', 'uploads/project_images/20211116/120ba183e931e3df74512806473e3d56.png', 'https://vux.li/', '', 'vux', '', 8, '2021-11-16 10:24:10'),
(9, 'Bootstrap', 'Bootstrap 是最受欢迎的 HTML、CSS 和 JS 框架，用于开发响应式布局、移动设备优先的 WEB 项目。', '为所有开发者、所有应用场景而设计\nBootstrap 让前端开发更快速、简单。所有开发者都能快速上手、所有设备都可以适配、所有项目都适用。', 'uploads/project_images/20211116/b06719a847a04060af4c02440889d4c6.png', 'https://v3.bootcss.com/', '', 'Bootstrap', '', 8, '2021-11-16 10:29:28'),
(10, 'colorUI', '这是一款适应于H5、微信小程序、安卓、ios、支付宝的高颜值，高度自定义的Css组件库.', 'ColorUI是一个css库！！！在你引入样式后可以根据class来调用组件，一些含有交互的操作我也有简单写，可以为你开发提供一些思路。', 'uploads/project_images/20211116/9b9b070d5b0db2c5139322994cf53c56.png', 'https://demo.color-ui.com/', '', 'colorUI', '', 8, '2021-11-16 10:33:27'),
(11, 'Layui', '由职业前端倾情打造，面向全层次的前后端开发者，易上手开源免费的 Web UI 组件库', 'layer 是一款历年来备受青睐的 Web 弹出层组件，具备全方位的解决方案，面向各个水平段的开发人员，您的页面会轻松地拥有丰富友好的操作体验。', 'uploads/project_images/20211116/0598c11d53e12280988511cd3efa934e.png', 'https://www.layui.site/', '', 'Layui', '', 8, '2021-11-16 10:58:49'),
(12, 'H-ui', '架起设计与后端的桥梁 轻量级前端框架，简单免费，兼容性好，服务中国网站', 'H-ui是一套侧重PC端的前端框架，当然也针对不同分辨率的屏幕做了响应式处理，做个简单的营销页面，企业网站、宣传单页当然没有问题。但是我们知道PC和移动端的交互、事件、场景过渡完全是两个完全不同的概念', 'uploads/project_images/20211118/3651145eb24ebff115a7112cdf011ad5.png', 'http://www.h-ui.net/', '', 'H-ui', '', 8, '2021-11-16 11:01:23'),
(13, 'Angular', 'AngularJS是一套前端的MVC框架。那么，为了实现视图的中转，肯定会涉及到路由的概念。ngRoute即是AngularJS的路由模块', 'AngularJS诞生于2009年，由Misko Hevery 等人创建，后为Google所收购。是一款优秀的前端JS框架，已经被用于Google的多款产品当中。AngularJS有着诸多特性，最为核心的是：MVVM、模块化、自动化双向数据绑定、语义化标签、依赖注入等等。', 'uploads/project_images/20211116/054cf29a19ae4b0af17422ed76413eb2.png', 'https://www.angularjs.net.cn/', '', 'Angular', '', 6, '2021-11-16 11:06:12'),
(14, 'jQuery插件库', '本站致力于收集jQuery插件和提供各种jQuery特效的详细使用方法,在线预览,jQuery插件下载及教程', '下载多种特效以及各种插件，各种需求的页面都包含了，使用起来非常方便而且简单，并且大多数都是免费的。', 'uploads/project_images/20211119/6cdbf953732077430680d87cdf9715f0.png', 'https://www.jq22.com/', '', 'jQuery', '', 7, '2021-11-16 11:22:34'),
(15, 'Vue Element Admin', 'vue-element-admin 是一个后台前端解决方案，它基于 vue 和 element-ui实现。', '线上预览地址：https://panjiachen.github.io/vue-element-admin/#/login?redirect=%2Ficon%2Findex', 'uploads/project_images/20211116/0cda812b62697d78539f095de5ed4b92.png', 'https://panjiachen.github.io/vue-element-admin-site/zh/', 'https://github.com/PanJiaChen/vue-element-admin', 'Vue,Element', '', 6, '2021-11-16 11:29:26'),
(16, 'Vue Antd Admin', '开箱即用的中台前端/设计解决方案', '预览地址   https://iczer.gitee.io/vue-antd-admin/#/login', 'uploads/project_images/20211116/3e996d6c6e222e85d0a4d29bedf82e02.png', 'https://iczer.gitee.io/vue-antd-admin-docs/', 'https://gitee.com/iczer/vue-antd-admin/#https://iczer.gitee.io/vue-antd-admin', 'Vue,AntDesign', '', 6, '2021-11-16 11:37:47'),
(17, '爱心树', '程序员表白神器', '视觉效果相当不错！得此表白神器，程序猿也可以很浪漫！快去追你的女神吧！~~', 'uploads/project_images/20211117/b7b64721b6e5c2a52fa6e77e628e7f3d.png', 'http://like.yangsong.cool', '', 'Html,javascript', '', 7, '2021-11-17 10:19:39'),
(18, '烟花表白', 'jQuery娱乐型简易的表白', '傻瓜式的表白小游戏，对于不善于表达又害羞的人可以试试。', 'uploads/project_images/20211117/05bed4e1950f2b5abcbbd969de670437.png', 'https://nav.yangsong.cool/uploads/resource/fireworks/', '', 'Html', '', 7, '2021-11-17 10:53:18'),
(19, 'Easy Admin', '基于ThinkPHP6.0和Layui的快速开发的后台管理系统', '演示地址：http://easyadmin.99php.cn/admindemo（账号：admin，密码：123456。备注：只有查看信息的权限）', 'uploads/project_images/20211118/36c2150482f1bd0325a5a69eac7f72db.png', 'http://easyadmin.99php.cn/', 'https://gitee.com/zhongshaofa/easyadmin/#http://easyadmin.99php.cn', 'ThinkPHP 6.0,Layui', '', 6, '2021-11-18 14:52:44'),
(20, 'layuimini', '最简洁、清爽、易用的layui后台框架模板。', '基于thinkphp6和layuimini2开发的easyadmin基础版本已发布 拥有完善的菜单管理，注解权限等基础功能，对常用的基础功能进行封装，减少代码的编写量。\n在线预览地址：http://layuimini.99php.cn/iframe/v1/index.html', 'uploads/project_images/20211118/a618120dcb3febd1c053acb02d8082c9.png', 'http://layuimini.99php.cn/', 'https://gitee.com/zhongshaofa/layuimini/tree/v2', 'ThinkPHP 6.0,Layui', '', 6, '2021-11-18 15:01:37'),
(21, 'H-ui Admin', 'H-ui.admin是用H-ui前端框架开发的轻量级网站后台模版 采用源生html语言，完全免费，简单灵活，兼容性好 让您快速搭建中小型网站后台', 'H-ui.Admin_v3.x是默认版本，iframe结构布局，多选项卡效果。\nH-ui.Admin.page_v3.x是单页面，没有用到iframe，左侧菜单点击刷新页面，每次只能打开一个页面。相比iframe更简单，更方便操作。\n演示地址   http://demo.h-ui.net/H-ui.admin/3.1/index.html', 'uploads/project_images/20211118/373b84d194cd2bf3e5307c3c20668f04.png', 'http://www.h-ui.net/H-ui.admin.shtml', '', 'Html', '', 6, '2021-11-18 15:08:52'),
(22, 'X-admin', 'X-admin基于layui的轻量级前端后台管理框架，简单免费，兼容性好，面向所有层次的前后端程序。', '演示地址  http://x.xuebingsi.com/x-admin/v2.2/', 'uploads/project_images/20211118/446551902fc0e790406943e615a09e66.png', 'http://x.xuebingsi.com/', 'https://gitee.com/daniuit/X-admin', 'Layui', '', 6, '2021-11-18 15:22:19'),
(23, 'Fantastic Admin', '一款开箱即用的 Vue 中后台管理系统框架', '演示地址  https://hooray.gitee.io/fantastic-admin/vue2/basic/#/login?redirect=%2Fdashboard', 'uploads/project_images/20211118/ece90392638f65f747c8e56d82ff9d40.png', 'https://hooray.gitee.io/fantastic-admin/', 'https://gitee.com/hooray/fantastic-admin', 'Vue,Element', '', 6, '2021-11-18 15:28:38'),
(24, 'react ant admin', 'react-ant-admin 适用于后台管理 web 项目的二次开发。让开发人员快速搭建后台管理项目。 ', '演示地址  https://azhengpersonalblog.top/react-ant-admin/details/person', 'uploads/project_images/20211126/a5aa6fad17b733c13d31a20b0e7c23af.jpg', 'https://azhengpersonalblog.top/doc-react-ant-admin/', 'https://gitee.com/kong_yiji_and_lavmi/react-ant-admin', 'React,AntDesign', '', 6, '2021-11-18 15:56:08'),
(25, 'webpack', 'webpack 是一个用于现代 JavaScript 应用程序的 静态模块打包工具。', '当 webpack 处理应用程序时，它会在内部从一个或多个入口点构建一个 依赖图(dependency graph)，然后将你项目中所需的每一个模块组合成一个或多个 bundles，它们均为静态资源，用于展示你的内容。', 'uploads/project_images/20211119/f0bb3f8e6401803cbf4b2619e5cc1cd5.png', 'https://webpack.docschina.org/', '', 'webpack', '', 10, '2021-11-18 16:44:24'),
(26, 'ThinkPHP5.0完全开发手册', 'ThinkPHP V5.0——为API开发而设计的高性能框架', 'ThinkPHP是一个免费开源的，快速、简单的面向对象的轻量级PHP开发框架，是为了敏捷WEB应用开发和简化企业应用开发而诞生的。ThinkPHP从诞生以来一直秉承简洁实用的设计原则，在保持出色的性能和至简的代码的同时，也注重易用性。遵循Apache2开源许可协议发布，意味着你可以免费使用ThinkPHP，甚至允许把你基于ThinkPHP开发的应用开源或商业产品发布/销售。', 'uploads/project_images/20211119/74c1e0e30d4b501648cfbcc2d3ffc043.png', 'https://www.kancloud.cn/manual/thinkphp5/118003', 'https://gitee.com/liu21st/thinkphp', 'ThinkPHP 5.0', '', 10, '2021-11-18 17:16:47'),
(27, 'ThinkPHP6.0完全开发手册', 'ThinkPHP是一个免费开源的，快速、简单的面向对象的轻量级PHP开发框架，是为了敏捷WEB应用开发和简化企业应用开发而诞生的。', 'ThinkPHP6.0基于精简核心和统一用法两大原则在5.1的基础上对底层架构做了进一步的优化改进，并更加规范化。由于引入了一些新特性，ThinkPHP6.0运行环境要求PHP7.1+，不支持5.1的无缝升级（官方给出了升级指导用于项目的升级参考）', 'uploads/project_images/20211119/bde6de5eb667e7c513fbeb18bb76e76e.png', 'https://www.kancloud.cn/manual/thinkphp6_0/1037479', 'https://gitee.com/liu21st/thinkphp', 'ThinkPHP 6.0', '', 10, '2021-11-18 17:18:52'),
(28, 'TypeScript', 'TypeScript是JavaScript类型的超集，它可以编译成纯JavaScript。', 'ypeScript可以编译出纯净、 简洁的JavaScript代码，并且可以运行在任何浏览器上、Node.js环境中和任何支持ECMAScript 3（或更高版本）的JavaScript引擎中.', 'uploads/project_images/20211119/5cf7ac837cb6d66155b824086e5992ba.ico', 'https://www.tslang.cn/index.html', '', 'TypeScript', '', 10, '2021-11-18 17:28:30'),
(29, 'iconfont-阿里巴巴矢量图标库', '用户可以自定义下载多种格式的icon，平台也可将图标转换为字体，便于前端工程师自由调整与调用。', '设计师将图标上传到 iconfont 平台，用户可以自定义下载多种格式的icon，平台也可将图标转换为字体，便于前端工程师自由调整与调用。', 'uploads/project_images/20211119/3d8d634d4fb74a9b46fc538a3f63affb.png', 'https://www.iconfont.cn/', '', 'icon', '', 9, '2021-11-18 17:37:00'),
(30, 'jQuery之家', '自由分享jQuery、html5和css3的插件库', 'jQuery之家致力于搜集和整理各种jQuery插件,jQuery特效,jquery ui,jQuery 教程,JS特效,网页特效,以及各种html5,css3动画和效果,为前端开发者提供最全面的网页开发素材', 'uploads/project_images/20211119/20c62e100c3fb7e8b61be0df946082f5.png', 'http://www.htmleaf.com/', '', 'Jquery', '', 7, '2021-11-18 17:42:25'),
(31, 'ALAPI', '丰富的免费接口使用', '部分限制免费使用接口', 'uploads/project_images/20211119/34593d1e50076b4f8a4e167ddf3997f9.png', 'https://www.alapi.cn/', '', 'api', '', 7, '2021-11-18 17:55:34'),
(32, 'Kod Clound', '云端文档管理，在企业网盘内也可以像在电脑上操作一般熟悉而流畅，熟悉框选、拖拽、快捷键，从来没有这么简单方便', 'KodExplorer可道云，原名芒果云，是基于Web技术的私有云在线文档管理解决方案。Kod，读音通code，意为“代码，编码”，中文名为“可道”。Kod取义于著名计算机科学家Linus Torvalds的名言：', 'uploads/project_images/20211119/27bdd1b5e743944ce17bc57076a61099.ico', 'https://kodcloud.com/', '', 'Kod Clound', '', 7, '2021-11-18 18:00:01'),
(33, 'Grabient', 'css渐变色网站', '直接复制css代码，也可调节颜色值。', 'uploads/project_images/20211119/ab4d23ff5badcb5a28dc1090d3b1c54a.ico', 'https://www.grabient.com/', 'https://github.com/johnkorzhuk/grabient', 'Css', '', 7, '2021-11-19 11:13:20'),
(34, '在线沙盒环境 - CodeSandBox', '可以在线快速的搭建一个完整项目', '可创建项目包含Vue、Vue3及React等多种项目，并实时预览。', 'uploads/project_images/20211119/45a86100650209b246f8db8131375c50.png', 'https://codesandbox.io/', '', '工具', '', 7, '2021-11-19 11:27:39'),
(35, 'flaticon', '超级多好看的小图标，可以在页面功能加上图标背景，免费下载', '', 'uploads/project_images/20211119/0942fd9bbcc147f138ce2230d2a2d310.png', 'https://www.flaticon.com/', '', 'icon', '', 9, '2021-11-19 11:41:10'),
(36, 'Naive UI', '一个 Vue 3 组件库  比较完整，主题可调，使用 TypeScript，不算太慢  有点意思', '注意，naive-ui 仅支持 Vue3。如果你在使用 Vue2，可以去看看别的库。', 'uploads/project_images/20211119/85ebee1c994cfb06b464338ec87abf63.png', 'https://www.naiveui.com', '', 'Naive UI', '', 8, '2021-11-19 11:44:54'),
(37, 'cssgr', '布局网站，轻松调整，直接复制css代码', '', 'uploads/project_images/20211121/3fb056d4e4c9ea31941a3367fd5a3100.png', 'https://cssgr.id/', '', 'css', '', 7, '2021-11-21 08:17:50'),
(38, '任意布局', '可视化快速拖拽，自由布局，推导生成vue代码', '非常方便，很适合uniapp的项目，尤其模仿其他项目，直接拖拽模块，然后生成代码就可以使用，效率很高。', 'uploads/project_images/20211121/13541c7d1d725dc27bb040818603fb44.png', 'http://aicode.shagua.wiki/uni/v1/index.html#/', '', 'layout', '', 7, '2021-11-21 08:44:49'),
(39, 'Linux命令大全(手册)', '专注于Linux命令大全与详解的在线命令查询网站', '包含Linux命令手册、Linux命令详解、Linux命令学习与shell脚本编程大全等优质学习资料', 'uploads/project_images/20211121/d81554df5a11aabd866740cc38650bb3.png', 'https://www.linuxcool.com/', '', 'Linux', '', 7, '2021-11-21 08:59:04'),
(40, '接口大全', '免费API，收集所有免费的API', '接口大全-免费API,收集所有免费的API。接口大全-免费API,为您收集免费的接口服务,做一个api的搬运工。', 'uploads/project_images/20211121/599d84bb1070ae2b7e769331f972c82d.ico', 'https://www.free-api.com/', '', 'API', '', 7, '2021-11-21 09:03:39'),
(41, '表情包在线网站', '在线使用', '', 'uploads/project_images/20211121/fb360646120ad9c6b841699fc6b400b7.png', 'https://fabiaoqing.com/', '', '表情包', '', 7, '2021-11-21 09:11:46'),
(42, 'imgcook', '由设计稿一键智能生成代码', '', 'uploads/project_images/20211121/644b999f33f82cea2c4ed09be3be3179.png', 'https://imgcook.taobao.org/', '', 'code', '', 7, '2021-11-21 09:27:54'),
(43, 'Low Code Generato', '通过它可以通过拖拽快速完成Vue组件代码骨架的搭建', '', 'uploads/project_images/20211121/71eb3585cfb08b7aba5781323ee3da5b.png', 'https://vcc.sahadev.tech/', 'https://github.com/sahadev/vue-component-creater-ui', 'code', '', 7, '2021-11-21 09:37:57'),
(44, '尚硅谷最新版Webpack5实战教程(从入门到精通)', 'webpack作为现代前端开发中爆火的模块打包工具', '随着webpack5也研发近一年，即将要隆重推出。我们在学完webpack4配置，将会无缝切换到webpack5，全面讲解webpack5新特性。全球知名公司（如：谷歌、阿里、腾讯等）都在使用webpack作为模块打包工具。', 'uploads/project_images/20211124/57b2b78b10288b0391e7a778ff49f63e.png', 'https://www.bilibili.com/video/BV1e7411j7T5?p=4', '', 'webpack', '', 7, '2021-11-23 21:41:14'),
(45, 'Vue CLI', '全局 CLI 配置', '你也可以使用 vue config 命令来审查或修改全局的 CLI 配置。', 'uploads/project_images/20211124/1dc67386764decb0f55f53f6ed7e874e.jpg', 'https://cli.vuejs.org/zh/config/', '', 'Vue CLI', '', 10, '2021-11-24 07:47:50'),
(46, '科学上网-佛跳墙', '科学上网', '好东西', 'uploads/project_images/20211126/2c6fa69068ea21c2d88c9c82d11a0c30.png', 'https://www.jiayouyashanghai.com/cn/?a=dnxe2', '', 'tool', '', 7, '2021-11-25 17:40:33'),
(47, 'Vite', '下一代前端开发与构建工具', '极速的服务启动\n使用原生 ESM 文件，无需打包!\n\n轻量快速的热重载\n无论应用程序大小如何，都始终极快的模块热重载（HMR）\n\n丰富的功能\n对 TypeScript、JSX、CSS 等支持开箱即用。\n\n优化的构建\n可选 “多页应用” 或 “库” 模式的预配置 Rollup 构建\n\n通用的插件\n在开发和构建之间共享 Rollup-superset 插件接口。\n\n完全类型化的API\n灵活的 API 和完整 TypeScript 类型。', 'uploads/project_images/20211126/b2e3ef1ff1d16908f876e6749884a793.png', 'https://vitejs.cn/', '', 'Vite', '', 10, '2021-11-25 17:45:37'),
(48, 'uTools', '一切皆插件，自取所需', '自由组合丰富插件，打造随手可取的终极神器', 'uploads/project_images/20211126/f8c15060c28ff64dae27574122b017d8.ico', 'http://www.u.tools/', '', 'utools', '', 7, '2021-11-25 22:56:56'),
(49, '油猴脚本', '用户脚本是一段代码，它们能够优化您的网页浏览体验。', '在 Greasy Fork 上的用户脚本都是由用户编写并向全世界发表的，您可以免费安装，轻松体验。', 'uploads/project_images/20211126/89eb0f58a2143c6e7fd004fd45b0fdf1.png', 'https://greasyfork.org/zh-CN/scripts', '', 'javascript', '', 7, '2021-11-25 23:39:12'),
(50, '微信官方文档', '小程序、公众号、小游戏、微信支付等官方文档', '', 'uploads/project_images/20211129/31c1bad1105feaf9abf2449382c80c55.ico', 'https://developers.weixin.qq.com/doc/', '', '小程序', '', 10, '2021-11-28 23:49:55');

--
-- 转储表的索引
--

--
-- 表的索引 `love_tree`
--
ALTER TABLE `love_tree`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `resume`
--
ALTER TABLE `resume`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `website`
--
ALTER TABLE `website`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `love_tree`
--
ALTER TABLE `love_tree`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `note`
--
ALTER TABLE `note`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用表AUTO_INCREMENT `project`
--
ALTER TABLE `project`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `resume`
--
ALTER TABLE `resume`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `website`
--
ALTER TABLE `website`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
