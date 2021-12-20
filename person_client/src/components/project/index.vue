<template>
	



<div class="card-container">
    <a-tabs type="card">
      <a-tab-pane key="1" tab="个人独立项目">
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
		<a-table v-show="projectList_mine.length == 0 && searchData" :data-source="[]" style="margin: 0 10px;"/>
		
		<!-- 项目列表 -->
		<a-row v-show="showData">
			<a-col v-for="(item,index) in projectList_mine" :key="index" :xs="24" :sm="24" :md="24" :lg="12" :xl="8">
				<Card :projectItem="item"></Card>
			</a-col>
		</a-row>
		
		<!-- 分页 -->
		<div style="text-align: right;margin-right: 10px; padding-bottom: 10px;" v-show="showData && projectList_mine.length > 0">
			<a-pagination :default-current="1" :defaultPageSize="9" :show-total="total => `总共 ${total} 个`" :total="total" @change="pagesChange"/>
		</div>
		
		<!-- 发布 -->
		<div v-show="showBtn" class="ant-position-publish" @click="publish">
			<a-icon type="plus" />
		</div>
      </a-tab-pane>

      <a-tab-pane key="2" tab="公司参与项目">
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
		<a-table v-show="projectList_company.length == 0 && searchData" :data-source="[]" style="margin: 0 10px;"/>
		
		<!-- 项目列表 -->
		<a-row v-show="showData">
			<a-col v-for="(item,index) in projectList_company" :key="index" :xs="24" :sm="24" :md="24" :lg="12" :xl="8">
				<Card :projectItem="item"></Card>
			</a-col>
		</a-row>
		
		<!-- 分页 -->
		<div style="text-align: right;margin-right: 10px; padding-bottom: 10px;" v-show="showData && projectList_company.length > 0">
			<a-pagination :default-current="1" :defaultPageSize="9" :show-total="total => `总共 ${total} 个`" :total="total" @change="pagesChange"/>
		</div>
		
		<!-- 发布 -->
		<div v-show="showBtn" class="ant-position-publish" @click="publish">
			<a-icon type="plus" />
		</div>
      </a-tab-pane>
     
    </a-tabs>
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
				projectList_mine:'',
				projectList_company:'',
				domain: this.config.mediaUrl,
				
				form:{
					search:'',
					page_size:9,
					page_current:1
				},
				total:0,
				showData:false,
				searchData:false,
				showBtn:false
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
			
			document.documentElement.clientWidth < 768 ? this.showBtn = true : this.showBtn = false
			window.addEventListener('resize',()=>{
				let width = document.documentElement.clientWidth
				width < 768 ? this.showBtn = true : this.showBtn = false
			})
		},
		methods: {
			callback(){

			},
			// 获取项目列表
			getProjectList() {
				let that = this
				this.axios.get('/projects_mine',{
						params:this.form,
					}).then(res => {
						// console.log(res)
						if (res.status == 1) {
							this.total = res.data.total
							this.projectList_mine = res.data.data
							this.showData = true
							this.projectList_mine.forEach(item => {
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

					this.axios.get('/projects_company',{
						params:this.form,
					}).then(res => {
						// console.log(res)
						if (res.status == 1) {
							this.total = res.data.total
							this.projectList_company = res.data.data
							this.showData = true
							this.projectList_company.forEach(item => {
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
			// 发布项目
			publish(){
				this.$router.push('/publish')
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


.ant-position-publish{
	position: fixed;
	right: 30px;
	bottom: 40px;
	width: 50px;
	height: 50px;
	line-height: 50px;
	border-radius: 25px;
	text-align: center;
	box-shadow: 0px 0px 9px rgba(0,0,0,.4);
	background-color: #1890FF;
	color: #FFFFFF;
}


.card-container {
  background: #f5f5f5;
  overflow: hidden;
  padding: 24px;
}
.card-container > .ant-tabs-card > .ant-tabs-content {
  height: 120px;
  margin-top: -16px;
}

.card-container > .ant-tabs-card > .ant-tabs-content > .ant-tabs-tabpane {
  background: #fff;
  padding: 16px;
}

.card-container > .ant-tabs-card > .ant-tabs-bar {
  border-color: #fff;
}

.card-container > .ant-tabs-card > .ant-tabs-bar .ant-tabs-tab {
  border-color: transparent;
  background: transparent;
}

.card-container > .ant-tabs-card > .ant-tabs-bar .ant-tabs-tab-active {
  border-color: #fff;
  background: #fff;
}
</style>
