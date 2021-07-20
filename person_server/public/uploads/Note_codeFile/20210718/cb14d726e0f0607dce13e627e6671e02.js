
// const path = require('path')

// module.exports ={
// 	entry:"./src/main.js",
// 	output:{
// 		filename:'index.js',
// 		path:path.join(__dirname,'dist')
// 	},
// 	module:{
// 		rules:[
// 			{
// 				test:/\.css$/,
// 				use:[
// 					'style-loader',
// 					'css-loader'
// 				],
// 			},
// 			{
// 				test:/\.less$/,
// 				use:[
// 					'style-loader',
// 					'css-loader',
// 					'less-loader'
// 				],
// 			}
// 		]
// 	},
// 	plugins:[
		
// 	],
// 	mode:'production'
// }

// const { resolve } = require('path')
// const  html = require('html-webpack-plugin')


// module.exports = {
// 	entry :'./src/main.js',
// 	output:{
// 		filename:'index.js',
// 		path: resolve(__dirname,'dist')
// 	},
// 	module:{
// 		rules:[
			
// 		]
// 	},
// 	plugins:[
// 		new html({
// 			template:'./src/index.html'
// 		})
// 	],
// 	mode:'development'
// }

const path = require('path')
const html = require('html-webpack-plugin')

module.exports = {
	entry:'./src/main.js',
	output:{
		filename :'index.js',
		path : path.join(__dirname,'dist')
	},
	module:{
		rules:[
			{
				test:/\.less$/,
				use:['style-loader','css-loader','less-loader']
			},
			{
				test:/\.(jpg|png|gif)$/,
				loader:'url-loader',
				options:{
					// limit:8*1024
				}
			}
		]
	},
	
	plugins:[
		new html({
			template:'./src/index.html'
		})
	],
	mode:'development'
}
