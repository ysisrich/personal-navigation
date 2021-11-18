<template>
	<a-layout-sider v-show="show" class="menu" v-model="collapsed"  :trigger="null" collapsible>
		<div class="logo"><img class="logo-my" src="@/assets/imgs/my.png"><span v-show="!collapsed"
				style="opacity: 1;" class="title">个人仓库</span></div>
		<a-menu theme="dark" mode="inline" :default-selected-keys="[]" @click="handleClick">
			<a-menu-item :key="item.key" v-for="(item) in menus">
				<a-icon :type="item.icon" />
				<span>{{item.name}}</span>
			</a-menu-item>
		</a-menu>
			<div class="ant-switch-close">
				<a-icon class="trigger" :type="collapsed ? 'menu-unfold' : 'menu-fold'" @click="() => (collapsed = !collapsed)" />
			</div>
	</a-layout-sider>
</template>

<script>
	export default {
		name: 'Aside',
		data() {
			return {
				collapsed: false,
				show:true,
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
						name:'语言',
						icon:'smile'
					},
					{
						key:10,
						name:'文档',
						icon:'smile'
					}
				]
			}
		},
		mounted() {
			document.documentElement.clientWidth < 970 ? this.collapsed = true : this.collapsed = false
			document.documentElement.clientWidth < 768 ? this.show = false : this.show = true
			window.addEventListener('resize',()=>{
				let width = document.documentElement.clientWidth
				width < 970 ? this.collapsed = true : this.collapsed = false
				width < 768 ? this.show = false : this.show = true
			})
		},
		methods:{
			handleClick(e){
				this.$router.push({path:'/menu_1',query:{key:e.key}})
			}
		}
	};
</script>

<style scoped>
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
	}
	.ant-switch-close{
		position: absolute;
		bottom: 0;
		left: 0;
		width: 100%;
		background-color: #001529;
		border-top: 1px solid #333;
		color: rgba(255,255,255,0.64);
	}
</style>
