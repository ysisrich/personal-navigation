<template>
	<a-affix :offset-top="top">
		<a-layout-header class="ant-pro-global-header-layout-side" style="background: #fff; padding: 0">
			<div class="flex-menu">
				<!-- 弹出 -->
				<a-icon v-show="show" type="menu-unfold" :style="{cursor: 'pointer',fontSize : '20px'}" @click="showDrawer"/>
				
			    <a-menu class="ant-self-menu"  :selected-keys="[current]" mode="horizontal" @click="handleClick">
			      <a-menu-item v-for="item in menuList" class="ant-menu-items" :style="{margin: margin}" @click="handleRouter(item)" :key="item.key"> <a-icon :type="item.icon" />{{item.title}}</a-menu-item>
			    </a-menu>
				<!-- 搜索框 -->
				<Search v-show="!show" class="ant-input-search"/>
				
			  </div>
			  <div class="flex-publish" v-show="!show">
				<a-tooltip placement="bottomRight" style="cursor: pointer;" @click="publish">
				  <template slot="title">
					<span>添加项目资源，丰富网站</span>
				  </template>
				  <a-icon type="edit" style="margin: 5px;"/> 发布
				</a-tooltip>
			  </div>
		</a-layout-header>
		
		<!-- <div v-show="show" class="ant-xs-style">
			<Search style="float: left;"/>
			<a-tooltip placement="bottomRight" class="ant-xs-publish" @click="publish">
			  <template slot="title">
				<span>添加项目资源，丰富网站</span>
			  </template>
			  <a-icon type="edit" style="margin: 5px;"/> 发布
			</a-tooltip>
		</div> -->
		
		<!-- 小屏 侧边弹框 -->
		<a-drawer
		      placement="left"
			  width="50%"
		      :closable="false"
		      :visible="visible"
		      :after-visible-change="afterVisibleChange"
		      @close="onClose"
			  :bodyStyle="{'background-color':'#001529','height':'100%','padding':'10px 0'}"
		    >
			<!-- <div class="logo"><img class="logo-my" src="@/assets/imgs/my.png"><span  style="opacity: 1;" class="title">个人导航</span></div> -->
			<a-menu
			      style="width: 256px"
			      :default-selected-keys="['1']"
			      mode="inline"
			      :theme="theme"
			      @click="handleClick1"
			    >
			      <a-menu-item :key="item.key" v-for="(item) in menus">
					<a-icon :type="item.icon" />
					<span>{{item.name}}</span>
				</a-menu-item>
			    </a-menu>
		</a-drawer>
			
			
	</a-affix>
</template>

<script>
import Search from '@/components/index/Search.vue'

export default{
	name:"Header",
	data() {
		return {
			top: 0,
			menuList:[
				{
					key:'person',
					icon:'user',
					title:'个人'
				},
				{
					key:'resume',
					icon:'profile',
					title:'简历'
				},
				{
					key:'project',
					icon:'project',
					title:'项目'
				},
				{
					key:'experience',
					icon:'solution',
					title:'笔记'
				}
			],
			menus:[
				{
					key:6,
					name:'框架',
					icon:'smile'
				},
				{
					key:8,
					name:'UI库',
					icon:'smile'
				},
				{
					key:7,
					name:'资源',
					icon:'smile'
				},
				{
					key:9,
					name:'Icon',
					icon:'smile'
				},
				{
					key:10,
					name:'文档',
					icon:'smile'
				}
			],
			current: '',
			visible: false,
			theme:"dark",
			show:false,
			margin :'0 20px'
		}
	},
	mounted (){
		let path = this.$router.currentRoute.fullPath.substr(1)
		this.current = this.$router.currentRoute.fullPath.substr(1)
		if(path.includes('person'))
			this.current = 'person'
			
		document.documentElement.clientWidth < 768 ? this.show = true : this.show = false
		document.documentElement.clientWidth < 768 ? this.margin = '0 10px' : this.margin = '0 20px'
		window.addEventListener('resize',()=>{
			let width = document.documentElement.clientWidth
			width < 768 ? this.show = true : this.show = false
			width < 768 ? this.margin = '0 10px' : this.margin = '0 20px'
		})
	},
	components:{
		Search
	},
	methods: {
		handleClick(e) {
		  this.current = e.key
		},
		handleClick1(e){
			this.$router.push({path:'/menu_1',query:{key:e.key}})
		},
		// 头部菜单
		handleRouter(item){
			// console.log(item)
			this.$router.push(`/${item.key}`)
		},
		// 发布项目
		publish(){
			this.$router.push('/publish')
			this.current = 'publish'
		},
		afterVisibleChange(val) {
		  console.log('visible', val);
		},
		showDrawer() {
		  this.visible = true;
		},
		onClose() {
		  this.visible = false;
		},
	}
}
</script>

<style scoped>
	.ant-pro-global-header-layout-side{
		/* position: relative; */
		display: flex;
		align-items: center;
		/* height: 100%; */
		padding: 0 16px !important;
		background: #fff;
		box-shadow: 0 3px 10px rgba(0,0,0,0.16);
	}
	.ant-menu-items{
	    padding: 0 !important;
	    margin: 0 20px;
	}
	.ant-menu-horizontal {
	    border: 0;
		height: 62px;
		line-height: 62px;
	}
	.flex-menu{
		flex: 9;
		display: flex;
		align-items: center;
	}
	.ant-self-menu{
		flex: 1;
	}
	.ant-input-search{
		flex: 4;
		padding: 0 20px;
	}
	.flex-publish{
		flex: 3;
		min-width: 100px;
		text-align: right;
		color: #1890ff;
		margin-right: 100px;
	}
	
	
	.trigger {
		font-size: 18px;
		line-height: 50px;
		padding: 0 24px;
		margin: auto;
		cursor: pointer;
		transition: color 0.3s;
	}
	
	.trigger:hover {
		color: #fff;
	}
	
	.logo {
		/* width: 100%; */
		height: 32px;
		line-height: 32px;
		margin: 16px;
		background-color: #001529;
		/* background: rgba(255, 255, 255, 0.2); */
		/* text-align: center; */
	}
	
	.title {
		/* width: 100%; */
		vertical-align: bottom;
		line-height: 32px;
		font-size: 18px;
		font-weight: 600;
		color: #FFFFFF;
	}
	
	.logo-my {
		width: auto;
		height: 90%;
		margin: 0 10px;
	}
	
	.menu {
		position: relative;
		width: 100%;
		height: 100%;
	}
	.ant-xs-style{
		width: 100%;
		background-color: #FFFFFF;
		margin-top: 3px;
		height: 50px;
		line-height: 50px;
		padding-left: 10px;
	}
	.ant-xs-publish{
		cursor: pointer;
		float: right; 
		margin-right: 15px;
		color: #1890FF;
	}
</style>
