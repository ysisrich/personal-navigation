import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)


export default new Vuex.Store({
  state: {
	  userInfo:{}
  },
  mutations: {
	  
  },
  actions: {
	  // 获取个人信息
	  getPersonInfo(state) {
		  return new Promise((resolve,reject)=>{
			  Vue.axios.get('/person/PersonInfo') 
			  	 .then(res=>{
					 // console.log(res)
					 if(res.status == 1){
						 resolve(res.data)
					 } else {
						reject(res)
					}
				})	
	  })
		  
	 }
  },
  modules: {
  }
})
