import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Index',
	redirect:'person',
    component: ()=> import('@/layout/default.vue'),
	meta: {
		title: '个人导航'
	},
	children:[
		{
		  path: 'person',
		  name: 'Person',
		  redirect:'/person/baseInfo',
		  component: ()=> import('@/components/person/index.vue'),
			meta: {
				title: '个人导航-个人'
			},
			children:[
				{ path:'baseInfo', nane:'BaseInfo', component: ()=> import('@/components/person/base_info.vue') },
				{ path:'editBaseInfo', nane:'EditBaseInfo', component: ()=> import('@/components/person/edit_base_info.vue') },
				{ path:'other', nane:'Other', component: ()=> import('@/components/person/other.vue') },
				{ path:'editOtherInfo', nane:'EditOtherInfo', component: ()=> import('@/components/person/edit_other_info.vue') },
			]
		},
		{
		  path: 'resume',
		  name: 'Resume',
		  component: ()=> import('@/components/resume/index.vue'),
			meta: {
				title: '个人导航-简历'
			}
		},
		{
		  path: 'project',
		  name: 'Project',
		  component: ()=> import('@/components/project/index.vue'),
			meta: {
				title: '个人导航-项目'
			},
			children:[
			]
		},
		{
		  path: 'publish',
		  name: 'Publish',
		  component: ()=> import('@/components/project/create_project.vue'),
			meta: {
				title: '个人导航-发布'
			}
		},
		{
		  path: 'editProject',
		  name: 'EditProject',
		  component: ()=> import('@/components/project/edit_project.vue'),
			meta: {
				title: '个人导航-编辑项目'
			},
		},
		{
		  path: 'detail',
		  name: 'Detail',
		  component: ()=> import('@/components/project/detail.vue'),
			meta: {
				title: '个人导航-编辑项目'
			},
		},
		{
		  path: 'experience',
		  name: 'Experience',
		  component: ()=> import('@/components/experience/index.vue'),
			meta: {
				title: '个人导航-经历'
			}
		}
	]
  },
  
]

const router = new VueRouter({
  routes
})

// 避免跳转重复路由 报错
const VueRouterPush = VueRouter.prototype.push
	VueRouter.prototype.push = function push (to) {
  return VueRouterPush.call(this, to).catch(err => err)
}

export default router
