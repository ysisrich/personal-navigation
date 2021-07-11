<template>
	<div style="position: relative;">
		<!-- 编辑个人信息 -->
		<a-tooltip placement="bottomRight">
			<template slot="title">
			  <span>更新个人信息</span>
			</template>
			<a-icon type="setting" :style="{ fontSize: '16px', color: '#08c' , position:'absolute',right:'10px',top:0}" @click="toEditOtherInfo"/>
		</a-tooltip>
		
		<!-- 懒加载 -->
		<a-skeleton  :size="120" active :paragraph="false" :loading="loading" v-for="index in 4" :key="index"/>
		
		<div v-if="!loading">
			<a-descriptions title="职位信息">
				<a-descriptions-item label="名称">
				  {{userInfo.profession}}
				</a-descriptions-item>
				<a-descriptions-item label="期望城市">
				  {{userInfo.city}}
				</a-descriptions-item>
				<a-descriptions-item label="期望薪资">
				  {{userInfo.pay}}+
				</a-descriptions-item>
				<a-descriptions-item v-if="userInfo.status == 0" label="工作状态">
				  未入职
				</a-descriptions-item>
				<a-descriptions-item v-if="userInfo.status == 1" label="工作状态">
				  在职
				</a-descriptions-item>
				<a-descriptions-item v-if="userInfo.status == 2" label="工作状态">
				  离职
				</a-descriptions-item>
				<a-descriptions-item v-if="userInfo.status == 3" label="工作状态">
				  即将入职
				</a-descriptions-item>
				<a-descriptions-item label="工龄">
				  {{userInfo.experience}}年
				</a-descriptions-item>
			</a-descriptions>
		
			<div class="ant-decription">
				<a-divider dashed />
				<div class="ant-edit-detail">
					<div style="color: rgba(0,0,0,.85); font-weight: 700; font-size: 16px;">个人说明</div>
					<div>
						<a-tooltip placement="bottomRight">
							<template slot="title">
							  <span>编辑个人说明</span>
							</template>
							<a-icon type="edit" :style="{ fontSize: '16px', color: '#08c','margin-right' :'10px'}" @click="showModal"/>
						</a-tooltip>
					</div>
				</div>
				<div style="margin: 20px auto;text-indent:2em">
					{{userInfo.decription}}
				</div>
			</div>
		</div>
		
		<a-modal
		      title="设置个人说明"
		      :visible="visible"
		      :confirm-loading="confirmLoading"
			  :width="width"
			  okText="保存"
			  cancelText="取消"
		      @ok="handleOk"
		      @cancel="handleCancel"
		    >
		      <a-textarea placeholder="请输入内容" :rows="4" v-model="value"/>
		</a-modal>
		
	</div>
</template>

<script>

export default {
	data() {
		return {
			userInfo:'',
			visible: false,
			confirmLoading: false,
			value:'',
			width:'40%',
			loading:true
		}
	},
	mounted() {
		this.getPersonInfo()
		
		let width = document.documentElement.clientWidth
		// console.log(width)
		if(width < 1200){
			this.width = '450px'
		}else if(width>=1200 && width<1800){
			this.width = '40%'
		}else{
			this.width = '510px'
		}
		
		window.addEventListener('resize',()=>{
			let width = document.documentElement.clientWidth
			// console.log(width)
			if(width < 1200){
				this.width = '450px'
			}else if(width>=1200 && width<1800){
				this.width = '40%'
			}else{
				this.width = '510px'
			}
		})
	},
	methods:{
		// 获取个人信息
		getPersonInfo() {
			this.axios.get('/person/PersonInfo')
				.then(res => {
					// console.log(res)
					if (res.status == 1) {
						this.userInfo = res.data
						this.value = this.userInfo.decription
						this.loading = false
					} else {
						this.$message.error(res.info)
					}
				})
		},
		// 编辑个人信息
		toEditOtherInfo(){
			this.$router.push('/person/editOtherInfo')
		},
		
		 showModal() {
		      this.visible = true;
		    },
		    handleOk(e) {
				this.userInfo.decription = this.value
				this.axios.put(`person/personInfo/${this.userInfo.id}`, {
						params:	this.userInfo
				}).then(res=>{
					// console.log(res)
					if (res.status == 1) {
						this.visible = false;
						this.$message.success(res.info)
					} else {
						this.$message.error(res.info)
					}
				})
		    },
		    handleCancel(e) {
		      this.visible = false;
		    },
	}
}
</script>

<style scoped>
	.ant-decription{
		margin-top: 40px;
	}
	.ant-edit-detail{
		display: flex;
		justify-content: space-between;
	}
</style>
