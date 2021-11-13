<template>
	<div class="ant-add-note">
		<div :style="{width: width,margin: '0 20px',padding:'30px 20px'}">
		<a-form-model ref="ruleForm" :model="form" :rules="rules" :label-col="labelCol" :wrapper-col="wrapperCol"
			labelAlign="left">
			<a-form-model-item ref="name" label="名称" prop="name">
				<a-input v-model="form.name" placeholder="遇到的问题名称或者讨厌的bug" @blur="  () => { $refs.name.onFieldBlur();} " />
			</a-form-model-item>
			<a-form-model-item ref="answer" label="内容" prop="answer">
				<!-- <a-input v-model="form.answer" placeholder="用详细的语言解答问题或者解决方法" type="textarea"
					style="height: 50px; resize: none;" @click="editText()"
					@blur="  () => { $refs.answer.onFieldBlur();} " /> -->
					<Editor @change="getValue"></Editor>
			</a-form-model-item>
			<a-form-model-item ref="url" label="相关链接" prop="url">
				<a-input v-model="form.url" placeholder="网上解决的方法或者知识点相关官网" @blur="  () => { $refs.url.onFieldBlur();} " />
			</a-form-model-item>
			<a-form-model-item ref="code_file" label="代码文件" prop="code_file">
				<!-- <a-input v-model="form.code_file" placeholder="相关编写的代码文件,可以为空"
								@blur="  () => { $refs.code_file.onFieldBlur();} " /> -->
				<a-upload :action="url" :multiple="false" :file-list="fileList" @change="handleChange">
					<a-button>
						<a-icon type="upload" /> 上传文件
					</a-button>
				</a-upload>
			</a-form-model-item>
			<a-form-model-item ref="other" prop="other" label="其他">
				<!-- <a-input v-model="form.other" placeholder="其他相关知识" type="textarea"
					style="height: 50px; resize: none;" /> -->
				<a-select mode="tags" v-model="tags" style="width: 100%" allowClear placeholder="可选至多 3 个标签，支持搜索"
					:maxTagCount="6" @change="handleSelectTag" :defaultValue="defaultTags">
					<a-select-option v-for="i in tagList" :key="i.toString()">
						{{ i }}
					</a-select-option>
				</a-select>
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
	</div>
	</div>
</template>

<script>
const Editor = ()=> import('./vidtor.vue')
// import Editor from './juejinEditor.vue'

export default {
	data(){
		return {
			width:'60%',
			value:'',
			
			fileList:[], // 代码文件
			defaultTags:[],
			tags:[],
			tagList: ['PHP', 'Vue', 'Html', 'Css', 'MySQL', 'MongoDB', 'Redis', 'Nginx', 'Apache', '小程序', 'H5', 'APP'],
			
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
			
			editId:'',
			url: this.config.interfaceUrl + '/note/uploadNoteFile',
			// 笔记信息
			form: {
				name:'',
				answer:'',
				url:'',
				code_file:'',
				image:'',
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
				// other: [{
				// 	required: true,
				// 	message: '请填写详细介绍及说明',
				// 	trigger: 'change'
				// }],
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
	components:{
		Editor
	},
	mounted() {
		this.editId = Number(this.$route.query.id)
		this.editId && this.getNoteOne()
		
		document.documentElement.clientWidth < 768 ? this.width = '90%' : this.width = '60%'
		window.addEventListener('resize',()=>{
			let width = document.documentElement.clientWidth
			width < 768 ? this.width = '90%' : this.width = '60%'
		})
	},
	methods:{
		// 获取富文本内容
		getValue(val){
			this.form.answer = val
		},
		// 获取note信息
		getNoteOne(){
			this.axios.get(`note/${this.editId}`)
			  .then(res => {
				console.log(res)
				if (res.status == 1) {
					// console.log(res.data)
					this.form  = res.data
					console.log(this.form)
					this.$message.success(res.info)
				} else {
					this.$message.error(res.info)
				}
			})
		},
		// 创建笔记 或 编辑
		handleOk(){
			if(this.editId){
				this.axios.put(`note/${this.editId}`, {
					params: this.form
				}).then(res => {
					console.log(res)
					if (res.status == 1) {
						// console.log(res.data)
						this.$message.success(res.info)
					} else {
						this.$message.error(res.info)
					}
				})
			}else{
				this.$refs.ruleForm.validate(valid => {
					if (valid) {
						let arr = []
						this.fileList.forEach(item => arr.push(item.response.data))
						this.form.code_file = arr.join(',')
						console.log(this.form)
						// return
						this.axios.post('note', {
							params: this.form
						}).then(res => {
							console.log(res)
							if (res.status == 1) {
								// console.log(res.data)
								this.$message.success(res.info)
								this.$router.push('/experience')
							} else {
								this.$message.error(res.info)
							}
						})
					} else {
						console.log('error submit!!');
						return false;
					}
				});
			}
		},
		
		// 文件上传事件
		handleChange(info) {
		      let fileList = [...info.fileList];
		
		      // 1. Limit the number of uploaded files
		      //    Only to show two recent uploaded files, and old ones will be replaced by the new
		      fileList = fileList.slice(-2);
		
		      // 2. read from response and show file link
		      fileList = fileList.map(file => {
		        if (file.response) {
		          // Component will show file.url as link
		          file.url = file.response.url;
		        }
		        return file;
		      });
		
		      this.fileList = fileList;
		    },
		// 标签选择
		handleSelectTag(val) {
			// console.log(val)
			if(val.length >3){
				this.$message.warning('最多只能选择3个标签')
				this.tags.splice(this.tags.length - 1,1)
			}else if(val.length < 1){
				this.$message.warning('至少选择1个标签')
			}
			this.form.other = this.tags.join(',')
		},
		// 分页
		pagesChange(page,pagesize){
			// console.log(page,pagesize)
			this.query.page_current = page
			this.getNoteList()
		},
		// 取消
		handleCancel(){
			this.$router.go(-1)
		}
	}
}
</script>

<style scoped lang="scss">
	.ant-add-note {
		width: 100%;
		background-color: #fff
	}

	/deep/ .vditor-toolbar{
		padding-left: 0 !important;
	}
 
</style>
