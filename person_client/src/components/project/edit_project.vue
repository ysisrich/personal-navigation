<template>
	<div class="ant-add-project">
		<div style="width: 60%;margin: 0 20px; padding:30px 20px;">
			<a-form-model ref="ruleForm" :model="form" :rules="rules" :label-col="labelCol" :wrapper-col="wrapperCol"
				labelAlign="left">
				<a-form-model-item ref="name" label="名称" prop="name">
					<a-input v-model="form.name" placeholder="网站、项目等资源名，最多 25 字"
						@blur="  () => { $refs.name.onFieldBlur();} " />
				</a-form-model-item>
				<a-form-model-item ref="detail" label="描述" prop="detail">
					<a-input v-model="form.detail" placeholder="用一句话简单介绍资源，最多 80 字"
						@blur="  () => { $refs.detail.onFieldBlur();} " />
				</a-form-model-item>
				<a-form-model-item ref="url" label="链接" prop="url">
					<a-input v-model="form.url" placeholder="便于找到资源的网址，http(s) 开头"
						@blur="  () => { $refs.url.onFieldBlur();} " />
				</a-form-model-item>
				<a-form-model-item ref="git_url" label="仓库链接" prop="git_url">
					<a-input v-model="form.git_url" placeholder="便于找到资源的远程仓库地址"
						@blur="  () => { $refs.git_url.onFieldBlur();} " />
				</a-form-model-item>
				<a-form-model-item label="分类" prop="category">
					<a-radio-group v-model="form.category" :defaultValue="form.category">
						<a-radio :value="1">
							个人
						</a-radio>
						<a-radio :value="2">
							团队
						</a-radio>
						<a-radio :value="3">
							其他
						</a-radio>
					</a-radio-group>
				</a-form-model-item>
				<a-form-model-item ref="tag" label="标签" prop="tag">
					<a-select mode="tags" v-model="tags" style="width: 100%" allowClear placeholder="可选至多 5 个标签，支持搜索"
						@change="handleSelectTag" :defaultValue="defaultTags">
						<a-select-option v-for="i in tagList" :key="i.toString()">
							{{ i }}
						</a-select-option>
					</a-select>

				</a-form-model-item>
				<a-form-model-item ref="image" label="图片" prop="image">
					<div class="clearfix">
						<a-upload :action="url" name="file" list-type="picture-card" :file-list="fileList"
							:multiple="true" @preview="handlePreview" @change="handleChange">
							<div v-if="fileList.length < 5">
								<a-icon type="plus" />
								<div class="ant-upload-text">
									Upload
								</div>
							</div>
						</a-upload>
						<a-modal :visible="previewVisible" :footer="null" @cancel="handleCancel">
							<img alt="example" style="width: 100%" :src="previewImage" />
						</a-modal>
					</div>
				</a-form-model-item>
				<a-form-model-item label="详细">
					<a-input v-model="form.introduce" placeholder="详细介绍该资源的作用、用法等" type="textarea"
						style="height: 100px; resize: none;" />
				</a-form-model-item>

				<a-form-model-item :wrapper-col="wrapperCol1">
					<a-button type="primary" style="width:30%;min-width: 64px;" @click="onSubmit">
						提交
					</a-button>
					<a-button style="margin-left: 30px;" @click="resetForm">
						取消
					</a-button>
				</a-form-model-item>
			</a-form-model>
		</div>
	</div>
</template>
<script>
	import locale from 'ant-design-vue/es/date-picker/locale/zh_CN'

	function getBase64(file) {
		return new Promise((resolve, reject) => {
			const reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = () => resolve(reader.result);
			reader.onerror = error => reject(error);
		});
	}

	export default {
		data() {
			let reg = /[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+\.?/
			let url_validate = (rule, value, callback) => {
				if (value === '') {
					callback(new Error('Please input the password'));
				} else {
					if (!reg.test(value)) {
						callback(new Error('Please input the password11'));
					}
				}
			}
			return {
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
				locale: locale,
				imageUrl: '',
				loading: '',
				defaultTags:[],
				tags:[],
				tagList: ['PHP', 'Vue', 'Html', 'Css', 'MySQL', 'MongoDB', 'Redis', 'Nginx', 'Apache', '小程序', 'H5', 'APP'],
				url: this.config.interfaceUrl + '/project/uploadProjectImg',
				id:this.$route.query.id,
				previewVisible: false,
				previewImage: '',
				fileList: [

				],

				form: {
					name: '',
					detail: '',
					introduce: '',
					image: '',
					url: '',
					git_url: '',
					tag: '',
					skill: '',
					category: ''
				},

				rules: {
					name: [{
						required: true,
						message: '请填写资源名称',
						trigger: 'change'
					}, ],
					detail: [{
						required: true,
						message: '请填写描述',
						trigger: 'change'
					}],
					introduce: [{
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
					// git_url: [{
					// 		required: true,
					// 		message: '请填写远程仓库链接',
					// 		trigger: 'change'
					// 	},
					// 	// { validator: url_validate, message: '请填写正确域名格式', trigger: 'change' },
					// ],
					// tag: [
					//   { required: true, message: '请填写标签', trigger: 'change' },
					// ],
					skill: [{
						required: true,
						message: '请填写手机号',
						trigger: 'change'
					}, ],
					category: [{
						required: true,
						message: '请选择分类',
						trigger: 'change'
					}, ],
				},
			};
		},
		mounted() {
			this.getProjectOne(this.$route.query.id)
		},
		methods: {
			// 根据id获取项目信息
			getProjectOne(id){
				this.axios.get(`project/${id}`).then(res => {
					// console.log(res)
					if (res.status == 1) {
						this.form = res.data
						let arr = res.data.tag.split(',')
						let imgs = res.data.image.split(',')
						
						arr.forEach(item => this.tags.push(item))
						imgs.forEach((item,index)=> {
							let obj ={
								uid: index,
								name: 'image.png',
								response:{
									data: item
								},
								status:'done',
								url: this.config.mediaUrl + item
							}
							this.fileList.push(obj)
						})
						// this.$message.success(res.info)
						// this.$router.push('/project')
					} else {
						this.$message.error(res.info)
					}
				})
			},
			// 提交表单
			onSubmit() {
				this.$refs.ruleForm.validate(valid => {
					if (valid) {
						let arr = []
						this.fileList.forEach(item => arr.push(item.response.data))
						this.form.image = arr.join(',')
						// console.log(this.form)
						// return
						this.axios.put(`project/${this.id}`, {
							params: this.form
						}).then(res => {
							// console.log(res)
							if (res.status == 1) {
								// console.log(res.data)
								this.$message.success(res.info)
								this.$router.push('/project')
							} else {
								this.$message.error(res.info)
							}
						})
					} else {
						console.log('error submit!!');
						return false;
					}
				});
			},
			// 标签选择
			handleSelectTag(val) {
				if(val.length >6){
					this.$message.warning('最多只能选择6个标签')
					this.tags.splice(this.tags.length - 1,1)
				}else if(val.length < 1){
					this.$message.warning('至少选择1个标签')
				}
				this.form.tag = this.tags.join(',')
			},
			handleCancel() {
				this.previewVisible = false;
			},
			async handlePreview(file) {
				if (!file.url && !file.preview) {
					file.preview = await getBase64(file.originFileObj);
				}
				this.previewImage = file.url || file.preview;
				this.previewVisible = true;
			},
			handleChange({ fileList }) {
				this.fileList = fileList;
			},
			resetForm() {
				this.$refs.ruleForm.resetFields();
				this.$router.go(-1)
			},
		},
	};
</script>

<style scoped>
	.ant-add-project {
		width: 100%;
		background-color: #fff;

	}
</style>
