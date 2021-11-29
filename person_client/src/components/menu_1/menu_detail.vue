<template>
	<div>
		<a-row>
			<a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="16" style="padding: 0 10px;">
				<a-card v-if="form.name" style="width: 100%;margin-bottom:40px; overflow: hidden;" :bodyStyle="{'padding':'24px'}">
				
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
						<a-tag v-for="(i,index) in defaultTags" :color="tag_colors[Math.ceil(Math.random()*7) - 1]" :key="index">
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
							<a-icon :type="copy_type" :style="{color:'#1890ff',cursor:'pointer' }" @click="handleCopy(form.url)"/>
						</a-tooltip>
						
					</div>
					
					<div style="margin-top: 10px;" v-if="form.git_url">
						<span>gitee：</span><span style="color: #1890ff;cursor: pointer;" @click="toGitUrl">{{form.git_url}}</span> 赶快使用git命令进行clone吧。 
					</div>
					
					<div style="margin: 10px auto;display: flex;" v-if="form.introduce">
						<div style="width: 42
						px; min-width: 42px;">详情：</div>
						<div class="ant-text-long">{{form.introduce}}</div>
					</div>
					
					
					
					<template slot="actions" class="ant-card-actions">
						<a-tooltip placement="top"  @click="like">
							<template slot="title">
								<span>点赞</span>
							</template>
							<a-icon type="like" :style="{margin:'0 5px'}"/>点赞
						</a-tooltip>
					
						<a-tooltip placement="top" @click="share">
							<template slot="title">
								<span>分享</span>
							</template>
							<a-icon type="share-alt" :style="{margin:'0 5px'}"/>分享
						</a-tooltip>
					
						<a-tooltip placement="top" @click="deleteProject">
							<template slot="title">
								<span>删除</span>
							</template>
							<a-icon type="delete" :style="{margin:'0 5px'}"/>删除
						</a-tooltip>
					</template>
					
				</a-card>
				<a-card v-else>
					<!-- 懒加载 -->
					<a-skeleton  :size="120" active :paragraph="false" :loading="true" v-for="index in 5" :key="index"/>
				</a-card>
			</a-col>
			<a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="8" style="padding: 0 10px;">
				<a-card title="其他资源" style="width: 100%;" :bordered="false" :bodyStyle="{'padding':'20px'}">
				<div v-if="list.length">
					<div  class="ant-detail-other" v-for="(item,index) in list" :key="index">
						<Card :projectItem="item" />
					</div>
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
				this.axios.get(`website/${id}`).then(res => {
					console.log(res)
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
				this.axios.get('/website')
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
							
							for (var i = 0; i < 2 && i<this.projectList.length; i++) {
								// 随机数 0 - this.projectList.length
								let random = Math.ceil(Math.random()*this.projectList.length) - 1
								this.list.push(this.projectList[random])
								this.projectList.splice(random,1)
							}
							console.log(this.list)
							

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
				// this.$router.push('/menu_1')
				this.$router.go(-1)
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
			handleCopy(text) {
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
			},
			// like
			like(){
				this.$message.success('感谢点赞！')
			},
			share(){
				let text = `我在个人导航发现了『 ${this.form.name} 』 快来看看 ${this.config.onLineUrl}#/detail?id=${this.form.id}`
				this.handleCopy(text)
				this.$message.success('链接已复制，感谢分享！')
			},
			// 删除项目
			deleteProject(){
				console.log(this.form.id)
				this.$message.error('禁止删除')
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
	.ant-tag{
		margin: 5px;
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
	
	.ant-tag-card{
		position: absolute;
		top: 13px;
		right: -38px;
		width: 110px;
		height: 24px;
		line-height: 24px;
		font-size: 12px;
		letter-spacing: 5px;
		box-shadow: 0 3px 5px rgba(0,0,0,.3);
		color: #FFFFFF;
		text-align: center;
		background-color: #1890FF;
		transform: rotate(45deg);
	}
</style>
