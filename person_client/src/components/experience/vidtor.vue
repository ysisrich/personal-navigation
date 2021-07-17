<template>
    <div class="order">
        <div id="vditor"></div>
    </div>
</template>
<script>
import Vditor from "vditor"
import "vditor/dist/index.css"
export default {
    data(){
        return{
            contentEditor:""
        }
    },
    mounted(){
        this.contentEditor = new Vditor("vditor",{
            height:400,
            toolbarConfig:{
                pin:true
            },
            cache:{
                enable:false
            },
            after:()=>{
                this.contentEditor.setValue("")
            },
			blur:(value)=>{
				this.$emit('change',value)
			}
        })
    },
    methods:{
 
    }
}
</script>