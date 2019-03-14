<?php
return array(
	//'配置项'=>'配置值'
//    'DEFAULT_CONTROLLER'    =>  'all', // 默认控制器名称
//    'DEFAULT_ACTION'        =>  'shop', // 默认操作名称
	'VIEW_PATH'		=> './Tpl/', //模板位置单独定义
	'DEFAULT_THEME' => 'wap',     //定义模板主题
	'THEME_LIST' => 'wap',
    'TMPL_LAYOUT_ITEM'      =>  '{__CONTENT__}', // 布局模板的内容替换标识
    'LAYOUT_ON'             =>  true, // 是否启用布局
    'LAYOUT_NAME'           =>  'layout', // 当前布局名称 默认为layout

	'TMPL_PARSE_STRING'    => array(
		//手机端静态文件
        '__WCSS__'       => __ROOT__ . '/Public/home/wap/css',
        '__WJS__'        => __ROOT__ . '/Public/home/wap/js',
        '__WIMG__'       => __ROOT__ . '/Public/home/wap/images',
        '__WAP__'        => __ROOT__ . '/Public/home/wap',

        '__COM__'        => __ROOT__ . '/Public/home/common',
        '__MUSIC__'		 => __ROOT__ . '/Public/music',

        //上传头像
        '__IMGHEAD__'        => __ROOT__ . '/Public/home/wap/heads',
        //头像上传JD
        '__IMGJS__'        => __ROOT__ . '/Public/home/wap/jsa',

        '__LAYERUI__'       => __ROOT__ . '/Public/home/wap/layui',

    ),
);