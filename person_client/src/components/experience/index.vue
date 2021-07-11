<template>
	<div>
		<!-- 暂无数据 -->
		<a-table v-if="!IsData" :data-source="[]" style="margin: 0 10px;"/>		
		
		<div class="ant-note">
			<div class="ant-note-title">💖 笔记本</div>
			<div style="margin: 10px auto; color: rgba(0,0,0,.78);">随时记笔记，养成良好习惯，将所遇到的问题进行记录，方便复习整理，有利于知识的巩固!!!</div>
			<a-button type="primary" icon="plus"  @click="showNoteForm">
			      写笔记
			</a-button>
		</div>
		
		<a-modal
		      title="写笔记"
		      :visible="visible"
		      :confirm-loading="confirmLoading"
			  :width="width"
			  :footer="null"
		    >
			  
			  <a-form-model ref="ruleForm" :model="form" :rules="rules" :label-col="labelCol" :wrapper-col="wrapperCol"
			  	labelAlign="left">
			  	<a-form-model-item ref="name" label="名称" prop="name">
			  		<a-input v-model="form.name" placeholder="遇到的问题名称或者讨厌的bug"
			  			@blur="  () => { $refs.name.onFieldBlur();} " />
			  	</a-form-model-item>
			  	<a-form-model-item ref="answer" label="答案" prop="answer">
			  		<a-input v-model="form.answer" placeholder="用简洁的语言解答问题或者解决方法"
			  			@blur="  () => { $refs.answer.onFieldBlur();} " />
			  	</a-form-model-item>
			  	<a-form-model-item ref="url" label="相关链接" prop="url">
			  		<a-input v-model="form.url" placeholder="网上解决的方法或者知识点相关官网"
			  			@blur="  () => { $refs.url.onFieldBlur();} " />
			  	</a-form-model-item>
			  	<a-form-model-item label="详细">
			  		<a-input v-model="form.other" placeholder="其他相关知识" type="textarea"
			  			style="height: 100px; resize: none;" />
			  	</a-form-model-item>
				
				<a-form-model-item :wrapper-col="wrapperCol1">
					<a-button type="primary" style="width:40%;min-width: 64px;" @click="handleOk">
						提交
					</a-button>
					<a-button style="margin-left: 30px;" @click="handleCancel">
						取消
					</a-button>
				</a-form-model-item>
				
			  </a-form-model>
		</a-modal>
		
	</div>
</template>

<script>

export default {
	data(){
		return {
			IsData:true,
			visible:false,
			confirmLoading:false,
			width:'40%',
			value:'',
			
			labelCol: {
				sm: {
					span: 12,
				},
				md: {
					span: 8,
					offset: 0
				},
				lg: {
					span: 5,
					offset: 0
				},
			},
			wrapperCol: {
				sm: {
					span: 24,
				},
				md: {
					span: 16,
					offset: 0
				},
				lg: {
					span: 19,
					offset: 0
				},
			},
			wrapperCol1: {
				sm: {
					span: 24,
					offset: 0
				},
				md: {
					span: 16,
					offset: 8
				},
				lg: {
					span: 19,
					offset: 5
				},
			},
			
			// 笔记信息
			form: {
				name:'',
				answer:'',
				url:'',
				other:''
			},
			rules: {
				name: [{
					required: true,
					message: '请填写笔记名称或bug',
					trigger: 'change'
				}, ],
				answer: [{
					required: true,
					message: '请填写解决方法',
					trigger: 'change'
				}],
				other: [{
					required: true,
					message: '请填写详细介绍及说明',
					trigger: 'change'
				}],
				// url: [{
				// 		required: true,
				// 		message: '请填写网站链接',
				// 		trigger: 'change'
				// 	},
				// 	// { validator: url_validate, message: '请填写正确域名格式', trigger: 'change' },
				// ],
				}
				
		}
	},
	mounted() {
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
		showNoteForm(){
			this.visible = true
		},
		handleOk(){
			this.$refs.ruleForm.validate(valid => {
				if (valid) {
					let arr = []
					this.fileList.forEach(item => arr.push(item.response.data))
					this.form.image = arr.join(',')
					console.log(this.form)
					return
					this.axios.post('project', {
						params: this.form
					}).then(res => {
						console.log(res)
						if (res.status == 1) {
							// console.log(res.data)
							this.$message.success(res.info)
							this.$router.push('/project')
						} else {
							that.$message.error(res.info)
						}
					})
				} else {
					console.log('error submit!!');
					return false;
				}
			});
		},
		handleCancel(){
			this.visible = false
			this.$refs.ruleForm.resetFields();
		}
	}
}
</script>

<style scoped>
	.ant-note{
		width: 100%;
		/* height: 100px; */
		background-color: #FFFFFF;
		padding: 20px;
	}
	.ant-note-title{
		font-size: 20px;
		font-weight: 600;
		color: #000000;
	}
</style>
