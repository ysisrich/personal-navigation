<template>
	<a-card  class="ant-card-item" hoverable style="width: 97%;margin:0 0px 15px 10px;" @click="toDetail(projectItem.id)">

		<template slot="actions" class="ant-card-actions">
			<a-tooltip placement="top">
				<template slot="title">
					<span>预览</span>
				</template>
				<a-icon @click.stop="seeImage(projectItem.id)" type="eye" />
			</a-tooltip>

			<a-tooltip placement="top">
				<template slot="title">
					<span>编辑</span>
				</template>
				<a-icon @click.stop="edit(projectItem.id)" key="edit" type="edit" />
			</a-tooltip>

			<a-tooltip placement="top">
				<template slot="title">
					<span>访问</span>
				</template>
				<icon-font @click.stop="visit(projectItem.url)" type="icon-tuichu" />
			</a-tooltip>
		</template>
		<a-card-meta style="height: 100px; ">

			<div slot="title" class="ant-fonts" style="font-weight: 700;">
				<a-tooltip placement="top">
					<template slot="title">
						<span>{{projectItem.name}}</span>
					</template>
					{{projectItem.name}}
				</a-tooltip>
			</div>
			<div slot="description" class="ant-fonts-description">
				{{projectItem.detail}}
			</div>
			<!-- <a-avatar slot="avatar" shape="square" :size="100" :src="projectItem.images[0]" /> -->
			<img class="ant-img" slot="avatar" v-lazy="projectItem.images[0]" />

		</a-card-meta>
		<div class="ant-card-body-tags">
			<a-tag v-for="(i,index) in projectItem.tag" :key="index" :color="tag_colors[Math.ceil(Math.random()*7) - 1]">
				{{i}}
			</a-tag>
		</div>
	</a-card>
</template>

<script>
	import { Icon } from 'ant-design-vue';
	
	const IconFont = Icon.createFromIconfontCN({
	  scriptUrl: '//at.alicdn.com/t/font_8d5l8fzk5b87iudi.js',
	});
	export default {
		props:['projectItem'],
		data() {
			return {
				tag_colors:['pink','red','orange','green','cyan','blue','purple'],
				images:[]
			}
		},
		components: {
		    IconFont,
		},
		mounted() {
			// console.log(this.projectItem)
		},
		methods: {
			// 项目详细介绍
			toDetail(id){
				this.$router.push(`/detail?id=${id}`)	
			},
			// 访问项目链接
			visit(item){
				item ? window.open(item) : this.$message.warning('暂无访问链接')
			},
			// 编辑项目信息
			edit(id){
				this.$router.push(`/editProject?id=${id}`)	
			},
			// 查看图片
			seeImage(id){
				// this.projectList.forEach(item => item.id == id ? this.images = item.images :'')
				this.$viewerApi({
				  images: this.projectItem.images,
				})
			},
		}

	}
</script>

<style scoped>
	.ant-card-item:hover{
		box-shadow:0 0 10px rgba(0,0,0,0.3);
	}
	.ant-card-item:hover .ant-fonts{
		color: #1890FF;
	}
	.ant-card-body-tags{
		margin-top: 30px;
		margin-bottom: 10px;
		text-align: right;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	.ant-carousel{
		width: 300px;
		height: 200px;
	}
	.ant-fonts {
	    overflow: hidden;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	}
	
	.ant-fonts-description {
	    display: -webkit-box;
	    -webkit-box-orient: vertical;
	    -webkit-line-clamp: 3;
	    overflow: hidden;
	}
	.ant-card-hoverable {
	    cursor: pointer;
	}
</style>
