#import "TESAppDelegate.h"
#import "TESScreen3ViewController.h"
#import "TESTestViewController.h"
#import "TESLoginViewController.h"


// Dummy class for distinguishing root navigation controller.
@interface TESRootNavController : UINavigationController @end
@implementation TESRootNavController @end


@interface TESAppDelegate ()
@property (nonatomic) UIViewAnimationOptions transitionAnimation;
@end


@implementation TESAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIColor *baseTintColor = [UIColor colorWithRed:0.0 green:0.572306753 blue:0.837421346 alpha:1.0];
    [UIView appearanceWhenContainedIn:[TESScreen3ViewController class], nil].tintColor = baseTintColor;
    [UIView appearanceWhenContainedIn:[TESTestViewController class], nil].tintColor = baseTintColor;
    [UIView appearanceWhenContainedIn:[TESLoginViewController class], nil].tintColor = baseTintColor;
    [UINavigationBar appearanceWhenContainedIn:[TESRootNavController class], nil].tintColor = baseTintColor;
    
    UIColor *primaryTintColor = [UIColor colorWithRed:0.495211527 green:0.909091497 blue:0.934428625 alpha:1.0];
    [UITabBar appearance].barTintColor = primaryTintColor;
    [UINavigationBar appearanceWhenContainedIn:[TESRootNavController class], nil].barTintColor = primaryTintColor;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self _goToFirstLaunch];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)_goToFirstLaunch
{
    TESLoginViewController *firstLaunchViewCtrl = [[TESLoginViewController alloc] init];
    TESRootNavController *nav = [[TESRootNavController alloc] initWithRootViewController:firstLaunchViewCtrl];
    nav.delegate = (id)self;
    nav.navigationBarHidden = NO;
    self.window.rootViewController = nav;
}

#pragma mark --- UINavigationControllerDelegate ---

#ifdef __IPHONE_9_0
- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController
#else
- (NSUInteger)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController
#endif
{
    return navigationController.topViewController.supportedInterfaceOrientations;
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPop) {
        switch (fromVC.modalTransitionStyle) {
            case UIModalTransitionStyleCoverVertical:
                return nil; // use default horizontal slide transition
            case UIModalTransitionStyleFlipHorizontal:
                self.transitionAnimation = UIViewAnimationOptionTransitionFlipFromLeft;
                break;
            case UIModalTransitionStyleCrossDissolve:
                self.transitionAnimation = UIViewAnimationOptionTransitionCrossDissolve;
                break;
            case UIModalTransitionStylePartialCurl:
                self.transitionAnimation = UIViewAnimationOptionTransitionCurlDown;
                break;
        };
    } else {
        switch (toVC.modalTransitionStyle) {
            case UIModalTransitionStyleCoverVertical:
                return nil; // use default horizontal slide transition
            case UIModalTransitionStyleFlipHorizontal:
                self.transitionAnimation = UIViewAnimationOptionTransitionFlipFromRight;
                break;
            case UIModalTransitionStyleCrossDissolve:
                self.transitionAnimation = UIViewAnimationOptionTransitionCrossDissolve;
                break;
            case UIModalTransitionStylePartialCurl:
                self.transitionAnimation = UIViewAnimationOptionTransitionCurlUp;
                break;
        };
    }
    return self;
}

#pragma mark --- UIViewControllerAnimatedTransitioning ---

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.35;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [UIView transitionFromView:fromVC.view
                        toView:toVC.view
                      duration:[self transitionDuration:transitionContext]
                       options:self.transitionAnimation
                    completion:^(BOOL finished) {
                        [transitionContext completeTransition:finished];
                    }];
}

#pragma mark --- UIApplicationDelegate ---

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    // Called when the application receives an URL from the operating system.
    // By default we provide a '/screen' route that allows external apps like WatchKit to open screens.
    NSRange range;
    if ((range = [url.resourceSpecifier rangeOfString:@"//screen/"]).location == 0) {
        NSString *targetScreen = [url.resourceSpecifier substringFromIndex:range.length];
        #pragma unused (targetScreen)  // avoid compiler warning if we have no routes



        // If no other match, default to the first launch screen
        id viewCtrl = [[TESLoginViewController alloc] init];
        [self.window.rootViewController presentViewController:viewCtrl animated:NO completion:NULL];
    }

    return YES;
}


@end
