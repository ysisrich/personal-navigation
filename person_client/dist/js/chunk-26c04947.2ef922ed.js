(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-26c04947"],{6423:function(t,e,o){"use strict";o("87d2")},"801c":function(t,e,o){"use strict";o.r(e);var a=function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("div",[o("a-row",[o("a-col",{staticStyle:{padding:"0 10px"},attrs:{xs:24,sm:24,md:24,lg:24,xl:16}},[t.form.name?o("a-card",{staticStyle:{width:"100%","margin-bottom":"40px",overflow:"hidden"},attrs:{bodyStyle:{padding:"24px"}}},[o("div",[o("a-button",{staticStyle:{padding:"0"},attrs:{type:"link"},on:{click:t.back}},[o("a-icon",{attrs:{type:"left"}}),t._v(" 返回 ")],1)],1),o("div",{staticClass:"ant-project-info"},[t._v(" "+t._s(t.form.name)+" ")]),o("div",{staticClass:"ant-text-answer markdown-body"},[o("VueMarkdown",{directives:[{name:"highlight",rawName:"v-highlight"}],attrs:{source:t.form.answer}})],1),o("a-divider",{attrs:{dashed:""}}),t.form.url?o("div",[o("span",[t._v("相关链接：")]),o("span",{staticStyle:{color:"#1890ff",cursor:"pointer"},on:{click:t.toUrl}},[t._v(t._s(t.form.url))]),o("a-tooltip",{staticStyle:{"margin-left":"5px"},attrs:{placement:"top"}},[o("template",{slot:"title"},[o("span",[t._v(t._s(t.copy_title))])]),o("a-icon",{style:{color:"#1890ff",cursor:"pointer"},attrs:{type:t.copy_type},on:{click:function(e){return t.handleCopy(t.form.url)}}})],2)],1):t._e(),t.form.other?o("div",{staticStyle:{margin:"10px 0"}},[o("span",[t._v("内容标签：")]),o("span",{staticStyle:{color:"#1890ff",cursor:"pointer"}},t._l(t.defaultTags,(function(e,a){return o("a-tag",{key:"index",attrs:{color:t.tag_colors[Math.ceil(7*Math.random())-1]}},[t._v(" "+t._s(e)+" ")])})),1)]):t._e(),t.form.code_file?o("div",{staticStyle:{"margin-bottom":"10px"}},[o("span",[t._v("代码文件：")]),o("span",{staticStyle:{color:"#1890ff",cursor:"pointer"}},[o("a-tag",{attrs:{color:t.tag_colors[Math.ceil(7*Math.random())-1]}},[t._v(" "+t._s(t.form.code_file.split(".")[1])+"文件 ")]),o("span",{on:{click:function(e){return t.downloadFile(t.form.code_file)}}},[t._v(" 下载 "),o("a-icon",{attrs:{type:"arrow-down"}})],1)],1)]):t._e(),o("div",{staticStyle:{"margin-bottom":"20px"}},[o("span",[t._v("创建时间：")]),o("span",[t._v(t._s(t.form.create_time))])])],1):o("a-card",t._l(5,(function(t){return o("a-skeleton",{key:t,attrs:{size:120,active:"",paragraph:!1,loading:!0}})})),1)],1),o("a-col",{staticStyle:{padding:"0 10px"},attrs:{xs:24,sm:24,md:24,lg:24,xl:8}},[o("a-card",{staticStyle:{width:"100%"},attrs:{title:"其他资源",bordered:!1,bodyStyle:{padding:"20px"}}},[t._l(t.list,(function(e,a){return t.list.length>0?o("div",{staticClass:"ant-detail-other"},[o("Card",{attrs:{noteItem:e}})],1):t._e()})),t._l(5,(function(e){return 0==t.list.length?o("a-skeleton",{key:e,attrs:{size:120,active:"",paragraph:!1,loading:!0}}):t._e()}))],2)],1)],1)],1)},i=[],n=(o("ac1f"),o("1276"),o("d3b7"),o("159b"),o("a434"),o("99af"),o("b0c0"),o("7434")),s=o("9ce6"),r=o.n(s),c={data:function(){return{id:this.$route.query.id,noteList:"",list:[],IsShow:!1,loading:!0,domain:this.config.mediaUrl,tag_colors:["pink","red","orange","green","cyan","blue","purple"],images:[],form:"",defaultTags:[],copy_type:"copy",copy_title:"复制"}},components:{Card:n["a"],VueMarkdown:r.a},mounted:function(){this.getNoteOne(this.$route.query.id),this.getNoteList()},methods:{getNoteOne:function(t){var e=this;this.axios.get("note/".concat(t)).then((function(t){if(console.log(t),1==t.status){e.form=t.data;var o=t.data.other.split(",");o.forEach((function(t){return e.defaultTags.push(t)})),e.loading=!1}else that.$message.error(t.info)}))},getNoteList:function(){var t=this,e=this;this.axios.get("/note").then((function(o){if(1==o.status){t.noteList=o.data,t.noteList.forEach((function(e,o,a){t.id==e.id&&a.splice(o,1)})),t.noteList.forEach((function(t){t.other=t.other.split(",")}));for(var a=0;a<2;a++){var i=Math.ceil(Math.random()*t.noteList.length)-1;t.list.push(t.noteList[i]),t.noteList.splice(i,1)}}else e.show=!0,t.$message.error(o.info)})).catch((function(t){console.log(t)}))},back:function(){this.$router.push("/experience")},toUrl:function(){window.open(this.form.url)},downloadFile:function(t){var e=this.config.mediaUrl+t;open(e)},handleCopy:function(t){var e=document.createElement("input");e.value=t,document.body.appendChild(e),e.select(),document.execCommand("Copy"),document.body.removeChild(e),this.copy_type="check",this.copy_title="复制成功"},toGitUrl:function(){window.open(this.form.git_url)},like:function(){this.$message.success("感谢点赞！")},share:function(){var t="我在个人导航发现了『 ".concat(this.form.name," 』 快来看看 ").concat(this.config.onLineUrl,"#/detail_note?id=").concat(this.form.id);this.handleCopy(t),this.$message.success("链接已复制，感谢分享！")},deleteProject:function(){console.log(this.form.id),this.$message.error("禁止删除")}}},l=c,d=(o("6423"),o("0c7c")),f=Object(d["a"])(l,a,i,!1,null,"cfa31f52",null);e["default"]=f.exports},"87d2":function(t,e,o){}}]);
//# sourceMappingURL=chunk-26c04947.2ef922ed.js.map