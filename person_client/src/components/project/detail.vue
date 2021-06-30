<template>
	<div>
		<a-row>
			<a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="16" style="padding: 0 10px;">
				<a-card v-if="form.name" style="width: 100%;margin-bottom:40px; " :bodyStyle="{'padding':'24px'}">
					<div >
						<a-button type="link" style="padding: 0;" @click="back">
							<a-icon type="left" /> 返回
						</a-button>
					</div>
					<!-- 图片 -->
					<div class="ant-card-titles">
						<div class="ant-avatar-hover">
							<a-avatar  :src="images[0]" :size="100" shape="square"/>
							<div @mouseover="IsShow = true" @mouseleave="IsShow = false" class="mask">
								<span v-show="IsShow" style="color: #fff;" @click="seeImage">
									<a-icon type="eye"  :style="{color:'#fff','font-size':'18px','vertical-align': 'bottom','margin':'0 5px'}"/>预览
								</span>
							</div>
						</div>
					</div>
					
					<div class="ant-project-info">
						{{form.name}}
					</div>
					<div style="text-align: center;">
						{{form.detail}}
					</div>
					<div style="text-align: center;margin-top: 20px;">
						<a-tag v-for="(i,index) in defaultTags" :color="tag_colors[Math.ceil(Math.random()*7) - 1]">
							{{i}}
						</a-tag>
					</div>
					<a-divider dashed />
					
					<div v-if="form.url">
						<span>链接：</span><span style="color: #1890ff;cursor: pointer;" @click="toUrl">{{form.url}}</span> 
						<a-tooltip placement="top" style="margin-left: 5px;">
							<template slot="title" >
							  <span >{{copy_title}}</span>
							</template>
							<a-icon :type="copy_type" :style="{color:'#1890ff',cursor:'pointer' }" @click="handleCopy(form.url,$event)"/>
						</a-tooltip>
						
					</div>
					
					<div style="margin-top: 10px;" v-if="form.git_url">
						<span>gitee：</span><span style="color: #1890ff;cursor: pointer;" @click="toGitUrl">{{form.git_url}}</span> 赶快使用git命令进行clone吧。 
					</div>
					
					<div style="margin: 10px auto;display: flex;">
						<div style="width: 42
						px; min-width: 42px;">详情：</div>
						<div class="ant-text-long">{{form.introduce}}</div>
					</div>
					
					<div style="margin-bottom: 20px;">
						<span >时间：</span><span>{{form.create_time}}</span>
					</div>
					
				</a-card>
				<a-card v-else>
					<!-- 懒加载 -->
					<a-skeleton  :size="120" active :paragraph="false" :loading="true" v-for="index in 5" :key="index"/>
				</a-card>
			</a-col>
			<a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="8" style="padding: 0 10px;">
				<a-card title="其他资源" style="width: 100%;" :bordered="false" :bodyStyle="{'padding':'20px'}">
					<div v-if="list.length > 0" class="ant-detail-other" v-for="(item,index) in list" >
						<Card :projectItem="item" />
					</div>
					<!-- 懒加载 -->
					<a-skeleton v-if="list.length == 0" :size="120" active :paragraph="false" :loading="true" v-for="index in 5" :key="index"/>
				</a-card>
			</a-col>
		</a-row>

	</div>

</template>

<script>
	import Card from './card.vue'
	export default {
		data() {
			return {
				id: this.$route.query.id,
				projectList: '',
				list:[],
				IsShow:false,
				loading:true,

				domain: this.config.mediaUrl,
				tag_colors: ['pink', 'red', 'orange', 'green', 'cyan', 'blue', 'purple'],
				images: [],
				form: '',
				defaultTags:[],
				
				copy_type:'copy',
				copy_title:'复制',
			}
		},
		components: {
			Card,
		},
		mounted() {
			this.getProjectOne(this.$route.query.id)
			this.getProjectList()
		},
		methods: {
			// 根据id获取项目信息
			getProjectOne(id) {
				this.axios.get(`project/${id}`).then(res => {
					// console.log(res)
					if (res.status == 1) {
						this.form = res.data
						let arr = res.data.tag.split(',')
						let imgs = res.data.image.split(',')

						arr.forEach(item => this.defaultTags.push(item))
						imgs.forEach((item, index) => {
							this.images.push( this.config.mediaUrl + item)
						})
						this.loading = false
					} else {
						that.$message.error(res.info)
					}
				})
			},
			// 获取项目列表
			getProjectList() {
				let that = this
				this.axios.get('/project')
					.then(res => {
						// console.log(res)
						if (res.status == 1) {
							this.projectList = res.data
							// 去除自己
							this.projectList.forEach((item,index,array) => {
								if(this.id == item.id){
									array.splice(index,1)
								}
							})
							
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
							
							for (var i = 0; i < 2; i++) {
								// 随机数 0 - this.projectList.length
								let random = Math.ceil(Math.random()*this.projectList.length) - 1
								this.list.push(this.projectList[random])
								this.projectList.splice(random,1)
							}
							
							

						} else {
							that.show = true
							this.$message.error(res.info)
						}
					})
					.catch(err => {
						console.log(err)
					})
			},
			back(){
				this.$router.push('/project')
			},
			// 查看图片
			seeImage(id){
				this.$viewerApi({
				  images: this.images,
				})
			},
			// 访问链接
			toUrl(){
				window.open(this.form.url)
			},
			// 复制链接
			handleCopy(text, event) {
				var _input = document.createElement("input");   // 直接构建input
				    _input.value = text;  // 设置内容
				    document.body.appendChild(_input);    // 添加临时实例
				    _input.select();   // 选择实例内容
				    document.execCommand("Copy");   // 执行复制
				    document.body.removeChild(_input); // 删除临时实例
					this.copy_type = 'check'
					this.copy_title = '复制成功'
			},
			toGitUrl(){
				window.open(this.form.git_url)
			}
		}

	}
</script>

<style scoped>
	.ant-detail {
		width: 100%;
		height: 400px;
		margin: 0 10px;
		margin-bottom: 50px;
		background-color: #FFFFFF;
	}
	.ant-detail-other{
		margin: 25px 0;
	}
	.ant-card .ant-detail-other:first-child{
		margin-top: 10px;
	}
	.ant-card-titles{
		text-align: center; 
		cursor: pointer;
		position: relative;
	}
	.ant-avatar-hover{
		display: inline-block;
		vertical-align: bottom;
	}
	
	.ant-avatar-hover:hover .mask {
		position: absolute;
		display: inline-block;
		top: 0;
		left: 50%;
		width: 100px;
		height: 100px;
		transform: translate(-50%);
		background-color: rgba(0, 0, 0, .5);
		cursor: pointer;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.ant-project-info {
		text-align: center;
		color: rgba(0,0,0,.85);
		font-weight: 600;
		font-size: 19px;
		margin: 20px auto;
	}
	.ant-text-long{
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 4;
		overflow: hidden;
	}
</style>
