<template>
	<div>
        <div class="ant-note">
			<div class="ant-note-title">💖 笔记本</div>
			<div style="margin: 10px auto; color: rgba(0,0,0,.78);">将所遇到的框架进行记录，方便复习整理，有利于知识的巩固!!!</div>
			<a-button type="primary" icon="plus" @click="showAddform">
			      {{key == 6?'添加框架':key==7?'添加资源':key==8?'添加UI库':key==9?'添加语言':"添加文档"}}
			</a-button>
		</div>
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
			<a-col v-for="(item,index) in projectList" :key="index" :xs="24" :sm="24" :md="24" :lg="12" :xl="8">
				<Card :projectItem="item"></Card>
			</a-col>
		</a-row>
		
		<!-- 分页 -->
		<div style="text-align: right;margin-right: 10px; padding-bottom: 10px;" v-show="showData && projectList.length > 0">
			<a-pagination :default-current="1" :defaultPageSize="9" :show-total="total => `总共 ${total} 个`" :total="total" @change="pagesChange"/>
		</div>
		

	</div>

</template>

<script>
	import Card from './card.vue'
	import bus from '@/plugins/eventBus.js'
	export default {
		data() {
			return {
                key:1,
				show: false,
				status: '500',
				sub_title: '抱歉，服务器出现问题',
				projectList: '',
				domain: this.config.mediaUrl,
				
				form:{
					search:'',
                    category:'',
					page_size:9,
					page_current:1,
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
            this.key = this.$route.query.key
            
			
			document.documentElement.clientWidth < 768 ? this.showBtn = true : this.showBtn = false
			window.addEventListener('resize',()=>{
				let width = document.documentElement.clientWidth
				width < 768 ? this.showBtn = true : this.showBtn = false
			})
		},
		methods: {
			// 获取项目列表 	6 框架 7 资源 8 ui库 9 语言 10 文档	
			getProjectList() {
				let that = this
                this.form.category = this.$route.query.key

				this.axios.get('/websites',{
						params:this.form,
					}).then(res => {
						console.log(res)
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
            showAddform(){
				this.$router.push({path:'/create',query:{key:this.key}})
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
.ant-note{
		/* width: 100%; */
		background-color: #FFFFFF;
		padding: 20px;
		margin: 0 0 20px 10px;
	}
	.ant-note-title{
		font-size: 20px;
		font-weight: 600;
		color: #000000;
	}
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
</style>
