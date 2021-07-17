<template>
	<div style="width: 100%;height: 100%;background-color: #FFFFFF;padding: 0 10px;">
		<div class="ant-editors"><span>Q: {{name}}</span> <a-button type="primary" @click="save">保存</a-button></div>
		<Editor  :value="answer" placeholder="请详细解答或方法介绍" :uploadImages="uploadImages" :plugins="plugins" @change="handleChange" />
	</div>
</template>

<script>
import { Editor, Viewer } from '@bytemd/vue'
import 'bytemd/dist/index.min.css'
import gfm from '@bytemd/plugin-gfm'
import highlight from '@bytemd/plugin-highlight'
import highlight_ssr from '@bytemd/plugin-highlight-ssr'

const plugins = [
  gfm(),
  highlight(),
  highlight_ssr()
  // Add more plugins here
]

export default {
  components: { Editor },
  props:['name','answer'],
  data() {
    return { 
		value: '',
		plugins
		
	}
  },
  mounted() {
	  // this.value = this.answer
	  
  },
  methods: {
    handleChange(v) {
      this.value = v
    },
	save(){
		// console.log(this.value)
		this.$emit('save',this.answer)
	},
	uploadImages(){
		
	}
  },
}
</script>
<style scoped>
	.ant-editors{
		width: 100%;
		/* height: 50px; */
		/* line-height: 50px; */
		padding: 10px 3px;
		color: #000000;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.ant-editors span:first-child{
		font-size: 20px;
		font-weight: 600;
		padding-left: 3px;
	}
</style>