-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2021-06-29 23:34:18
-- 服务器版本： 5.7.33-log
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tp6`
--

-- --------------------------------------------------------

--
-- 表的结构 `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '项目名称',
  `detail` text NOT NULL COMMENT '项目详细介绍',
  `introduce` varchar(255) NOT NULL COMMENT '该项目的详细介绍',
  `image` text NOT NULL COMMENT '图片（多张）',
  `url` varchar(255) NOT NULL COMMENT '项目链接',
  `git_url` varchar(255) NOT NULL COMMENT '代码远程仓库地址',
  `tag` varchar(255) NOT NULL COMMENT '标签',
  `skill` varchar(255) NOT NULL COMMENT '当前项目使用的技术栈',
  `category` int(2) NOT NULL COMMENT '1 自己的项目 2 参与过的项目 3 发现好的项目',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '项目发布时间'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `project`
--

INSERT INTO `project` (`id`, `name`, `detail`, `introduce`, `image`, `url`, `git_url`, `tag`, `skill`, `category`, `create_time`) VALUES
(1, '智慧校园选课系统', '该项目使用tp5.0框架开发，前后端混合，通过模板渲染页面。', '系统主要包括管理员子系统、教师子系统和学生子系统，对应的系统包含相应的功能；用于学生选课、查看课程以及对应教师，教师可以安排课程，设置课程等；管理员对该系统所有的用户的数据进行管理，以及对课程管理和安排', 'uploads/project_images/20210627/f883af72b18621626d90f923d25992ec.png,uploads/project_images/20210627/6b49257f885a4e262e74b9a3acc89408.png,uploads/project_images/20210627/b98759015e4e9027ee0d3f77efe241b0.png,uploads/project_images/20210627/aa66dea33de68fb147e27fdba189f0e4.png', 'http://xk.yangsong.cool', 'https://gitee.com/yangsong12/course-selection-system.git', 'PHP,Nginx,MySQL,Html,TP5', '', 1, '2021-06-27 15:25:59'),
(2, '电商后台管理系统', '基于vue+element+nodejs的电商后台管理系统，完整实现了整个流程，该项目为前后端分离项目。', '该项目是一个电商后台管理系统的前端项目，基于Vue+Element实现。 主要包括商品管理、订单管理、统计报表、权限管理、用户管理、设置等功能。', 'uploads/project_images/20210629/3bcf60b074be036af2835d5e7dbd4f97.png,uploads/project_images/20210629/9175a58881bc400bfac123aacc1f318d.png,uploads/project_images/20210629/e5e8e42ad4bc4385e16aacefc0dc3d43.png,uploads/project_images/20210629/5d986f02632c0f2cb802bd0c323ad3dd.png,uploads/project_images/20210629/56c9abb5ce50aeb85d12adcb1f3f1c5e.png', 'http://shop.yangsong.cool', 'https://gitee.com/yangsong12/vue_shop.git', 'Vue,MySQL,Nginx,NodeJS,ElementUI', '', 1, '2021-06-29 03:46:03'),
(3, '简历', '这是一款基于tp5框架搭建的pc端简历系统，前端通过模板进行渲染，使用ajax发送请求', '主要用于幼儿园、小学生及高中生在择校时向心仪学校投递简历，并且通过成为VIP即可享受专业人员的优质服务，可以帮忙筛选优质学校和提供更多的学校资源，同时还可以有多个简历模板免费下载使用，并且也可以选择导出Word和PDF等功能。', 'uploads/project_images/20210629/36bdc8a7a5a4bacc40dc8a341afa556f.png,uploads/project_images/20210629/3b12b5684463a563526230c334c408f2.png,uploads/project_images/20210629/c512a3b5d8ffed7fda3c8c80c9fb248f.png,uploads/project_images/20210629/e8ae8580ddae80f949b18f708fb7261a.png,uploads/project_images/20210629/edf1a6944ba91a8572baa660a980beda.png', 'https://jl.028xuexi.com', '', 'PHP,MySQL,TP5,JQuery,BootStrap', '', 2, '2021-06-29 04:06:33'),
(4, '易升学简历', '基于uniapp开发编译的微信小程序，前后端分离，后端主要用PHP编写。', '实现用户能够在手机端就能填写资料，且根据选择不同的简历模板导出Word或导出PDF，查看相关学校的详细信息。', 'uploads/project_images/20210629/9c11341f31904681ae767b06b5531c9a.png,uploads/project_images/20210629/0cece2bb027095e921576d1f8f344c1f.png,uploads/project_images/20210629/7a8376ce53d8175e8b7f69f9a6b97384.png,uploads/project_images/20210629/ab5a2a3a65efd75ad338283df4f96754.png,uploads/project_images/20210629/827266b613ace82eee379f6e42ce2391.png', '', '', '微信小程序,uniapp,Vue,PHP,tp5,uView', '', 2, '2021-06-29 04:41:14'),
(5, '个人论坛', '基于腾讯discuzq的论坛，分前端展示，后端管理界面。', 'Discuz! Q 使用主流的框架，前后分离的方式重写了全部代码，数百个接口全部开放，原生的连接微信生态和腾讯云，帮助开发者事半功倍 ；基于 Apache License 2.0 开源协议，开发者无后顾之忧，只需专注于业务场景的落地。', 'uploads/project_images/20210629/4da03b6d00ccba28ada182b417cf379a.png,uploads/project_images/20210629/122d8866f38f9cfcd1880568d64d0211.png,uploads/project_images/20210629/8f54790b9195625b78cfd81ec1c34983.png,uploads/project_images/20210629/9ea673eaa661d2e7155d8276a09d24b9.png,uploads/project_images/20210629/69b2ae83e995613a5aaf50d80fc3b088.png', 'http://bbs.yangsong.cool', 'https://gitee.com/yangsong12/discuzq.git', 'DiscuzQ,Vue,PHP,MySQL', '', 3, '2021-06-29 11:05:39');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sex` int(2) NOT NULL COMMENT '0 女 1 男',
  `age` int(4) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `email` varchar(20) NOT NULL,
  `idcard` varchar(50) NOT NULL COMMENT '身份证',
  `avatar` varchar(255) NOT NULL COMMENT '照片',
  `identity` int(2) NOT NULL COMMENT '身份 0 在校学生 1 打工人',
  `hometown` varchar(50) NOT NULL COMMENT '家庭住址',
  `experience` int(2) NOT NULL COMMENT '工作年龄 ',
  `pay` int(10) NOT NULL COMMENT '期望工资',
  `status` int(2) NOT NULL COMMENT '当前工作状态 0 未入职 1 在职 2 离职 3 即将入职',
  `profession` varchar(20) NOT NULL COMMENT '工作职业',
  `city` varchar(20) NOT NULL COMMENT '期望工作城市',
  `college` varchar(50) NOT NULL COMMENT '所读大学',
  `major` varchar(50) NOT NULL COMMENT '专业',
  `graduation_year` int(8) NOT NULL COMMENT '毕业年份',
  `college_type` int(2) NOT NULL COMMENT '学校类型 0 专科 1 本科 2 其他',
  `other` varchar(225) NOT NULL COMMENT '其他说明',
  `decription` varchar(255) NOT NULL COMMENT '个人说明'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `name`, `sex`, `age`, `phone`, `email`, `idcard`, `avatar`, `identity`, `hometown`, `experience`, `pay`, `status`, `profession`, `city`, `college`, `major`, `graduation_year`, `college_type`, `other`, `decription`) VALUES
(1, '杨松', 1, 22, '15826353491', '2048400850@qq.com', '500235199709273138', 'uploads/images/20210627/df1dca24b3d0c492606f99bc564155b1.jpg', 1, '重庆市', 1, 0, 2, '前端开发工程师', '广州、深圳、成都', '重庆大学城市科技学院', '软件工程', 2021, 1, '', '一辈子很短，努力的做好两件事就好；第一件事是热爱生活，好好的去爱身边的人；第二件事是努力学习，在工作中取得不一样的成绩，实现自己的价值，而不是仅仅为了赚钱。');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
