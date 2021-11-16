import Vue from 'vue'
import VueRouter from 'vue-router'







Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Index',
	redirect:'person',
    component: resolve=> require(['@/layout/default.vue'],resolve),
	meta: {
		title: '个人导航'
	},
	children:[
		{
		  path: 'editor',
		  name: 'Editor',
		  component: resolve=> require(['@/components/experience/juejinEditor.vue'],resolve),
			meta: {
				title: '个人导航-笔记'
			}
		},
		{
		  path: 'person',
		  name: 'Person',
		  redirect:'/person/baseInfo',
		  component: resolve=> require(['@/components/person/index.vue'],resolve),
			meta: {
				title: '个人导航-个人'
			},
			children:[
				{ path:'baseInfo', nane:'BaseInfo', component:  resolve=> require(['@/components/person/base_info.vue'],resolve)},
				{ path:'editBaseInfo', nane:'EditBaseInfo', component:  resolve=> require(['@/components/person/edit_base_info.vue'],resolve)},
				{ path:'other', nane:'Other', component: resolve=> require(['@/components/person/other.vue'],resolve) },
				{ path:'editOtherInfo', nane:'EditOtherInfo', component:  resolve=> require(['@/components/person/edit_other_info.vue'],resolve)},
			]
		},
		{
		  path: 'resume',
		  name: 'Resume',
		  component: resolve=> require(['@/components/resume/index.vue'],resolve),
			meta: {
				title: '个人导航-简历'
			}
		},
		{
		  path: 'project',
		  name: 'Project',
		  component: resolve=> require(['@/components/project/index.vue'],resolve),
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
		  component: resolve=> require(['@/components/project/create_project.vue'],resolve),
			meta: {
				title: '个人导航-发布'
			}
		},
		{
		  path: 'editProject',
		  name: 'EditProject',
		  component: resolve=> require(['@/components/project/edit_project.vue'],resolve),
			meta: {
				title: '个人导航-编辑项目'
			},
		},
		{
		  path: 'detail',
		  name: 'Detail',
		  component: resolve=> require(['@/components/project/detail.vue'],resolve),
			meta: {
				title: '个人导航-详细介绍'
			},
		},
		{
		  path: 'experience',
		  name: 'Experience',
		  component: resolve=> require(['@/components/experience/index.vue'],resolve),
			meta: {
				title: '个人导航-笔记',
				keepAlive :true
			}
		},
		{
		  path: 'publish_note',
		  name: 'Publish_note',
		  component: resolve=> require(['@/components/experience/create_note.vue'],resolve),
			meta: {
				title: '个人导航-发布笔记'
				
			}
		},
		{
		  path: 'detail_note',
		  name: 'DetailNote',
		  component: resolve=> require(['@/components/experience/detail.vue'],resolve),
			meta: {
				title: '个人导航-详细介绍'
			},
		},

		{
			path: 'menu_1',
			name: 'Menu_1',
			component: resolve=> require(['@/components/menu_1/index.vue'],resolve),
			meta: {
				title: '个人导航-框架'
			},
		},
		{
			path: 'create',
			name: 'Create',
			component: resolve=> require(['@/components/menu_1/create.vue'],resolve),
				meta: {
				title: '个人导航-发布'
			}
		},
		{
			path: 'menu_detail',
			name: 'menuDetail',
			component: resolve=> require(['@/components/menu_1/menu_detail.vue'],resolve),
			  meta: {
				  title: '个人导航-详细介绍'
			  },
		  },

		  {
			path: 'editMenu',
			name: 'EditMenu',
			component: resolve=> require(['@/components/menu_1/edit_menu.vue'],resolve),
			  meta: {
				  title: '个人导航-编辑项目'
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
