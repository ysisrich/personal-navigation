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
					
					<div class="ant-project-info">
						{{form.name}}
					</div>
					<div class="ant-text-answer markdown-body">
						<VueMarkdown :source="form.answer" v-highlight></VueMarkdown>
					</div>
					<a-divider dashed />
					
					<div v-if="form.url">
						<span>相关链接：</span><span style="color: #1890ff;cursor: pointer;" @click="toUrl">{{form.url}}</span> 
						<a-tooltip placement="top" style="margin-left: 5px;">
							<template slot="title" >
							  <span >{{copy_title}}</span>
							</template>
							<a-icon :type="copy_type" :style="{color:'#1890ff',cursor:'pointer' }" @click="handleCopy(form.url)"/>
						</a-tooltip>
					</div>
					
					<div style="margin: 10px 0;" v-if="form.other">
						<span>内容标签：</span>
						<span style="color: #1890ff;cursor: pointer;">
							<a-tag v-for="(i,index) in defaultTags" :key="index" :color="tag_colors[Math.ceil(Math.random()*7) - 1]">
								{{i}}
							</a-tag>
						</span> 
					</div>
					
					<div style="margin-bottom: 10px" v-if="form.code_file">
						<span>代码文件：</span>
						<span style="color: #1890ff;cursor: pointer;">
							<a-tag :color="tag_colors[Math.ceil(Math.random()*7) - 1]">
								{{form.code_file.split('.')[1]}}文件
							</a-tag>
							<span @click="downloadFile(form.code_file)">
								下载 <a-icon type="arrow-down" />
							</span>
						</span> 
					</div>
					
					
					<div style="margin-bottom: 20px;">
						<span >创建时间：</span><span>{{form.create_time}}</span>
					</div>
					
					<!-- <template slot="actions" class="ant-card-actions">
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
					</template> -->
					
				</a-card>
				<a-card v-else>
					<!-- 等待加载 -->
					<a-skeleton  :size="120" active :paragraph="false" :loading="true" v-for="index in 5" :key="index"/>
				</a-card>
			</a-col>
			<a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="8" style="padding: 0 10px;">
				<a-card title="其他资源" style="width: 100%;" :bordered="false" :bodyStyle="{'padding':'20px'}">
					<div v-if="list.length > 0" class="ant-detail-other" v-for="(item,index) in list" :key="index">
						<Card :noteItem="item" />
					</div>
					<!-- 等待加载 -->
					<a-skeleton v-if="list.length == 0" :size="120" active :paragraph="false" :loading="true" v-for="index in 5" :key="index"/>
				</a-card>
			</a-col>
		</a-row>

	</div>

</template>

<script>
	import Card from './card.vue'
	import VueMarkdown from 'vue-markdown'
	
	export default {
		data() {
			return {
				id: this.$route.query.id,
				noteList: '',
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
			Card,VueMarkdown
		},
		mounted() {
			this.getNoteOne(this.$route.query.id)
			this.getNoteList()
		},
		methods: {
			// 根据id获取note信息
			getNoteOne(id) {
				this.axios.get(`note/${id}`).then(res => {
					console.log(res)
					if (res.status == 1) {
						this.form = res.data
						let arr = res.data.other.split(',')
						// let imgs = res.data.image.split(',')

						arr.forEach(item => this.defaultTags.push(item))
						// imgs.forEach((item, index) => {
						// 	this.images.push( this.config.mediaUrl + item)
						// })
						this.loading = false
					} else {
						that.$message.error(res.info)
					}
				})
			},
			// 获取note列表
			getNoteList() {
				let that = this
				this.axios.get('/note')
					.then(res => {
						// console.log(res)
						if (res.status == 1) {
							this.noteList = res.data
							// 去除自己
							this.noteList.forEach((item,index,array) => {
								if(this.id == item.id){
									array.splice(index,1)
								}
							})
							
							this.noteList.forEach(item => {
								item.other = item.other.split(',')
							})
							
							for (var i = 0; i < 2; i++) {
								// 随机数 0 - this.noteList.length
								let random = Math.ceil(Math.random()*this.noteList.length) - 1
								this.list.push(this.noteList[random])
								this.noteList.splice(random,1)
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
				this.$router.push('/experience')
			},
			// 访问链接
			toUrl(){
				window.open(this.form.url)
			},
			// 下载相关代码文件
			downloadFile(file){
				//下载文件
				let url = this.config.mediaUrl + file
				open(url)
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
				let text = `我在个人导航发现了『 ${this.form.name} 』 快来看看 ${this.config.onLineUrl}#/detail_note?id=${this.form.id}`
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
		font-weight: 700;
		color: red;
		font-size: 25px;
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
