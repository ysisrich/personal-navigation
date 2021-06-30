<template>
	<div>
		<a-result v-show="show" :status="status" :title="status" :sub-title="sub_title">
			<!-- <template #extra>
		      <a-button type="primary">
		        Back Home
			  </a-button>
			</template> -->
		</a-result>
		
		<!-- 加载中 -->
		<div class="loading" v-show="!showData">
			<a-spin size="large" :spinning="!showData"/>
		</div>
		
		<!-- 暂无数据 -->
		<a-table v-show="projectList.length == 0 && searchData" :data-source="[]" style="margin: 0 10px;"/>
		
		<!-- 项目列表 -->
		<a-row v-show="showData">
			<a-col v-for="(item,index) in projectList" :xs="24" :sm="24" :md="24" :lg="12" :xl="8">
				<Card :projectItem="item"></Card>
			</a-col>
		</a-row>
		
		<!-- 分页 -->
		<div style="text-align: right;margin-right: 10px; padding-bottom: 10px;" v-show="showData && projectList.length > 0">
			<a-pagination :default-current="1" :defaultPageSize="9" :total="total" @change="pagesChange"/>
		</div>

	</div>

</template>

<script>
	import Card from './card.vue'
	import bus from '@/plugins/eventBus.js'
	export default {
		data() {
			return {
				show: false,
				status: '500',
				sub_title: '抱歉，服务器出现问题',
				projectList: '',
				domain: this.config.mediaUrl,
				
				form:{
					search:'',
					page_size:9,
					page_current:1
				},
				total:0,
				showData:false,
				searchData:false
			}
		},
		components: {
			Card
		},
		mounted() {
			this.getProjectList()
			bus.$on('searchData',(value)=>{
				this.searchData = true
				this.form.search = value
				this.getProjectList()
			})
		},
		methods: {
			// 获取项目列表
			getProjectList() {
				let that = this
				this.axios.get('/projects',{
						params:this.form,
					}).then(res => {
						// console.log(res)
						if (res.status == 1) {
							this.total = res.data.total
							this.projectList = res.data.data
							this.showData = true
							this.projectList.forEach(item => {
								item.image = item.image.split(',')
								item.tag = item.tag.split(',')
								let arr = []
								item.image.forEach(i => {
									i = that.domain + i
									arr.push(i)
								})
								item.images = arr
							})

						} else {
							that.show = true
							this.$message.error(res.info)
						}
					})
					.catch(err => {
						console.log(err)
					})
			},
			
			// 分页
			pagesChange(page,pagesize){
				// console.log(page,pagesize)
				this.form.page_current = page
				this.getProjectList()
			}
		}

	}
</script>

<style scoped>
.loading {
  text-align: center;
  background: rgba(0, 0, 0, 0.05);
  border-radius: 4px;
  margin-bottom: 20px;
  padding: 30px 50px;
  margin: 20px 0;
}
</style>
