<template>
	<router-view />
</template>

<script>
import Index from '@/layout/default.vue'
export default {
  name: 'app',
  components:{
	  Index
  }
}
</script>

<style>
body{
	margin: 0;
}
</style>
