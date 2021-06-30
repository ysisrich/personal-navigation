<template>
	<a-layout-content :style="{ margin: '24px 16px',  minHeight: '280px' }">
		<router-view :key="$router.currentRoute.fullPath"/>
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
