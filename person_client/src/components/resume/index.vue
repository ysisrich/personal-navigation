<template>
	<div style="padding:50px;background-color: #FFF;">
		
		
		<!-- 附件简历 -->
		<a-row>
			<a-col :xs="24" :sm="24" :md="24" :lg="8" :xl="8">
				<!-- <div class="ant-resume-title">附件简历</div> -->
			</a-col>
			<a-col :xs="24" :sm="24" :md="24" :lg="8" :xl="8">
				<a-upload-dragger
				    name="file"
					listType="picture-card"
				    :action="url"
				    @change="handleChange"
				  >
				    <p class="ant-upload-drag-icon">
				      <a-icon type="file-add" />
				    </p>
				    <p class="ant-upload-text" style="font-weight: 700;">
				      将你的简历文件拖到此处
				    </p>
				    <p class="ant-upload-hint">
				      支持格式：pdf、doc、docx、ppt、pptx、png、jpg、jpeg
				    </p>
				  </a-upload-dragger>
			</a-col>
		</a-row>

		<!-- 暂无数据 -->
		<a-table v-if="resumeList && resumeList.length == 0" :data-source="[]" style="margin: 10px;"/>


		<a-row>
			<a-col :xs="24" :sm="8" :md="8" :lg="4" :xl="4" v-for="(item,index) in resumeList" :key="index">
				<div class="ant-file">
					<img v-if="item.name.split('.')[1] == 'docx' || item.name.split('.')[1] == 'doc'" src="@/assets/imgs/wps.png" alt="">
					<img v-else-if="img_format(item.name)" src="@/assets/imgs/picture.png" alt="">
					<img v-else-if="item.name.split('.')[1] == 'pdf'" src="@/assets/imgs/pdf.png" alt="">
					<span class="ant-name">{{item.name}}</span>
					<span>{{item.create_time}}</span>
					<span class="ant-actions">
						<span> <a-button type="primary" size="small" @click="downloadFile(item)"> 下载 </a-button> </span>
						<span> <a-button type="danger" size="small" @click="deleteFile(item)"> 删除 </a-button> </span>
					</span>
				</div>
			</a-col>
		</a-row>
	</div>
</template>

<script>
import moment from 'moment'
export default {
	data(){
		return {
			show:false,
			url: this.config.interfaceUrl + '/resume/uploadResumeFile',
			resumeList:[],
			show:false,
			imgs:['png','jpg','jpeg']
		}
	},
	mounted() {
		this.initData()

		document.documentElement.clientWidth < 768 ? this.show = false : this.show = true
		window.addEventListener('resize',()=>{
			let width = document.documentElement.clientWidth
			width < 768 ? this.show = false : this.show = true
		})
	},
	methods:{
		 handleChange(info) {
		      const status = info.file.status;
		      if (status !== 'uploading') {
		        // console.log(info.file, info.fileList);
		      }
		      if (status === 'done') {
		        console.log(info.file, info.fileList);
				var form ={
					name:info.file.name,
					file_type:info.file.type,
					// create_time:moment(info.file.astModifiedDate).format('YYYY/MM/DD HH:mm'),
					file_url:info.file.response.data
				}

				this.axios.post('resume/createResume',
					{
						params:	form
					}
				).then(res=>{
					console.log(res)
					if (res.status == 1) {
						this.$message.success(`${info.file.name} 上传成功！`)
						this.initData()
					} else {
						that.$message.error(res.info)
					}
				})


		      } else if (status === 'error') {
		        this.$message.error(`${info.file.name} 上传失败！`);
		      }
		    },

			// 下载文件
			downloadFile(item){
				open(this.config.mediaUrl + item.file_url)
			},

			// 删除文件
			deleteFile(item){
				console.log(item)
				this.axios.post('resume/deleteFile',item)
				.then(res=>{
					console.log(res)
					if(res.status == 1){
						this.initData()
						this.$message.success(res.info);
					}else {
						this.$message.error(res.info);
					}
				})
			},

			// 图片
			img_format(item){
				return this.imgs.includes(item.split('.')[1])
			},

			// 初始化数据
			initData(){
				this.axios.get('resume/resumeList').then(res=>{
					console.log(res)
					if (res.status == 1) {
						this.resumeList =res.data
					} else {
						this.$message.error(res.info)
					}
				})
			}
	}
}
</script>

<style scoped lang="scss">
@mixin  flx($jsc,$ali,$drt:row) {
     display: flex;
  		flex-direction: $drt;
  		justify-content: $jsc;
  		align-items: $ali;
  }
	.ant-resume-title{
		color: #1f2329;
		font-size: 20px;
		font-weight: 700;
		text-align: center;
		margin-bottom: 10px;
	}
	/deep/ .ant-upload-list{
		display: none;
	}
	.ant-file{
		@include flx(center, center, column);
		cursor: pointer;
		margin: 20px;
		margin-top: 50px;
		img{
			width: 50%;
		}
		.ant-name{
			display: block;
			width: 100%;
			text-align: center;
			text-overflow: ellipsis;
			overflow: hidden;
			white-space: nowrap;
		}
		.ant-actions{
			margin-top: 10px;
			span{
				margin: 0 5px;
			}
		}
	}
</style>
