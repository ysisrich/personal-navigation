<template>
	<a-card  class="ant-card-item" hoverable style="width: 97%;margin:0 0px 15px 10px;" @click="toDetail(noteItem.id)">

		<template slot="actions" class="ant-card-actions">
			<a-tooltip placement="top">
				<template slot="title">
					<span>编辑</span>
				</template>
				<a-icon @click.stop="share(noteItem.id)" key="edit" type="share-alt" />
			</a-tooltip>
			<a-tooltip placement="top">
				<template slot="title">
					<span>访问</span>
				</template>
				<icon-font @click.stop="toUrl(noteItem.url)" type="icon-tuichu" />
			</a-tooltip>
			
			<a-tooltip placement="top">
				<template slot="title">
					<!-- <span>删除</span> -->
				</template>
				<a-popconfirm
				    title="此操作无法恢复,是否确定删除?"
				    ok-text="确认"
				    cancel-text="取消"
				    @confirm="confirmDelete"
				    @cancel="cancelDelete"
				  >
					<a-icon @click.stop="deleteNote(noteItem.id)" type="delete" />
				  </a-popconfirm>
			</a-tooltip>
		</template>
		<a-card-meta >

			<div slot="title" class="ant-fonts" style="font-weight: 700;">
				<a-tooltip placement="top">
					<template slot="title">
						<span>{{noteItem.name}}</span>
					</template>
					Q: {{noteItem.name}}
				</a-tooltip>
			</div>
			<div slot="description" class="ant-fonts-description" style="margin: 0px auto;display: flex;">
				<div style="width: 20px; min-width: 20px;color: #000;font-weight: 600;">A： </div>
				<div class="ant-text-answer">{{noteItem.answer}}</div>
				<!-- <div class="ant-text-answer markdown-body">
					<VueMarkdown :source="noteItem.answer" v-highlight></VueMarkdown>
				</div> -->
			</div>
			
		</a-card-meta>
		
		
		
		<div v-if="noteItem.other[0].length != 0" class="ant-card-body-tags">
			<a-tag v-for="(i,index) in noteItem.other" :key="index" :color="tag_colors[Math.ceil(Math.random()*7) - 1]">
				{{i}}
			</a-tag>
		</div>
		<div v-else style="margin-top: 20px;height: 22px;"></div>

	</a-card>
</template>

<script>
	import { Icon } from 'ant-design-vue';
	import VueMarkdown from 'vue-markdown'

	const IconFont = Icon.createFromIconfontCN({
	  scriptUrl: '//at.alicdn.com/t/font_8d5l8fzk5b87iudi.js',
	});
	export default {
		props:['noteItem'],
		data() {
			return {
				tag_colors:['pink','red','orange','green','cyan','blue','purple'],
				images:[],
				copy_type:'copy',
				copy_title:'复制',
			}
		},
		components: {
		    IconFont,VueMarkdown
		},
		mounted() {
			// console.log(this.noteItem)
		},
		methods: {
			// 帖子详细介绍
			toDetail(id){
				this.$router.push(`/detail_note?id=${id}`)	
			},
			share(){
				let text = `我在个人导航发现了『 ${this.noteItem.name} 』 快来看看 ${this.config.onLineUrl}#/detail_note?id=${this.noteItem.id}`
				this.handleCopy(text)
				this.$message.success('链接已复制，感谢分享！')
			},
			// 编辑问题笔记信息
			edit(id){
				// this.$router.push(`/publish_note?id=${id}`)	
			},
			// 删除笔记记录
			deleteNote(id){
				// this.projectList.forEach(item => item.id == id ? this.images = item.images :'')
				
			},
			confirmDelete(){
				// this.$emit('deleteNote')
			},
			cancelDelete(){
				
			},
			// 访问链接
			toUrl(){
				if(!this.noteItem.url)
					return this.$message.warn('暂无访问链接')
				window.open(this.noteItem.url)
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
		}

	}
</script>

<style scoped>
	
	.ant-card-item:hover{
		box-shadow:0 0 10px rgba(0,0,0,0.3);
	}
	.ant-card-item:hover .ant-fonts{
		/* color: #1890FF; */
	}
	.ant-card-body-tags{
		margin-top: 20px;
		/* margin-bottom: 10px; */
		/* text-align: right; */
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	.ant-text-long{
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 2;
		overflow: hidden;
		word-break: break-all;
		cursor:pointer;
	}
	.v{
		color:#1890ff;
	}
	.ant-text-answer{
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 3;
		height: 65px;
		overflow: hidden;
		word-break: break-all;
	}
	.ant-fonts {
		font-weight: 700;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	
	/* .ant-fonts-description {
	    display: -webkit-box;
	    -webkit-box-orient: vertical;
	    -webkit-line-clamp: 4;
	    overflow: hidden;
		color: rgba(0,0,0,.6);
		font-weight: 600;
	} */
	.ant-card-hoverable {
	    cursor: pointer;
	}
</style>
