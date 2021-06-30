<template>
  <a-form-model
    ref="ruleForm"
    :model="form"
    :rules="rules"
    :label-col="labelCol"
    :wrapper-col="wrapperCol"
	labelAlign="left"
  >
    <a-form-model-item ref="profession" label="职位名称" prop="profession">
      <a-input v-model="form.profession" @blur="  () => { $refs.profession.onFieldBlur();} " />
    </a-form-model-item>
	<a-form-model-item ref="city" label="期望城市" prop="city">
	  <a-input v-model="form.city" @blur="  () => { $refs.city.onFieldBlur();} " />
	</a-form-model-item>
	<a-form-model-item ref="pay" label="期望薪资" prop="pay">
	  <a-input type="number" v-model="form.pay" @blur="  () => { $refs.pay.onFieldBlur();} " />
	</a-form-model-item>
	<a-form-model-item ref="experience" label="工龄" prop="experience">
	  <a-input type="number" v-model="form.experience" @blur="  () => { $refs.experience.onFieldBlur();} " />
	</a-form-model-item>
	
	<a-form-model-item label="工作状态" prop="status">
	  <a-radio-group v-model="form.status" :defaultValue="form.status" >
	    <a-radio :value="0" >
	      未入职
	    </a-radio>
	    <a-radio :value="1">
	      在职
	    </a-radio>
		<a-radio :value="2">
		  离职
		</a-radio>
		<a-radio :value="3">
		  即将入职
		</a-radio>
	  </a-radio-group>
	</a-form-model-item>
	
    <a-form-model-item :wrapper-col="wrapperCol1">
      <a-button type="primary"  style="width:30%;min-width: 64px;" @click="onSubmit">
        提交
      </a-button>
      <a-button style="margin-left: 30px;" @click="resetForm">
        取消
      </a-button>
    </a-form-model-item>
  </a-form-model>
</template>
<script>
import locale from 'ant-design-vue/es/date-picker/locale/zh_CN'
	
export default {
  data() {
    return {
      labelCol: {
      		  sm :{
      			  span:12,
      		  },
      		  md :{
      			  span:8,
      			  offset:0
      		  },
      		  lg :{
      			  span:5,
      			  offset:0
      		  },
      },
       wrapperCol: { 
      		  sm :{
      			  span:24,
      		  },
      		  md :{
      			  span:16,
      			  offset:0
      		  },
      		  lg :{
      			  span:19,
      			  offset:0
      		  },
       },
       wrapperCol1: {
      		  sm :{
      			  span:24,
      			  offset:0
      		  },
      		  md :{
      			  span:16,
      			  offset:8
      		  },
      		  lg :{
      			  span:19,
      			  offset:5
      		  },
       },
	  locale:locale,
	  
	  
      form: {
        city: "广州、深圳",
        experience: 2,
        id: 1,
        pay: 9000,
        profession: "前端开发工程师",
        status: 2,
      },
      rules: {
        profession: [
          { required: true, message: '请填写职位名称', trigger: 'blur' },
        ],
        city: [{ required: true, message: '请选择城市', trigger: 'change' }],
		pay: [{ required: true, message: '请填写期望薪资', trigger: 'change' }],
		experience: [{ required: true, message: '请填写工作年龄', trigger: 'change' }],
		status: [
		  { required: true, message: '请选择当前工作状态', trigger: 'change' },
		],
      },
    };
  },
  mounted() {
  	this.getPersonInfo()
  },
  methods: {
    onSubmit() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
			this.axios.put(`person/personInfo/${this.form.id}`,
			    {
					params:	this.form
				}
			).then(res=>{
				// console.log(res)
				if (res.status == 1) {
					// console.log(res.data)
					this.$message.success(res.info)
					this.$router.push('/person/other')
					
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
	// 获取个人信息
	getPersonInfo() {
		let that = this
		this.axios.get('/person/PersonInfo/')
			.then(res => {
				// console.log(res)
				if (res.status == 1) {
					// console.log(res.data)
					that.form = res.data
				} else {
					that.$message.error(res.info)
				}
			})
	},
    resetForm() {
      this.$refs.ruleForm.resetFields();
	  this.$router.go(-1)
    },
  },
};
</script>

<style scoped>
</style>
