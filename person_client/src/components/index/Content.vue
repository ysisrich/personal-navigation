<template>
	<a-layout-content :style="{ margin: '24px 16px',  minHeight: '280px' }">
		<keep-alive>
			<router-view v-if="$route.meta.keepAlive" :key="$router.currentRoute.fullPath"/>
		</keep-alive>
		<router-view v-if="!$route.meta.keepAlive" :key="$router.currentRoute.fullPath"></router-view>
	</a-layout-content>
</template>

<script>
	export default {
		data(){
			return {}
		},
		mounted() {
			
		}
	}
</script>

<style>
</style>
