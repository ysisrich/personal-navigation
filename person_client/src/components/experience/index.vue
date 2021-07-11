<template>
	<div>
		<div class="ant-note">
			<div class="ant-note-title">💖 笔记本</div>
			<div style="margin: 10px auto; color: rgba(0,0,0,.78);">随时记笔记，养成良好习惯，将所遇到的问题进行记录，方便复习整理，有利于知识的巩固!!!</div>
			<a-button type="primary" icon="plus"  @click="showNoteForm">
			      写笔记
			</a-button>
		</div>
		
		
		<!-- 暂无数据 -->
		<a-table v-if="noteList.length == 0 && searchData" :data-source="[]" style="margin: 0 10px;"/>		
		
		<!-- 加载中 -->
		<div class="loading" v-show="!showData">
			<a-spin size="large" :spinning="!showData"/>
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
			  		<a-input v-model="form.answer" placeholder="用简洁的语言解答问题或者解决方法" type="textarea"
			  			style="height: 100px; resize: none;"
			  			@blur="  () => { $refs.answer.onFieldBlur();} " />
			  	</a-form-model-item>
			  	<a-form-model-item ref="url" label="相关链接" prop="url">
			  		<a-input v-model="form.url" placeholder="网上解决的方法或者知识点相关官网"
			  			@blur="  () => { $refs.url.onFieldBlur();} " />
			  	</a-form-model-item>
			  	<a-form-model-item ref="other"  prop="other"label="其他">
			  		<a-input v-model="form.other" placeholder="其他相关知识" type="textarea"
			  			style="height: 50px; resize: none;" />
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
		
		<!-- 问题笔记列表 -->
		<a-row v-show="showData">
			<a-col v-for="(item,index) in noteList" :xs="24" :sm="24" :md="24" :lg="12" :xl="8">
				<Card :noteItem="item" @deleteNote="deleteNote(item.id)" @editNote="editNote(item)"></Card>
			</a-col>
		</a-row>
		
		<!-- 分页 -->
		<div style="text-align: right;margin-right: 10px; padding-bottom: 10px;" v-show="showData && noteList.length > 0">
			<a-pagination :default-current="1" :defaultPageSize="9" :total="total" @change="pagesChange"/>
		</div>
		
	</div>
</template>

<script>
import Card from './card.vue'
export default {
	data(){
		return {
			visible:false,
			confirmLoading:false,
			width:'40%',
			value:'',
			showData:false,
			searchData:false,
			
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
			// 笔记信息
			form: {
				name:'',
				answer:'',
				url:'',
				other:''
			},
			total:0,
			// 获取列表条件
			query:{
				search:'',
				page_size:9,
				page_current:1
			},
			// 笔记数据列表
			noteList:[],
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
		Card
	},
	mounted() {
		// 获取笔记列表
		this.getNoteList()
		
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
			this.editId = 0
			this.visible = true
			this.form = {}
		},
		// 获取笔记列表
		getNoteList() {
			let that = this
			this.axios.get('/notes',{
					params:this.query,
				}).then(res => {
					console.log(res)
					if (res.status == 1) {
						this.noteList = res.data.data
						this.total = res.data.total
						this.showData = true
					} else {
						this.$message.error(res.info)
					}
				})
				.catch(err => {
					console.log(err)
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
						this.visible = false
						this.getNoteList()
					} else {
						this.$message.error(res.info)
					}
				})
			}else{
				this.$refs.ruleForm.validate(valid => {
					if (valid) {
						console.log(this.form)
						// return
						this.axios.post('note', {
							params: this.form
						}).then(res => {
							console.log(res)
							if (res.status == 1) {
								// console.log(res.data)
								this.$message.success(res.info)
								this.visible = false
								this.getNoteList()
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
		// 根据id删除笔记
		deleteNote(id){
			this.axios.delete(`note/${id}`)
			 .then(res => {
				console.log(res)
				if (res.status == 1) {
					// console.log(res.data)
					this.$message.success(res.info)
					this.getNoteList()
				} else {
					this.$message.error(res.info)
				}
			})
		},
		// 编辑笔记信息
		editNote(item){
			this.visible = true
			this.editId = item.id
			this.form = item
		},
		// 分页
		pagesChange(page,pagesize){
			// console.log(page,pagesize)
			this.query.page_current = page
			this.getNoteList()
		},
		handleCancel(){
			this.visible = false
			// this.$refs.ruleForm.resetFields();
		}
	}
}
</script>

<style scoped>
	.ant-note{
		/* width: 100%; */
		background-color: #FFFFFF;
		padding: 20px;
		margin: 0 0 20px 10px;
	}
	.ant-note-title{
		font-size: 20px;
		font-weight: 600;
		color: #000000;
	}
	.loading {
	  text-align: center;
	  background: rgba(0, 0, 0, 0.05);
	  border-radius: 4px;
	  margin-bottom: 20px;
	  padding: 30px 50px;
	  margin: 20px 0;
	}
</style>
