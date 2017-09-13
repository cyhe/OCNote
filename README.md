# OCNote
Learning record
***

### JSandOC_Communications  
JSContext 使用的demo

使用webview和JS做交互的时候,可以使用JSContext与之通信,我们声明的所有和JS交互的方法,都必须实现JSExport协议,如:

```
@protocol CYBaseOpenMethodToJSProtocol <JSExport>

- (NSString *)getUserId;

- (void)showTip:(NSString *)msg;

@end
```

另外需要给JS注入一个OC对象,这样JS端就可以拿到对象调用我们的开放给JS的方法

```
self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
[self.getHandlers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id<JSExport>  _Nonnull obj, BOOL * _Nonnull stop) {
        self.jsContext[key] = obj;
}];
```
ps:

```
/**
 如果子类需要重新注入一个新对象,可以重写该方法,返回一个新对象
 
 @return return JSContext 对象方法绑定key,对JS开放
 */
- (NSDictionary<NSString *, id<JSExport>> *)getHandlers;
```

由于我们在将控制器对象注入了JSContext,所以JS能够调用到我们的方法,即声明一个协议,控制器本身遵守这个协议,并实现协议中方法,当JS调用方法时,由于已经拿到了控制器对象,所以在实际调用上就是控制器本身在调用方法

```
window.SeedObjectModel.getUserId(); 
===>  
[CYJSInterFaceWebViewController getUserId];
```
这样就是就可以通过JSContext实现OC与JS之间的交互


**但,这是错误的.............**

*我们将控制器对象注入了JS,即JS一直持有控制器对象没有销毁,这样就导致了,我们的控制器在退出时,并没有销毁,当反反复复进入退出webView,这个时候,内存会不断飙升.*

后面会提供一种思路.....未完待续……

