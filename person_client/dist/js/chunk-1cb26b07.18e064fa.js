(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-1cb26b07"],{"6e60":function(e,t,r){"use strict";r.r(t);var a=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("div",{staticClass:"ant-add-project"},[r("div",{staticStyle:{width:"60%",margin:"0 20px",padding:"30px 20px"}},[r("a-form-model",{ref:"ruleForm",attrs:{model:e.form,rules:e.rules,"label-col":e.labelCol,"wrapper-col":e.wrapperCol,labelAlign:"left"}},[r("a-form-model-item",{ref:"name",attrs:{label:"名称",prop:"name"}},[r("a-input",{attrs:{placeholder:"网站、项目等资源名，最多 25 字"},on:{blur:function(){e.$refs.name.onFieldBlur()}},model:{value:e.form.name,callback:function(t){e.$set(e.form,"name",t)},expression:"form.name"}})],1),r("a-form-model-item",{ref:"detail",attrs:{label:"描述",prop:"detail"}},[r("a-input",{attrs:{placeholder:"用一句话简单介绍资源，最多 80 字"},on:{blur:function(){e.$refs.detail.onFieldBlur()}},model:{value:e.form.detail,callback:function(t){e.$set(e.form,"detail",t)},expression:"form.detail"}})],1),r("a-form-model-item",{ref:"url",attrs:{label:"链接",prop:"url"}},[r("a-input",{attrs:{placeholder:"便于找到资源的网址，http(s) 开头"},on:{blur:function(){e.$refs.url.onFieldBlur()}},model:{value:e.form.url,callback:function(t){e.$set(e.form,"url",t)},expression:"form.url"}})],1),r("a-form-model-item",{ref:"git_url",attrs:{label:"仓库链接",prop:"git_url"}},[r("a-input",{attrs:{placeholder:"便于找到资源的远程仓库地址"},on:{blur:function(){e.$refs.git_url.onFieldBlur()}},model:{value:e.form.git_url,callback:function(t){e.$set(e.form,"git_url",t)},expression:"form.git_url"}})],1),r("a-form-model-item",{attrs:{label:"分类",prop:"category"}},[r("a-radio-group",{attrs:{defaultValue:e.form.category},model:{value:e.form.category,callback:function(t){e.$set(e.form,"category",t)},expression:"form.category"}},[r("a-radio",{attrs:{value:1}},[e._v(" 个人 ")]),r("a-radio",{attrs:{value:2}},[e._v(" 团队 ")]),r("a-radio",{attrs:{value:3}},[e._v(" 其他 ")])],1)],1),r("a-form-model-item",{ref:"tag",attrs:{label:"标签",prop:"tag"}},[r("a-select",{staticStyle:{width:"100%"},attrs:{mode:"tags",allowClear:"",placeholder:"可选至多 5 个标签，支持搜索",maxTagCount:6},on:{change:e.handleSelectTag},model:{value:e.tags,callback:function(t){e.tags=t},expression:"tags"}},e._l(e.tagList,(function(t){return r("a-select-option",{key:t.toString()},[e._v(" "+e._s(t)+" ")])})),1)],1),r("a-form-model-item",{ref:"image",attrs:{label:"图片",prop:"image"}},[r("div",{staticClass:"clearfix"},[r("a-upload",{attrs:{action:e.url,name:"file","list-type":"picture-card","file-list":e.fileList,multiple:!0},on:{preview:e.handlePreview,change:e.handleChange}},[e.fileList.length<5?r("div",[r("a-icon",{attrs:{type:"plus"}}),r("div",{staticClass:"ant-upload-text"},[e._v(" Upload ")])],1):e._e()]),r("a-modal",{attrs:{visible:e.previewVisible,footer:null},on:{cancel:e.handleCancel}},[r("img",{staticStyle:{width:"100%"},attrs:{alt:"example",src:e.previewImage}})])],1)]),r("a-form-model-item",{attrs:{label:"详细"}},[r("a-input",{staticStyle:{height:"100px",resize:"none"},attrs:{placeholder:"详细介绍该资源的作用、用法等",type:"textarea"},model:{value:e.form.introduce,callback:function(t){e.$set(e.form,"introduce",t)},expression:"form.introduce"}})],1),r("a-form-model-item",{attrs:{"wrapper-col":e.wrapperCol1}},[r("a-button",{staticStyle:{width:"40%","min-width":"64px"},attrs:{type:"primary"},on:{click:e.onSubmit}},[e._v(" 提交 ")]),r("a-button",{staticStyle:{"margin-left":"30px"},on:{click:e.resetForm}},[e._v(" 取消 ")])],1)],1)],1)])},l=[],i=r("1da1"),o=(r("96cf"),r("d3b7"),r("159b"),r("a15b"),r("a434"),r("40a7"));function n(e){return new Promise((function(t,r){var a=new FileReader;a.readAsDataURL(e),a.onload=function(){return t(a.result)},a.onerror=function(e){return r(e)}}))}var s={data:function(){return{labelCol:{sm:{span:12},md:{span:8,offset:0},lg:{span:5,offset:0}},wrapperCol:{sm:{span:24},md:{span:16,offset:0},lg:{span:19,offset:0}},wrapperCol1:{sm:{span:24,offset:0},md:{span:16,offset:8},lg:{span:19,offset:5}},locale:o["a"],imageUrl:"",loading:"",tags:[],tagList:["PHP","Vue","Html","Css","MySQL","MongoDB","Redis","Nginx","Apache","小程序","H5","APP"],url:this.config.interfaceUrl+"/project/uploadProjectImg",previewVisible:!1,previewImage:"",fileList:[],form:{name:"",detail:"",introduce:"",image:"",url:"",git_url:"",tag:"",skill:"",category:""},rules:{name:[{required:!0,message:"请填写资源名称",trigger:"change"}],detail:[{required:!0,message:"请填写描述",trigger:"change"}],introduce:[{required:!0,message:"请填写详细介绍及说明",trigger:"change"}],tag:[{required:!0,message:"至少选择一个标签",trigger:"change"}],skill:[{required:!0,message:"请填写手机号",trigger:"change"}],category:[{required:!0,message:"请选择分类",trigger:"change"}]}}},mounted:function(){},methods:{onSubmit:function(){var e=this;this.$refs.ruleForm.validate((function(t){if(!t)return console.log("error submit!!"),!1;var r=[];e.fileList.forEach((function(e){return r.push(e.response.data)})),e.form.image=r.join(","),e.axios.post("project",{params:e.form}).then((function(t){console.log(t),1==t.status?(e.$message.success(t.info),e.$router.push("/project")):that.$message.error(t.info)}))}))},handleSelectTag:function(e){e.length>6?(this.$message.warning("最多只能选择6个标签"),this.tags.splice(this.tags.length-1,1)):e.length<1&&this.$message.warning("至少选择1个标签"),this.form.tag=this.tags.join(",")},handleCancel:function(){this.previewVisible=!1},handlePreview:function(e){var t=this;return Object(i["a"])(regeneratorRuntime.mark((function r(){return regeneratorRuntime.wrap((function(r){while(1)switch(r.prev=r.next){case 0:if(e.url||e.preview){r.next=4;break}return r.next=3,n(e.originFileObj);case 3:e.preview=r.sent;case 4:t.previewImage=e.url||e.preview,t.previewVisible=!0;case 6:case"end":return r.stop()}}),r)})))()},handleChange:function(e){var t=e.fileList;this.fileList=t},resetForm:function(){this.$refs.ruleForm.resetFields(),this.$router.go(-1)}}},u=s,c=(r("f75f"),r("2877")),m=Object(c["a"])(u,a,l,!1,null,"6ddb0964",null);t["default"]=m.exports},d173:function(e,t,r){},f75f:function(e,t,r){"use strict";r("d173")}}]);
//# sourceMappingURL=chunk-1cb26b07.18e064fa.js.map