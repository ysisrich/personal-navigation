<template>
	<router-view />
</template>

<script>
export default {
  name: 'app',

  metaInfo: {
	// title: "页面标题",
	meta: [
		{ name: "keywords", content: "个人仓库、个人导航、简介、前端" },
		{ name: "description", content: "将一些有用的资源进行整合处理，方便查找，节省时间！" },
	],
  },
}
</script>

<style>
body{
	margin: 0;
}


 ::-webkit-scrollbar {
     width: 0 !important;
   }
   ::-webkit-scrollbar {
     width: 0 !important;height: 0;
   }

</style>
