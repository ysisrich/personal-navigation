<template>
	<a-layout>
		<Aside />
		<a-layout>
			<Header :router_path="router_path"/>
			<Content />
		</a-layout>
	</a-layout>
</template>
<script>
	import Aside from '@/components/index/Aside.vue'
	import Header from '@/components/index/Header.vue'
	import Content from '@/components/index/Content.vue'
	export default {
		data() {
			return {
				router_path:''
			}
		},
		components:{
			Header,
			Aside,
			Content
		},
		mounted() {
			// this.openNotificationWithIcon()
		},
		methods:{
			// 欢迎
			openNotificationWithIcon() {
			  this.$notification.success({
				message: '欢迎回来',
				description:'',
				topRight:'topRight'
			  });
			},
			
		}
		
	};
</script>
<style scoped>
	.ant-layout{
		height: 100%;
	}
</style>
