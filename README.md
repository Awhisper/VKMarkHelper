# VKMarkHelper
## 标记位工具

### 使用场景

第一次开启功能模块标记：

- 第一次打开App需要新手引导
- 第一次进入某个新功能模块需要新手引导
- App上线新模块，需要红点醒目标记，执行过后永久消失

每天最多执行一次标记：

- 某种用户行为，每天限定一次
- 某种个功能模块，每天清零

还有更多标记位使用场景有待更新，欢迎提需求╮(╯_╰)╭

### 使用方法

#### 定义
创建一个VKMarkHelper的Category，在里面定义自己所需要的标记位

```
#import "VKMarkHelper.h"

@interface VKMarkHelper (demo)

FirstLaunchVKMark(gogogo);

OneDayShowOnceVKMark(lololo);

@end

```

第一次标记功能，使用 FirstLaunchVKMark() 宏来定义，参数为标记位名字

每天一次标记功能，使用OneDayShowOnceVKMark()宏来定义，参数为标记位名字

#### 使用

FirstLaunchVKMark(name) 会自动生成2个函数

```
+(void)setFirstLaunchVKMark+name;
+(BOOL)isFirstLaunchedVKMark+name;
```

setFirstLaunchVKMark+name方法用于标记执行过一次

isFirstLaunchedVKMark方法用于判断标记是否已经执行过一次

OneDayShowOnceVKMark(name) 会自动生成2个函数

```
+(void)setTodayShowOnceVKMark+name;
+(BOOL)isTodayShowedOnceVKMark+name;
```

setTodayShowOnceVKMark+name 方法用于标记今日执行过一次

isTodayShowedOnceVKMark+name 方法用于判断标记今日是否执行过一次

具体可以看demo

### 优点

- 只需要给标记位起个名字，一个宏全搞定
- 宏全动态自动生成成对的配套的方法
	- 自动生成方法的声明代码
	- 运行时动态生成方法的执行逻辑
- 方法声明为源码生成，因此可以得到Xcode的自动补全