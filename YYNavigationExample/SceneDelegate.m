//
//  SceneDelegate.m
//  YYNavigationExample
//

#import "SceneDelegate.h"
#import "AppDelegate.h"

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    if (![scene isKindOfClass:[UIWindowScene class]]) {
        return;
    }

    if (self.window == nil) {
        UIWindowScene *windowScene = (UIWindowScene *)scene;
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIWindow *window = [[UIWindow alloc] initWithWindowScene:windowScene];
        window.rootViewController = [storyboard instantiateInitialViewController];
        self.window = window;
        [window makeKeyAndVisible];
    }

    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.window = self.window;
}

@end
