<template>
    <div class="order">
        <div id="vditor"></div>
    </div>
</template>
<script>
import Vditor from "vditor"
import "vditor/dist/index.css"
import config from '../../../config.js'

console.log(config)
export default {
    data(){
        return{
            contentEditor:""
        }
    },
    mounted(){
        this.contentEditor = new Vditor("vditor",{
            height:400,
			placeholder:'请输入内容',
            toolbarConfig:{
                pin:true
            },
			upload: {
			  accept: 'image/*',
			  url: this.config.interfaceUrl +'/note/uploadNoteImg',
			  fieldName:'file',
			  success(editor, msg){
				  console.log(JSON.parse(msg))
				  this.insertValue(config.mediaUrl + msg.data)
				  console.log(this.insertValue())
			  }
			},
            cache:{
                enable:false
            },
            after:()=>{
                this.contentEditor.setValue("")
            },
			blur:(value)=>{
				this.$emit('change',value)
			},
			insertValue(value){
				console.log(value)
			}
        },
		)
    },
    methods:{
		getValue(val){
			console.log(val)
		}
    }
}
</script>
<style>
	
</style>