<template>
	<a-layout-content :style="{ margin: '24px 16px',  minHeight: '280px' }">
		<keep-alive>
			<router-view v-if="$route.meta.keepAlive" :key="$router.currentRoute.fullPath"/>
		</keep-alive>
		<router-view v-if="!$route.meta.keepAlive" :key="$router.currentRoute.fullPath"></router-view>
		<!-- <Copyright />		 -->
	</a-layout-content>
</template>

<script>
	import Copyright from '@/components/index/Copyright'
	export default {
		components:{Copyright},
		data(){
			return {}
		},
		mounted() {
			
		}
	}
</script>

<style>
</style>
