(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-f32a20f4"],{1276:function(e,t,r){"use strict";var a=r("2ba4"),n=r("c65b"),i=r("e330"),o=r("d784"),l=r("44e7"),s=r("825a"),u=r("1d80"),c=r("4840"),f=r("8aa5"),d=r("50c4"),p=r("577e"),m=r("dc4a"),g=r("f36a"),h=r("14c3"),v=r("9263"),b=r("9f7fd"),x=r("d039"),w=b.UNSUPPORTED_Y,y=4294967295,$=Math.min,_=[].push,k=i(/./.exec),C=i(_),E=i("".slice),j=!x((function(){var e=/(?:)/,t=e.exec;e.exec=function(){return t.apply(this,arguments)};var r="ab".split(e);return 2!==r.length||"a"!==r[0]||"b"!==r[1]}));o("split",(function(e,t,r){var i;return i="c"=="abbc".split(/(b)*/)[1]||4!="test".split(/(?:)/,-1).length||2!="ab".split(/(?:ab)*/).length||4!=".".split(/(.?)(.?)/).length||".".split(/()()/).length>1||"".split(/.?/).length?function(e,r){var i=p(u(this)),o=void 0===r?y:r>>>0;if(0===o)return[];if(void 0===e)return[i];if(!l(e))return n(t,i,e,o);var s,c,f,d=[],m=(e.ignoreCase?"i":"")+(e.multiline?"m":"")+(e.unicode?"u":"")+(e.sticky?"y":""),h=0,b=new RegExp(e.source,m+"g");while(s=n(v,b,i)){if(c=b.lastIndex,c>h&&(C(d,E(i,h,s.index)),s.length>1&&s.index<i.length&&a(_,d,g(s,1)),f=s[0].length,h=c,d.length>=o))break;b.lastIndex===s.index&&b.lastIndex++}return h===i.length?!f&&k(b,"")||C(d,""):C(d,E(i,h)),d.length>o?g(d,0,o):d}:"0".split(void 0,0).length?function(e,r){return void 0===e&&0===r?[]:n(t,this,e,r)}:t,[function(t,r){var a=u(this),o=void 0==t?void 0:m(t,e);return o?n(o,t,a,r):n(i,p(a),t,r)},function(e,a){var n=s(this),o=p(e),l=r(i,n,o,a,i!==t);if(l.done)return l.value;var u=c(n,RegExp),m=n.unicode,g=(n.ignoreCase?"i":"")+(n.multiline?"m":"")+(n.unicode?"u":"")+(w?"g":"y"),v=new u(w?"^(?:"+n.source+")":n,g),b=void 0===a?y:a>>>0;if(0===b)return[];if(0===o.length)return null===h(v,o)?[o]:[];var x=0,_=0,k=[];while(_<o.length){v.lastIndex=w?0:_;var j,S=h(v,w?E(o,_):o);if(null===S||(j=$(d(v.lastIndex+(w?_:0)),o.length))===x)_=f(o,_,m);else{if(C(k,E(o,x,_)),k.length===b)return k;for(var F=1;F<=S.length-1;F++)if(C(k,S[F]),k.length===b)return k;_=x=j}}return C(k,E(o,x)),k}]}),!j,w)},"14c3":function(e,t,r){var a=r("da84"),n=r("c65b"),i=r("825a"),o=r("1626"),l=r("c6b6"),s=r("9263"),u=a.TypeError;e.exports=function(e,t){var r=e.exec;if(o(r)){var a=n(r,e,t);return null!==a&&i(a),a}if("RegExp"===l(e))return n(s,e,t);throw u("RegExp#exec called on incompatible receiver")}},"44e7":function(e,t,r){var a=r("861d"),n=r("c6b6"),i=r("b622"),o=i("match");e.exports=function(e){var t;return a(e)&&(void 0!==(t=e[o])?!!t:"RegExp"==n(e))}},6547:function(e,t,r){var a=r("e330"),n=r("5926"),i=r("577e"),o=r("1d80"),l=a("".charAt),s=a("".charCodeAt),u=a("".slice),c=function(e){return function(t,r){var a,c,f=i(o(t)),d=n(r),p=f.length;return d<0||d>=p?e?"":void 0:(a=s(f,d),a<55296||a>56319||d+1===p||(c=s(f,d+1))<56320||c>57343?e?l(f,d):a:e?u(f,d,d+2):c-56320+(a-55296<<10)+65536)}};e.exports={codeAt:c(!1),charAt:c(!0)}},"6cf7":function(e,t,r){},"8aa5":function(e,t,r){"use strict";var a=r("6547").charAt;e.exports=function(e,t,r){return t+(r?a(e,t).length:1)}},d1eb:function(e,t,r){"use strict";r.r(t);var a=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("div",{staticClass:"ant-add-project"},[r("div",{style:{width:e.width,margin:"0 20px",padding:"30px 20px"}},[r("a-form-model",{ref:"ruleForm",attrs:{model:e.form,rules:e.rules,"label-col":e.labelCol,"wrapper-col":e.wrapperCol,labelAlign:"left"}},[r("a-form-model-item",{ref:"name",attrs:{label:"名称",prop:"name"}},[r("a-input",{attrs:{placeholder:"网站、项目等资源名，最多 25 字"},on:{blur:function(){e.$refs.name.onFieldBlur()}},model:{value:e.form.name,callback:function(t){e.$set(e.form,"name",t)},expression:"form.name"}})],1),r("a-form-model-item",{ref:"detail",attrs:{label:"描述",prop:"detail"}},[r("a-input",{attrs:{placeholder:"用一句话简单介绍资源，最多 80 字"},on:{blur:function(){e.$refs.detail.onFieldBlur()}},model:{value:e.form.detail,callback:function(t){e.$set(e.form,"detail",t)},expression:"form.detail"}})],1),r("a-form-model-item",{ref:"url",attrs:{label:"链接",prop:"url"}},[r("a-input",{attrs:{placeholder:"便于找到资源的网址，http(s) 开头"},on:{blur:function(){e.$refs.url.onFieldBlur()}},model:{value:e.form.url,callback:function(t){e.$set(e.form,"url",t)},expression:"form.url"}})],1),r("a-form-model-item",{ref:"git_url",attrs:{label:"仓库链接",prop:"git_url"}},[r("a-input",{attrs:{placeholder:"便于找到资源的远程仓库地址"},on:{blur:function(){e.$refs.git_url.onFieldBlur()}},model:{value:e.form.git_url,callback:function(t){e.$set(e.form,"git_url",t)},expression:"form.git_url"}})],1),r("a-form-model-item",{attrs:{label:"分类",prop:"category"}},[r("a-radio-group",{attrs:{defaultValue:e.form.category},model:{value:e.form.category,callback:function(t){e.$set(e.form,"category",t)},expression:"form.category"}},[r("a-radio",{attrs:{value:1}},[e._v(" 个人 ")]),r("a-radio",{attrs:{value:2}},[e._v(" 团队 ")]),r("a-radio",{attrs:{value:3}},[e._v(" 其他 ")])],1)],1),r("a-form-model-item",{ref:"tag",attrs:{label:"标签",prop:"tag"}},[r("a-select",{staticStyle:{width:"100%"},attrs:{mode:"tags",allowClear:"",placeholder:"可选至多 5 个标签，支持搜索",defaultValue:e.defaultTags},on:{change:e.handleSelectTag},model:{value:e.tags,callback:function(t){e.tags=t},expression:"tags"}},e._l(e.tagList,(function(t){return r("a-select-option",{key:t.toString()},[e._v(" "+e._s(t)+" ")])})),1)],1),r("a-form-model-item",{ref:"image",attrs:{label:"图片",prop:"image"}},[r("div",{staticClass:"clearfix"},[r("a-upload",{attrs:{action:e.url,name:"file","list-type":"picture-card","file-list":e.fileList,multiple:!0},on:{preview:e.handlePreview,change:e.handleChange}},[e.fileList.length<5?r("div",[r("a-icon",{attrs:{type:"plus"}}),r("div",{staticClass:"ant-upload-text"},[e._v(" Upload ")])],1):e._e()]),r("a-modal",{attrs:{visible:e.previewVisible,footer:null},on:{cancel:e.handleCancel}},[r("img",{staticStyle:{width:"100%"},attrs:{alt:"example",src:e.previewImage}})])],1)]),r("a-form-model-item",{attrs:{label:"详细"}},[r("a-input",{staticStyle:{height:"100px",resize:"none"},attrs:{placeholder:"详细介绍该资源的作用、用法等",type:"textarea"},model:{value:e.form.introduce,callback:function(t){e.$set(e.form,"introduce",t)},expression:"form.introduce"}})],1),r("a-form-model-item",{attrs:{"wrapper-col":e.wrapperCol1}},[r("a-button",{staticStyle:{width:"30%","min-width":"64px"},attrs:{type:"primary"},on:{click:e.onSubmit}},[e._v(" 提交 ")]),r("a-button",{staticStyle:{"margin-left":"30px"},on:{click:e.resetForm}},[e._v(" 取消 ")])],1)],1)],1)])},n=[],i=r("1da1"),o=(r("96cf"),r("d3b7"),r("ac1f"),r("00b4"),r("1276"),r("159b"),r("a15b"),r("a434"),r("40a7"));function l(e){return new Promise((function(t,r){var a=new FileReader;a.readAsDataURL(e),a.onload=function(){return t(a.result)},a.onerror=function(e){return r(e)}}))}var s={data:function(){return{labelCol:{sm:{span:12},md:{span:8,offset:0},lg:{span:5,offset:0}},wrapperCol:{sm:{span:24},md:{span:16,offset:0},lg:{span:19,offset:0}},wrapperCol1:{sm:{span:24,offset:0},md:{span:16,offset:8},lg:{span:19,offset:5}},locale:o["a"],imageUrl:"",loading:"",defaultTags:[],tags:[],tagList:["PHP","Vue","Html","Css","MySQL","MongoDB","Redis","Nginx","Apache","小程序","H5","APP"],url:this.config.interfaceUrl+"/project/uploadProjectImg",width:"60%",id:this.$route.query.id,previewVisible:!1,previewImage:"",fileList:[],form:{name:"",detail:"",introduce:"",image:"",url:"",git_url:"",tag:"",skill:"",category:""},rules:{name:[{required:!0,message:"请填写资源名称",trigger:"change"}],detail:[{required:!0,message:"请填写描述",trigger:"change"}],introduce:[{required:!0,message:"请填写详细介绍及说明",trigger:"change"}],skill:[{required:!0,message:"请填写手机号",trigger:"change"}],category:[{required:!0,message:"请选择分类",trigger:"change"}]}}},mounted:function(){var e=this;this.getProjectOne(this.$route.query.id),document.documentElement.clientWidth<768?this.width="90%":this.width="60%",window.addEventListener("resize",(function(){var t=document.documentElement.clientWidth;e.width=t<768?"90%":"60%"}))},methods:{getProjectOne:function(e){var t=this;this.axios.get("project/".concat(e)).then((function(e){if(1==e.status){t.form=e.data;var r=e.data.tag.split(","),a=e.data.image.split(",");r.forEach((function(e){return t.tags.push(e)})),a.forEach((function(e,r){var a={uid:r,name:"image.png",response:{data:e},status:"done",url:t.config.mediaUrl+e};t.fileList.push(a)}))}else t.$message.error(e.info)}))},onSubmit:function(){var e=this;this.$refs.ruleForm.validate((function(t){if(!t)return console.log("error submit!!"),!1;var r=[];e.fileList.forEach((function(e){return r.push(e.response.data)})),e.form.image=r.join(","),e.axios.put("project/".concat(e.id),{params:e.form}).then((function(t){1==t.status?(e.$message.success(t.info),e.$router.push("/project")):e.$message.error(t.info)}))}))},handleSelectTag:function(e){e.length>6?(this.$message.warning("最多只能选择6个标签"),this.tags.splice(this.tags.length-1,1)):e.length<1&&this.$message.warning("至少选择1个标签"),this.form.tag=this.tags.join(",")},handleCancel:function(){this.previewVisible=!1},handlePreview:function(e){var t=this;return Object(i["a"])(regeneratorRuntime.mark((function r(){return regeneratorRuntime.wrap((function(r){while(1)switch(r.prev=r.next){case 0:if(e.url||e.preview){r.next=4;break}return r.next=3,l(e.originFileObj);case 3:e.preview=r.sent;case 4:t.previewImage=e.url||e.preview,t.previewVisible=!0;case 6:case"end":return r.stop()}}),r)})))()},handleChange:function(e){var t=e.fileList;this.fileList=t},resetForm:function(){this.$refs.ruleForm.resetFields(),this.$router.go(-1)}}},u=s,c=(r("e97c"),r("0c7c")),f=Object(c["a"])(u,a,n,!1,null,"2aae1ae8",null);t["default"]=f.exports},d784:function(e,t,r){"use strict";r("ac1f");var a=r("e330"),n=r("6eeb"),i=r("9263"),o=r("d039"),l=r("b622"),s=r("9112"),u=l("species"),c=RegExp.prototype;e.exports=function(e,t,r,f){var d=l(e),p=!o((function(){var t={};return t[d]=function(){return 7},7!=""[e](t)})),m=p&&!o((function(){var t=!1,r=/a/;return"split"===e&&(r={},r.constructor={},r.constructor[u]=function(){return r},r.flags="",r[d]=/./[d]),r.exec=function(){return t=!0,null},r[d](""),!t}));if(!p||!m||r){var g=a(/./[d]),h=t(d,""[e],(function(e,t,r,n,o){var l=a(e),s=t.exec;return s===i||s===c.exec?p&&!o?{done:!0,value:g(t,r,n)}:{done:!0,value:l(r,t,n)}:{done:!1}}));n(String.prototype,e,h[0]),n(c,d,h[1])}f&&s(c[d],"sham",!0)}},e97c:function(e,t,r){"use strict";r("6cf7")}}]);
//# sourceMappingURL=chunk-f32a20f4.a74653d6.js.map