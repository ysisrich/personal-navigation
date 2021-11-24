
const compressionWebpackPlugin = require('compression-webpack-plugin'); //引入插件
const productionGZipExtensions = ['js', 'css']; //压缩的文件类型


const UglifyJsPlugin = require('uglifyjs-webpack-plugin');

const {resolve} = require('path');

const currentProcessEnv = process.env.NODE_ENV

module.exports = {
    // publicPath:process.env.NODE_ENV === 'production' ? '/vue_workspac/aihuhuproject/' : '/',
    
    //基本路径
    publicPath: './',//默认的'/'是绝对路径，如果不确定在根路径，改成相对路径'./'
    // 输出文件目录
    outputDir: 'dist',
    assetsDir:'',
    indexPath:'index.html',
    // eslint-loader 是否在保存的时候检查
    lintOnSave: true,
    // 生产环境是否生成 sourceMap 文件
    productionSourceMap: false,
    // productionGzip: true,
    // productionGzipExtensions: ['js', 'css'],
    // css相关配置
    css: {
        // 是否使用css分离插件 ExtractTextPlugin
        extract: true,
        // 开启 CSS source maps?
        sourceMap: false,
    },
    // webpack-dev-server 相关配置
    devServer: {
        open: false,//open 在devServer启动且第一次构建完成时，自动用我们的系统的默认浏览器去打开要开发的网页
        host: '0.0.0.0',//默认是 localhost。如果你希望服务器外部可访问，指定如下 host: '0.0.0.0'，设置之后之后可以访问ip地址
        port: 8000,
        hot:true,//hot配置是否启用模块的热替换功能，devServer的默认行为是在发现源代码被变更后，通过自动刷新整个页面来做到事实预览，开启hot后，将在不刷新整个页面的情况下通过新模块替换老模块来做到实时预览。
        https: false,
        hotOnly: false,// hot 和 hotOnly 的区别是在某些模块不支持热更新的情况下，前者会自动刷新页面，后者不会刷新页面，而是在控制台输出热更新失败
        // 设置代理
        // proxy: {
        //     '/': {
        //         target: 'http://xxxx:8080', //目标接口域名
        //         secure: false, //false为http访问，true为https访问
        //         changeOrigin: true, //是否跨域
        //         pathRewrite: {
        //             '^/': '/' //重写接口
        //         }
        //     }
        // }, 
        before: app => {}
    },

    chainWebpack(config) {
        // 去除console.log输出
        config.optimization.minimizer('terser').tap((args) => {
          args[0].terserOptions.compress.drop_console = true
          return args
        })
        
        // 开启gzip压缩
        config.resolve.alias.set('@', resolve('src'));
        if (process.env.NODE_ENV === 'production') {
            config.plugin('compressionPlugin')
            .use(new compressionWebpackPlugin({
                filename: '[path].gz[query]',
                algorithm: 'gzip',
                test: productionGZipExtensions,
                threshold: 10240,
                minRatio: 0.8,
                deleteOriginalAssets: false
            }));
        }
    },
    
    configureWebpack:config=> {
    
        plugins: [
            new UglifyJsPlugin({
                uglifyOptions: {
                  //生产环境自动删除console
                  compress: {
                    drop_debugger: true,
                    drop_console: true,
                    pure_funcs: ['console.log']
                  }
                },
                sourceMap: false,
                parallel: true
              }),
    // 开启gzip压缩
    //       new compressionWebpackPlugin({
    //         //[file] 会被替换成原始资源。[path] 会被替换成原始资源的路径， [query] 会被替换成查询字符串。默认值是 "[path].gz[query]"。
    //         asset: '[path].gz[query]', // 提示compression-webpack-plugin@3.0.0的话asset改为filename
    //         //可以是 function(buf, callback) 或者字符串。对于字符串来说依照 zlib 的算法(或者 zopfli 的算法)。默认值是 "gzip"。
    //         algorithm: 'gzip',
    //         //所有匹配该正则的资源都会被处理。默认值是全部资源。
    //         test: new RegExp('\\.(' + productionGZipExtensions.join('|') + ')$'),
    //         //只有大小大于该值的资源会被处理。单位是 bytes。默认值是 0。
    //         threshold: 10240,
    //         //只有压缩率小于这个值的资源才会被处理。默认值是 0.8。
    //         minRatio: 0.8,
    //         //是否删除源资源
    //         deleteOriginalAssets:false
    //       })
        ] 

      },
  

    // 第三方插件配置
    pluginOptions: {
        // ...
        
    }
};