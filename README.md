YYNavigation
=======
联系方式QQ：990192315
-------

#Version --- 1.0.0
1、实现了自定义NavigationBar  
2、实现了自动初始化返回按钮  
3、实现了titleView、leftButtons、rightButtons等系统有的基本功能  
4、后续功能，不定期更新，使用方式尽在demo中\<br>

#Version --- 1.0.1  
1.修复了设置颜色后，leftButtons、rightButtons集合中按钮文本颜色不改变的bug  
2.增加了一个naviSuperAlpha属性，用于只修改navigation bar与navigationItem颜色，而不影响title、titleview等子控件

#Version --- 1.0.2
1.修复了在渐变naviBar透明度时，naviBar与naviItem的颜色问题

#Version --- 1.0.3
1.修改了naviBar、naviItem的调用方式,使用更加方便快捷  
2.修复了一个某些情况下才会出现的bug\<br>

#Version --- 1.0.4
1.现在可以直接设置backButton了  
2.修复了使用图片不为22大小时，图片产生变形的问题

#Version --- 1.0.5
1.修复了当你添加view后，可能会覆盖navibar的BUG

#Version --- 1.0.6
1.在YYNavigationItem添加了isBackButtonHidden属性，可用于设置当前界面返回按钮是否隐藏  
2.修复了在重新设置了返回按钮大小后，同时存在的titleview的位置问题

#Version --- 2.0.0
1、大改进大改进大改进，重要的事情说三遍  
2、只需使用YYNavigationController去初始化RootViewController即可，一行代码搞定所有。(无论纯代码/storyboard/xib都无需设置系统navigationController任何属性)  
3、实例demo更新，功能分界面展示，清晰易懂  
4、修复一大堆之前遗留BUG

#Version --- 2.0.1
1、修复了快速侧滑返回时，导航栏未正确设置的BUG  
2、自定义了侧滑手势，可通过替换YYNavigationPopAnimation文件修改侧滑动画  
3、移除一些无用的修饰符

#Version --- 2.0.2
1、修复了某些对象不能释放的BUG  
2、修改了一些功能的内部实现  
3、修改了一些配置信息

