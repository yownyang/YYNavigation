YYNavigation
------
Blog: [https://yownyang.github.io/](https://yownyang.github.io/)

##Version --- 3.1.4
1. YYNavigation发布0.3.8版本
2. 修复了先设置按钮颜色不生效的问题

##Version --- 3.1.3
1. YYNavigation发布0.3.7版本
2. 修复了在push未结束时，就进行侧滑返回，导致崩溃的问题

##Version --- 3.1.2
1. YYNavigation发布0.3.6版本
2. 修复了图片未设置渲染色时的bug，添加了图片渲染色的示例

##Version --- 3.1.1
1. YYNavigation发布0.3.5版本
2. textColor管理返回按钮，标题，左侧按钮集合，右侧按钮集合的文本颜色
3. buttonImageColor管理返回按钮，左侧按钮集合，右侧按钮集合的图片颜色

##Version --- 3.1.0
1. YYNavigation发布0.3.4版本
2. 新加buttonImageColor用于控制左右按钮集合的图片颜色，textColor影响范围发生了变化
3. 设置titleView时，返回按钮一并移除，便于布局

##Version --- 3.0.9
1. YYNavigation发布0.3.3版本
2. 添加导航栏布局刷新功能，用于不想自定义，但又需要调整导航栏UI的情况

##Version --- 3.0.8
1. YYNavigation发布0.3.2版本
2. 修复setViewControllers时的问题

##Version --- 3.0.7
1. YYNavigation发布0.3.1版本
2. 修复在iOS 17上，连续pop时的崩溃问题

##Version --- 3.0.6
1. YYNavigation发布0.3.0版本
2. 调整侧滑返回进度为15%

##Version --- 3.0.5
1. YYNavigation发布0.2.9版本
2. 添加返回按钮全局
3. 在iOS18及以上，侧滑时，tabbar会直接全部显示，所以添加透明度渐变的动画

##Version --- 3.0.4
1. YYNavigation发布0.2.8版本
2. 添加字体调整

##Version --- 3.0.3
1. YYNavigation发布0.2.4版本
2. 内存问题处理

##Version --- 3.0.2
1. YYNavigation发布0.2.3版本
2. 将侧滑成功的边界值改为30%
3. 修复popToRoot或者popToViewController的导航栏显示bug
4. 实现setViewControllers的导航栏修改

##Version --- 3.0.0
1. 在AppDelegate中展示使用appearance全局设置属性
2. 在FirstViewController中展示使用layout和frame布局，需要注意的点
3. 规范起名，将naviController/naviBar/naviItem分别改为yy_navigationController/yy_navigaitonBar/yy_navigationItem

##Version --- 2.0.6
1. 适配iPhone X
2. 现在可以使用pod 0.1.5版本了
3. 有关iPhoneX的适配可以看[这里](https://yownyang.github.io/2017/09/17/AdaptationiPhoneX/#more)

##Version --- 2.0.5 
1. 现在可以使用0.1.4版本了
2. 优化了一些内部实现

##Version --- 2.0.4
1. 支持Cocoapod 在Podfile中添加`pod 'YYNavigation'`即可
2. 更新README.md

##Version --- 2.0.3  
1. 添加了Push动画，可通过替换YYNavigationPushAnimation文件修改Push动画，默认为系统样式  
2. 添加了侧滑返回手势类型，可设置无手势、边缘手势返回、全屏手势返回

##Version --- 2.0.2
1. 修复了某些对象不能释放的BUG  
2. 修改了一些功能的内部实现  
3. 修改了一些配置信息

##Version --- 2.0.1
1. 修复了快速侧滑返回时，导航栏未正确设置的BUG  
2. 自定义了侧滑手势，可通过替换YYNavigationPopAnimation文件修改侧滑动画  
3. 移除一些无用的修饰符

##Version --- 2.0.0
1. 大改进大改进大改进，重要的事情说三遍  
2. 只需使用YYNavigationController去初始化RootViewController即可，一行代码搞定所有。(无论纯代码/storyboard/xib都无需设置系统navigationController任何属性)  
3. 实例demo更新，功能分界面展示，清晰易懂  
4. 修复一大堆之前遗留BUG

##Version --- 1.0.6
1. 在YYNavigationItem添加了isBackButtonHidden属性，可用于设置当前界面返回按钮是否隐藏  
2. 修复了在重新设置了返回按钮大小后，同时存在的titleview的位置问题

##Version --- 1.0.5
1. 修复了当你添加view后，可能会覆盖navibar的BUG

##Version --- 1.0.4
1. 现在可以直接设置backButton了  
2. 修复了使用图片不为22大小时，图片产生变形的问题

##Version --- 1.0.3
1. 修改了naviBar、naviItem的调用方式,使用更加方便快捷  
2. 修复了一个某些情况下才会出现的bug

##Version --- 1.0.2
1. 修复了在渐变naviBar透明度时，naviBar与naviItem的颜色问题

##Version --- 1.0.1  
1. 修复了设置颜色后，leftButtons、rightButtons集合中按钮文本颜色不改变的bug  
2. 增加了一个naviSuperAlpha属性，用于只修改navigation bar与navigationItem颜色，而不影响title、titleview等子控件

##Version --- 1.0.0
1. 实现了自定义NavigationBar  
2. 实现了自动初始化返回按钮  
3. 实现了titleView、leftButtons、rightButtons等系统有的基本功能  
4. 后续功能，不定期更新，使用方式尽在demo中
