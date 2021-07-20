<template>
	<div style="padding:50px;background-color: #FFF;">
		<!-- 暂无数据 -->
		<a-table v-if="show" :data-source="[]" style="margin: 0 10px;"/>
		
		<!-- 附件简历 -->
		<a-row>
			<a-col :xs="24" :sm="24" :md="24" :lg="8" :xl="8">
				<div class="ant-resume-title">附件简历</div>
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
	</div>
</template>

<script>
export default {
	data(){
		return {
			show:false,
			url: this.config.interfaceUrl + '/resume/uploadResumeFile',
		}
	},
	mounted() {
		
	},
	methods:{
		 handleChange(info) {
		      const status = info.file.status;
		      if (status !== 'uploading') {
		        console.log(info.file, info.fileList);
		      }
		      if (status === 'done') {
		        this.$message.success(`${info.file.name} file uploaded successfully.`);
		      } else if (status === 'error') {
		        this.$message.error(`${info.file.name} file upload failed.`);
		      }
		    },
	}
}
</script>

<style scoped>
	.ant-resume-title{
		color: #1f2329;
		font-size: 20px;
		font-weight: 700;
		text-align: center;
		margin-bottom: 10px;
	}
</style>
