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
		
		
		<!-- 添加 修改note  -->
		<!-- <a-modal
		      title="写笔记"
		      :visible="visible"
			  :closable="false"
		      :confirm-loading="confirmLoading"
			  :width="width"
			  :footer="null"
		    >
			  
		</a-modal> -->
		
		<!-- 富文本 -->
		<a-modal
		      title="写解答"
		      :visible="visible1"
			  :closable="false"
			  :width="width1"
			  :footer="null"
		    >
			<Editor @save="save" :name="form.name" :answer="form.answer"></Editor>
		</a-modal>
		
	</div>
</template>

<script>
const Editor = ()=> import('./vidtor.vue')
import Card from './card.vue'
// import Editor from './juejinEditor.vue'

export default {
	data(){
		return {
			visible:false,
			visible1:false,
			confirmLoading:false,
			width:'40%',
			width1:'80%',
			value:'',
			showData:false,
			searchData:false,
			
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
		Card,Editor
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
		// 显示创建
		showNoteForm(){
			// this.editId = 0
			// this.visible = true
			// this.form = {}
			this.$router.push('/publish_note?id=0')
		},
		// 获取笔记列表
		getNoteList() {
			let that = this
			this.axios.get('/notes',{
					params:this.query,
				}).then(res => {
					// console.log(res)
					if (res.status == 1) {
						this.noteList = res.data.data
						
						this.noteList.forEach(item => {
							item.other = item.other.split(',')
						})
						
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
			this.form.other.forEach(item => this.tags.push(item)) 
		},
		// 转去富文本
		editText(){
			if(!this.form.name){
				this.$message.warn('请先填写问题题目或者bug')
				return 
			}
			this.visible1 = true
		},
		// 回来
		save(val){
			this.visible1 = false
			this.form.answer = val
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
