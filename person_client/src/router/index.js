import Vue from 'vue'
import VueRouter from 'vue-router'

const Index = ()=> import('@/layout/default.vue')
const Editor = ()=> import('@/components/experience/juejinEditor.vue')
const Person = ()=> import('@/components/person/index.vue')
const BaseInfo =  ()=> import('@/components/person/base_info.vue')
const EditBaseInfo = ()=> import('@/components/person/edit_base_info.vue')
const Other = ()=> import('@/components/person/other.vue')
const EditOtherInfo = ()=> import('@/components/person/edit_other_info.vue')
const Resume = ()=> import('@/components/resume/index.vue')
const Project = ()=> import('@/components/project/index.vue')
const Publish = ()=> import('@/components/project/create_project.vue')
const EditProject = ()=> import('@/components/project/edit_project.vue')
const Detail = ()=> import('@/components/project/detail.vue')
const Experience = ()=> import('@/components/experience/index.vue')
const Publish_note = ()=> import('@/components/experience/create_note.vue')
const DetailNote = ()=> import('@/components/experience/detail.vue')

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Index',
	redirect:'person',
    component: Index,
	meta: {
		title: '个人导航'
	},
	children:[
		{
		  path: 'editor',
		  name: 'Editor',
		  component: Editor,
			meta: {
				title: '个人导航-笔记'
			}
		},
		{
		  path: 'person',
		  name: 'Person',
		  redirect:'/person/baseInfo',
		  component: Person,
			meta: {
				title: '个人导航-个人'
			},
			children:[
				{ path:'baseInfo', nane:'BaseInfo', component:  BaseInfo},
				{ path:'editBaseInfo', nane:'EditBaseInfo', component:  EditBaseInfo},
				{ path:'other', nane:'Other', component: Other },
				{ path:'editOtherInfo', nane:'EditOtherInfo', component:  EditOtherInfo},
			]
		},
		{
		  path: 'resume',
		  name: 'Resume',
		  component: Resume,
			meta: {
				title: '个人导航-简历'
			}
		},
		{
		  path: 'project',
		  name: 'Project',
		  component: Project,
			meta: {
				title: '个人导航-项目',
				keepAlive :true
			},
			children:[
			]
		},
		{
		  path: 'publish',
		  name: 'Publish',
		  component: Publish,
			meta: {
				title: '个人导航-发布'
			}
		},
		{
		  path: 'editProject',
		  name: 'EditProject',
		  component: EditProject,
			meta: {
				title: '个人导航-编辑项目'
			},
		},
		{
		  path: 'detail',
		  name: 'Detail',
		  component: Detail,
			meta: {
				title: '个人导航-详细介绍'
			},
		},
		{
		  path: 'experience',
		  name: 'Experience',
		  component: Experience,
			meta: {
				title: '个人导航-笔记',
				keepAlive :true
			}
		},
		{
		  path: 'publish_note',
		  name: 'Publish_note',
		  component: Publish_note,
			meta: {
				title: '个人导航-发布笔记'
				
			}
		},
		{
		  path: 'detail_note',
		  name: 'DetailNote',
		  component: DetailNote,
			meta: {
				title: '个人导航-详细介绍'
			},
		},
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
