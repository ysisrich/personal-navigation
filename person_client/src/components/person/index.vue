<template>
  <div class="ant-person-info">
	  <a-row style="width: 100%;">
	  	<a-col :xs="24" :sm="24" :md="8" :lg="4" :xl="4" :style="{height: height}">
			<a-menu :style="{height: height}"  :mode="mode" :selected-keys="[current]" @click="handleClick">
			  <a-menu-item key="baseInfo">
			    基本信息
			  </a-menu-item>
			  <a-menu-item key="other">
			    其他
			  </a-menu-item>
			</a-menu>
	  	</a-col>
	  	<a-col :xs="24" :sm="24" :md="16" :lg="20" :xl="20" style="padding: 0 10px;">
			<a-card style="width: 100%" :bordered="false">
					  <router-view />
			</a-card>
	  	</a-col>
	  </a-row>
      
	  
    </div>
</template>


<script >
export default {
  data() {
    return {
		current:'',
		mode:'inline',
		height:''
    };
  },
  mounted() {
	this.current = this.$router.currentRoute.fullPath.substr(1).split('/')[1]
	document.documentElement.clientWidth < 768? this.mode = 'horizontal' : this.mode = 'inline'
	document.documentElement.clientWidth < 768? this.height = 'auto' : this.height = '100%'
	window.addEventListener('resize',()=>{
		let width = document.documentElement.clientWidth
		// console.log(width)
		width < 768? this.mode = 'horizontal' : this.mode = 'inline'
		width < 768? this.height = 'auto' : this.height = '100%'
	})
	
  },
  methods: {
    handleClick(e) {
	  this.current = e.key
      e.key == 'baseInfo' ? this.$router.push('/person/baseInfo') : this.$router.push('/person/other')
    },
  },
};
	
</script>


<style scoped>
	.ant-person-info{
		display: flex;
		width: 100%;
		background-color: #FFFFFF;
		padding: 10px 0;
		font-weight: 700;
	}
</style>
