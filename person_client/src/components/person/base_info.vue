<template>
	<div class="ant-base">
		<!-- 编辑个人信息 -->
		<a-tooltip placement="bottomRight">
			<template slot="title">
			  <span>更新个人信息</span>
			</template>
			<a-icon type="setting" :style="{ fontSize: '16px', color: '#08c' , position:'absolute',right:'10px',top:0}" @click="toEditBaseInfo"/>
		  </a-tooltip>
		  
		<div class="ant-avatar-hover">
			<a-avatar icon="user" :src="avatar" :size="120" />
			<div @mouseover="IsUpload = true" @mouseleave="IsUpload = false" class="mask">
				<a-upload v-show="IsUpload" :fileList="fileList" name="file" :action="url"
					@change="handleChange">
					<a-icon type="upload" :style="{color:'#fff',fontSize:'17px'}" /> <span
						style="color: #FFFFFF;">更换头像</span>
				</a-upload>
			</div>
		</div>

		<div class="ant-base-info">
			<a-skeleton  :size="120" active :paragraph="false" :loading="loading" v-for="index in 4" :key="index"/>
			<div v-if="!loading">
				<h3 style="font-weight: 600;font-size: 20px;">{{userInfo.name}} <a-icon :type="userInfo.sex == 1 ? 'man' : 'woman'" :style="{ fontSize: '15px', color: '#08c' ,marginLeft:'6px' }"/></h3>
				<div>
					<a-space size="small" class="ant-overfolw">
						<a-tag color="red">{{userInfo.age}}岁</a-tag>
						<a-tag color="green">{{userInfo.hometown}}</a-tag>
						<a-tag color="cyan">{{userInfo.phone}}</a-tag>
						<a-tag color="blue">{{userInfo.email}}</a-tag>
						<!-- <a-tag color="purple">500235199709273138</a-tag> -->
					</a-space>
				</div>
				
				<a-space size="small" class="ant-overfolw">
					<a-tag color="red" v-if="userInfo.college_type == 0">专科</a-tag>
					<a-tag color="red" v-if="userInfo.college_type == 1">本科</a-tag>
					<a-tag color="red" v-if="userInfo.college_type == 2">其他</a-tag>
					<a-tag color="orange">{{userInfo.college}}</a-tag>
					<a-tag color="pink">{{userInfo.major}}</a-tag>
					<a-tag color="orange">{{userInfo.graduation_year}}年应届生</a-tag>
					<a-tag color="blue" v-if="userInfo.identity == 0">学生</a-tag>
					<a-tag color="blue" v-if="userInfo.identity == 1">打工人</a-tag>
				</a-space>
			</div>
		</div>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				avatar: '',
				IsUpload: false,
				fileList:[],
				url:this.config.interfaceUrl + '/person/uploadAvatar',
				userInfo:'',
				loading:true
			}
		},
		mounted() {
			this.getPersonInfo()
		},
		methods: {
			// 上传图片
			handleChange(info) {
				if (info.file.status !== 'uploading') {
					console.log(info.file, info.fileList);
				}
				if (info.file.status == 'uploading') {
					// console.log(info.file, info.fileList);
					this.fileList = info.fileList
				}
				if (info.file.status === 'done') {
					this.$message.success('头像上传成功');
					this.getPersonInfo()
					this.fileList = []
				} else if (info.file.status === 'error') {
					this.$message.error(`${info.file.name} file upload failed.`);
				}
			},
			// 获取个人信息
			getPersonInfo() {
				let that = this
				this.axios.get('/person/PersonInfo')
					.then(res => {
						// console.log(res)
						if (res.status == 1) {
							// console.log(res.data)
							that.userInfo = res.data
							that.avatar = that.config.mediaUrl + res.data.avatar
							that.loading = false
							// that.$message.success(res.info)
						} else {
							that.$message.error(res.info)
						}
					})
			},
			// 编辑个人信息
			toEditBaseInfo(){
				this.$router.push('/person/editBaseInfo')
			}
		},
	}
</script>

<style scoped>
	.ant-base {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		position: relative;
		/* margin-top: 50px; */
	}
	.ant-avatar-hover:hover .mask {
		position: absolute;
		top: 0;
		left: 50%;
		width: 120px;
		height: 120px;
		transform: translate(-50%);
		background-color: rgba(0, 0, 0, .5);
		border-radius: 50%;
		cursor: pointer;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.ant-base-info{
		margin: 20px auto;
		width: 100%;
		height: 200px;
		/* height: 800px; */
		text-align: center;
		/* background-color: red; */
	}
	.ant-space{
		/* margin: 6px auto; */
	}
	.ant-overfolw{
		display: flex;
		justify-content: center;
		flex-wrap: wrap;
	}
	.ant-tag {
		margin: 5px 0;
	}
</style>
