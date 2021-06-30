<template>
  <a-form-model
    ref="ruleForm"
    :model="form"
    :rules="rules"
    :label-col="labelCol"
    :wrapper-col="wrapperCol"
	labelAlign="left"
  >
    <a-form-model-item ref="name" label="姓名" prop="name">
      <a-input v-model="form.name" @blur="  () => { $refs.name.onFieldBlur();} " />
    </a-form-model-item>
	<a-form-model-item label="性别" prop="sex">
	  <a-radio-group v-model="form.sex" :defaultValue="form.sex" >
	    <a-radio :value="1" >
	      男
	    </a-radio>
	    <a-radio :value="0">
	      女
	    </a-radio>
	  </a-radio-group>
	</a-form-model-item>
	
    <a-form-model-item label="生日" required prop="birthday">
      <a-date-picker
        v-model="form.birthday"
        type="date"
		:locale="locale"
        placeholder="选择日期"
        style="width: 100%;"
      />
    </a-form-model-item>
	<a-form-model-item ref="phone" label="手机" prop="phone">
	  <a-input v-model="form.phone" @blur="  () => { $refs.phone.onFieldBlur();} " />
	</a-form-model-item>
	<a-form-model-item ref="email" label="电子邮件" prop="email">
	  <a-input v-model="form.email" @blur="  () => { $refs.email.onFieldBlur();} " />
	</a-form-model-item>
	<a-form-model-item ref="hometown" label="家乡" prop="hometown">
	  <a-input v-model="form.hometown" @blur="  () => { $refs.hometown.onFieldBlur();} " />
	</a-form-model-item>
	<a-form-model-item ref="college" label="学校" prop="college">
	  <a-input v-model="form.college" @blur="  () => { $refs.college.onFieldBlur();} " />
	</a-form-model-item>
	<a-form-model-item label="学校类型" prop="college_type">
	  <a-radio-group v-model="form.college_type" :defaultValue="form.college_type" >
	    <a-radio :value="0" >
	      专科
	    </a-radio>
	    <a-radio :value="1">
	      本科
	    </a-radio>
		<a-radio :value="2">
		  其他
		</a-radio>
	  </a-radio-group>
	</a-form-model-item>
    <a-form-model-item ref="major" label="专业" prop="major">
      <a-input v-model="form.major" @blur="  () => { $refs.major.onFieldBlur();} " />
    </a-form-model-item>
	
	<a-form-model-item label="毕业日期" required prop="graduation_data">
	  <a-month-picker
	    v-model="form.graduation_data"
	    type="date"
		:locale="locale"
	    placeholder="选择毕业日期"
	    style="width: 100%;"
	  />
	</a-form-model-item>
	
	<a-form-model-item label="当前身份" required  prop="identity">
	  <a-radio-group v-model="form.identity" :defaultValue="form.identity" >
	    <a-radio :value="0" >
	      在校学生
	    </a-radio>
	    <a-radio :value="1">
	      打工人
	    </a-radio>
	  </a-radio-group>
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
        name: '',
        sex: '',
		age: '',
		birthday:'',
		college: "",
		college_type: 1,
		email: '',
		experience: 2,
		graduation_year: '',
		graduation_data:'',
		hometown: "",
		id: 1,
		idcard: "",
		identity: 1,
		major: "",
		phone: "",
      },
      rules: {
        name: [
          { required: true, message: '请填写姓名', trigger: 'blur' },
        ],
        birthday: [{ required: true, message: '请选择出生日期', trigger: 'change' }],
		graduation_data: [{ required: true, message: '请选择毕业日期', trigger: 'change' }],
        sex: [
          { required: true, message: '请选择性别', trigger: 'change' },
        ],
		college: [
		  { required: true, message: '请填写学校名称', trigger: 'change' },
		],
		email: [
		  { required: true, message: '请填写电子邮件', trigger: 'change' },
		],
		phone: [
		  { required: true, message: '请填写手机号', trigger: 'change' },
		],
		major: [
		  { required: true, message: '请填写专业名称', trigger: 'change' },
		],
		college_type: [
		  { required: true, message: '请选择学校类型', trigger: 'change' },
		],
		hometown: [
		  { required: true, message: '请填写家乡地址', trigger: 'change' },
		],
      },
    };
  },
  mounted() {
  	this.getPersonInfo()
  },
  methods: {
	  // 转换时间
	  dataFormat(data){
		  let birthdays = data;
		  let d = new Date();
		  let age = d.getFullYear() - birthdays.getFullYear() - (d.getMonth() < birthdays.getMonth() || (d.getMonth() == birthdays.getMonth() && d.getDate() < birthdays.getDate()) ? 1 : 0);
		  return age
	  },
    onSubmit() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
			this.form.age = this.dataFormat(this.form.birthday._d)
			this.form.graduation_year = this.form.graduation_data._d.getFullYear()
            
			this.axios.put(`person/personInfo/${this.form.id}`,
			    {
					params:	this.form
				}
			).then(res=>{
				console.log(res)
				if (res.status == 1) {
					// console.log(res.data)
					this.$message.success(res.info)
					this.$router.push('/person')
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
