/*
  This code was generated in Neonto Studio Personal Edition:
  
    http://www.neonto.com
  
  You may use this code ONLY for non-commercial purposes and evaluation.
  Reusing any part of this code for commercial purposes is not permitted.
  
  Would you like to remove this restriction?
  With Neonto's flexible licensing options, you can have your own copyright
  in all this code.
  
  Find out more -- click 'Upgrade to Pro' in Neonto Studio's toolbar.
  
*/

#import "TESLoginViewController.h"
#import "TESAppDelegate.h"
#import "TESTestViewController.h"


@interface TESLoginViewController ()
@property (nonatomic) TESLoginBackgroundShapeView *elemBackgroundShape;
@property (nonatomic) UIButton *elemButton;
@property (nonatomic) UITextView *elemText;
@property (nonatomic) CGSize visibleKeyboardSize;
@property (nonatomic) CGPoint originalScrollContentOffset;

@end

@implementation TESLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)loadView
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if (([[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch] == NSOrderedAscending)) {
        // Before iOS 8, screen size did not take orientation into account
        if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
            screenSize = CGSizeMake(screenSize.height, screenSize.width);
        }
    }
    UIView *rootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
    
    rootView.tintColor = [UIColor colorWithRed:0.0 green:0.572306753 blue:0.837421346 alpha:1.0];

    rootView.clipsToBounds = YES;

    TESLoginBackgroundShapeView *elemBackgroundShape = [[TESLoginBackgroundShapeView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 568.0)];
    self.elemBackgroundShape = elemBackgroundShape;

    elemBackgroundShape.userInteractionEnabled = NO;

    [rootView addSubview:self.elemBackgroundShape];
    
    UIButton *elemButton = [UIButton buttonWithType:UIButtonTypeSystem];
    elemButton.frame = CGRectMake(100.5, 262.0, 113.2, 34.0);
    self.elemButton = elemButton;

    [elemButton setTitle:@"Log in" forState:UIControlStateNormal];
    elemButton.titleLabel.font = [UIFont systemFontOfSize:18.0];
    elemButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    elemButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    {   // align button contents within frame using insets
        UIEdgeInsets insets;
        insets = elemButton.titleEdgeInsets;
        insets.left += 2.3;
        insets.top += -3.6;
        elemButton.titleEdgeInsets = insets;
        insets = elemButton.imageEdgeInsets;
        insets.left += 2.3;
        elemButton.imageEdgeInsets = insets;
    }
    elemButton.layer.borderWidth = 0.9;
    elemButton.layer.borderColor = [UIView appearanceWhenContainedIn:[self class], nil].tintColor.CGColor;
    elemButton.layer.cornerRadius = 6.8;
    [elemButton addTarget:self action:@selector(buttonTapAction:) forControlEvents:UIControlEventTouchUpInside];

    [rootView addSubview:self.elemButton];
    
    UITextView *elemText = [[UITextView alloc] initWithFrame:CGRectMake(93.5, 139.5, 132.8, 25.5)];
    self.elemText = elemText;

    elemText.editable = NO;
    elemText.selectable = NO;
    elemText.userInteractionEnabled = NO;
    elemText.scrollEnabled = NO;
    elemText.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    elemText.textContainerInset = UIEdgeInsetsMake(1, 1, 1, 1);
    elemText.textContainer.lineFragmentPadding = 0.0;
    elemText.contentMode = UIControlContentVerticalAlignmentTop;
        NSMutableParagraphStyle *pstyle_elemText = [[NSMutableParagraphStyle alloc] init];
        pstyle_elemText.minimumLineHeight = 18.810;
        pstyle_elemText.maximumLineHeight = 18.810;
        pstyle_elemText.alignment = NSTextAlignmentLeft;
        NSDictionary *elemTextTextAttrs = @{
            NSForegroundColorAttributeName: [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0],
            NSFontAttributeName: [UIFont systemFontOfSize:16.1],
            NSParagraphStyleAttributeName: pstyle_elemText
        };
    elemText.attributedText = [[NSAttributedString alloc] initWithString:@"Hello PePEpeP" attributes:elemTextTextAttrs];

    [rootView addSubview:self.elemText];
    
    
    self.title = @"Login";
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view = rootView;
    [self viewDidLoad];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

#ifdef __IPHONE_9_0
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
#else
- (NSUInteger)supportedInterfaceOrientations
#endif
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UINavigationController *)parentNavigationController
{
    // Dynamically determine whether we're within a hierarchical container
    // view controller (UINavigationController or something that works like it).

    UINavigationController *nav = (id)self.parentViewController;


    if ([nav isKindOfClass:[UIPageViewController class]] || [nav isKindOfClass:[UITabBarController class]]) {
        if ([nav respondsToSelector:@selector(containerViewController)] && [(id)nav containerViewController]) {
            // We're inside a multipage that is nested, so the nav is the container's parent
            id container = [(id)nav containerViewController];
            return (id)[container parentViewController];
        }
        nav = (id)nav.parentViewController;
    }
    if ([nav respondsToSelector:@selector(popToViewController:animated:)]) {
        return nav;
    }
    return nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self repositionElements];
    
    UINavigationController *nav = [self parentNavigationController];
    nav.navigationBarHidden = NO;
    nav.navigationBar.titleTextAttributes = @{ 
        NSForegroundColorAttributeName: [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]
    };
}

- (void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    for (id view in [self.view subviews]) {
        if ([view respondsToSelector:@selector(setDelegate:)] && [view respondsToSelector:@selector(delegate)] && [view delegate] == (id)self)
            [view setDelegate:nil];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardDidShow:(NSNotification *)notif
{
    UIView *rootView = self.view;
    UIScrollView *scroll = nil;
    // write scrollview here if it's used


    _visibleKeyboardSize = [[notif.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;

    UIView *firstResp = nil;
    for (UIView *subview in rootView.subviews) {
        if (subview.isFirstResponder) {
            firstResp = subview;
            break;
        }
    }
    const CGFloat margin = 20;
    const CGFloat minYToShow = firstResp.frame.origin.y + firstResp.frame.size.height + margin;
    
    if ( !scroll) {
        // If the content isn't in a scrollview, we can bump up the whole view
        CGRect frame = rootView.frame;
        
        CGFloat keyboardY = frame.size.height - _visibleKeyboardSize.height;
        if (minYToShow >= keyboardY) {
            frame.origin.y -= minYToShow - keyboardY;
        }
        
        [UIView animateWithDuration:0.3 animations:^{
            rootView.frame = frame;
        }];
        _originalScrollContentOffset = frame.origin;
    }
    else {
        // The content is in a scrollview, so move that
        CGSize contentSize = scroll.contentSize;
        contentSize.height += _visibleKeyboardSize.height;
        scroll.contentSize = contentSize;

        CGPoint contentOffset = scroll.contentOffset;
        CGFloat maxVisibleY = contentOffset.y + self.view.bounds.size.height - _visibleKeyboardSize.height;
        if (maxVisibleY < minYToShow) {
            _originalScrollContentOffset = contentOffset;
            contentOffset.y = MIN(firstResp.frame.origin.y - (firstResp.frame.size.height + margin), contentSize.height - scroll.frame.size.height);
            [scroll setContentOffset:contentOffset animated:YES];
        }
    }
}


- (void)keyboardWillHide:(NSNotification *)notif
{
    UIView *rootView = self.view;
    UIScrollView *scroll = nil;


    if (_visibleKeyboardSize.height > 0.0) {

        if ( !scroll) {
            CGRect frame = rootView.frame;
            frame.origin.y -= _originalScrollContentOffset.y;
            
            [UIView animateWithDuration:0.3 animations:^{
                rootView.frame = frame;
            }];
        }
        else {
            CGSize contentSize = scroll.contentSize;
            contentSize.height -= _visibleKeyboardSize.height;
            CGPoint contentOffset = scroll.contentOffset;
            if (contentOffset.y > contentSize.height - scroll.frame.size.height) {
                [UIView animateWithDuration:0.2
                                 animations:^{
                                     scroll.contentOffset = _originalScrollContentOffset;
                                 }
                                 completion:^(BOOL finished) {
                                     scroll.contentSize = contentSize;
                                 }];
            } else {
                scroll.contentSize = contentSize;
            }
        }
    }
    _visibleKeyboardSize = CGSizeZero;
}

- (void)buttonTapAction:(id)sender
{
    // Determine whether we're within a hierarchical container view controller
    // (UINavigationController or something that works like it),
    // and if one of the higher-level view controllers is the screen where we're going.
    // If not in a hierarchical parent, just do modal-style present.
    Class cls = [TESTestViewController class];
    TESTestViewController *viewCtrl = nil;
    UINavigationController *nav = [self parentNavigationController];
    if (nav) {
        for (viewCtrl in nav.viewControllers.reverseObjectEnumerator) {
            if ([viewCtrl isKindOfClass:cls]) {
                break;
            }
        }
    }
    
    if (viewCtrl) {
        [viewCtrl removeFromParentViewController];
        [nav pushViewController:viewCtrl animated:YES];
        
    } else {
        const BOOL addToNav = YES;
        viewCtrl = [[cls alloc] init];
        viewCtrl.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        
    
        if (nav && addToNav) {
            viewCtrl.navigationItem.hidesBackButton = NO;
            [nav pushViewController:viewCtrl animated:YES];
        } else {
            [self presentViewController:viewCtrl animated:YES completion:NULL];
        }
    }
    
    

}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self repositionElements];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration*0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self repositionElements];
    });
}

- (void)setOverrideElementLayoutDescriptors:(NSDictionary *)d
{
    _overrideElementLayoutDescriptors = d;
    [self repositionElements];
}

- (void)repositionElements
{
    const double yOff = self.layoutYOffset;
    const BOOL flowIsHoriz = NO;
    CGFloat flowPos = 20.0;  // start right below the status bar.
    id val;

    const BOOL isPad = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
    const BOOL isPortrait = UIInterfaceOrientationIsPortrait([[UIApplication sharedApplication] statusBarOrientation]);
    NSInteger format = 0;
    if (isPad) {
        format = (isPortrait) ? 16 : 15;
    } else {
        double screenDim = MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        format = (screenDim <= 480.0) ? 3 : (screenDim <= 568.0 ? 5 : (screenDim <= 667.0 ? 17 : 19));
        if (isPortrait) format++;
    }
    NSArray *layoutDescs_elemBackgroundShape = @[
    @[@4, [NSValue valueWithCGRect:CGRectMake(0.0, 0.0+yOff, 320.0, 480.0)], [NSValue valueWithCGPoint:CGPointMake(0.0, -20.0)]],  // iphoneclassic_portrait
    @[@6, [NSValue valueWithCGRect:CGRectMake(0.0, 0.0+yOff, 320.0, 568.0)], [NSValue valueWithCGPoint:CGPointMake(0.0, -20.0)]],  // iphone5_portrait
    @[@20, [NSValue valueWithCGRect:CGRectMake(0.0, 0.0+yOff, 414.0, 736.0)], [NSValue valueWithCGPoint:CGPointMake(0.0, -20.0)]],  // iphone6plus_portrait
    @[@16, [NSValue valueWithCGRect:CGRectMake(0.0, 0.0+yOff, 768.0, 1024.0)], [NSValue valueWithCGPoint:CGPointMake(0.0, -20.0)]],  // ipad_portrait
    @[@18, [NSValue valueWithCGRect:CGRectMake(0.0, 0.0+yOff, 375.0, 667.0)], [NSValue valueWithCGPoint:CGPointMake(0.0, -20.0)]],  // iphone6_portrait
    ];
    NSDictionary *override_elemBackgroundShape = [_overrideElementLayoutDescriptors objectForKey:@"background shape"];
    if ((val = [override_elemBackgroundShape objectForKey:@"layoutDescs"]))
       layoutDescs_elemBackgroundShape = val;
    [self applyLayout:layoutDescs_elemBackgroundShape toView:self.elemBackgroundShape format:format associatedData:nil flowIsHorizontal:flowIsHoriz flowPosPtr:&flowPos];
    
    NSArray *layoutDescs_elemButton = @[
    @[@4, [NSValue valueWithCGRect:CGRectMake(101.5, 265.0+yOff, 114.58, 34.38)], [NSValue valueWithCGPoint:CGPointMake(0.0, 245.0)]],  // iphoneclassic_portrait
    @[@6, [NSValue valueWithCGRect:CGRectMake(100.5, 262.0+yOff, 113.21, 33.96)], [NSValue valueWithCGPoint:CGPointMake(0.0, 242.0)]],  // iphone5_portrait
    @[@20, [NSValue valueWithCGRect:CGRectMake(95.33, 248.33+yOff, 107.30, 32.19)], [NSValue valueWithCGPoint:CGPointMake(0.0, 228.33)]],  // iphone6plus_portrait
    @[@16, [NSValue valueWithCGRect:CGRectMake(100.0, 260.0+yOff, 112.50, 33.75)], [NSValue valueWithCGPoint:CGPointMake(0.0, 240.0)]],  // ipad_portrait
    @[@18, [NSValue valueWithCGRect:CGRectMake(100.5, 261.5+yOff, 113.07, 33.92)], [NSValue valueWithCGPoint:CGPointMake(0.0, 241.5)]],  // iphone6_portrait
    ];
    NSDictionary *override_elemButton = [_overrideElementLayoutDescriptors objectForKey:@"button"];
    if ((val = [override_elemButton objectForKey:@"layoutDescs"]))
       layoutDescs_elemButton = val;
    [self applyLayout:layoutDescs_elemButton toView:self.elemButton format:format associatedData:nil flowIsHorizontal:flowIsHoriz flowPosPtr:&flowPos];
    
    NSArray *layoutDescs_elemText = @[
    @[@4, [NSValue valueWithCGRect:CGRectMake(94.5, 141.0+yOff, 134.42, 26.0)], [NSValue valueWithCGPoint:CGPointMake(0.0, 121.0)]],  // iphoneclassic_portrait
    @[@6, [NSValue valueWithCGRect:CGRectMake(93.5, 139.5+yOff, 132.80, 25.5)], [NSValue valueWithCGPoint:CGPointMake(0.0, 119.5)]],  // iphone5_portrait
    @[@20, [NSValue valueWithCGRect:CGRectMake(88.67, 132.0+yOff, 125.87, 23.33)], [NSValue valueWithCGPoint:CGPointMake(0.0, 112.0)]],  // iphone6plus_portrait
    @[@16, [NSValue valueWithCGRect:CGRectMake(93.0, 139.0+yOff, 131.98, 29.0)], [NSValue valueWithCGPoint:CGPointMake(0.0, 119.0)]],  // ipad_portrait
    @[@18, [NSValue valueWithCGRect:CGRectMake(93.5, 139.0+yOff, 132.65, 25.5)], [NSValue valueWithCGPoint:CGPointMake(0.0, 119.0)]],  // iphone6_portrait
    ];
    NSDictionary *override_elemText = [_overrideElementLayoutDescriptors objectForKey:@"text"];
    if ((val = [override_elemText objectForKey:@"layoutDescs"]))
       layoutDescs_elemText = val;
    [self applyLayout:layoutDescs_elemText toView:self.elemText format:format associatedData:nil flowIsHorizontal:flowIsHoriz flowPosPtr:&flowPos];
    

}

static inline NSArray *findLayoutDescForFormat(NSInteger v, NSArray *descs)
{
    for (NSArray *desc in descs) {
        if ([[desc objectAtIndex:0] integerValue] == v)
            return desc;
    }
    return nil;
}

- (void)applyLayout:(NSArray *)layoutDescs toView:(UIView *)view format:(NSInteger)format associatedData:(NSArray *)assocDatas flowIsHorizontal:(BOOL)flowIsH flowPosPtr:(CGFloat *)pFlowPos
{
    NSArray *desc = findLayoutDescForFormat(format, layoutDescs);
    if ( !desc) {
        NSLog(@"no layout desc for this screen format: %@", NSStringFromCGSize([UIScreen mainScreen].bounds.size));
        return;
    }

    CGRect frame = [desc[1] CGRectValue];
    CGPoint layoutOffset = [desc[2] CGPointValue];
    NSDictionary *props = (desc.count > 3) ? desc[3] : nil;

    if ([props[@"fitHeightToContent"] boolValue]) {
        CGRect r = view.frame;
        r.size.width = frame.size.width;
        view.frame = r;
        
        [(id)view sizeToFit];
        
        frame.size.height = view.frame.size.height;

        // If we have a known maximum display size, constrain text to it.
        if (self.maxDisplayHeight > 0.0 && ![props[@"inFlow"] boolValue]) {
            CGFloat maxH = MIN(self.maxDisplayHeight, self.view.bounds.size.height);
            if (frame.size.height > maxH) {
                frame.size.height = maxH;
            }
        }
    }

    // If the view is in the scroll flow, the frame position is computed by
    // applying the layout offset to the accumulated 'flowPos' value.
    if ([props[@"inFlow"] boolValue]) {
        BOOL floats = [props[@"floats"] boolValue];
        if (flowIsH) {
            frame.origin.x = *pFlowPos + layoutOffset.x;
            if ( !floats) *pFlowPos = frame.origin.x + frame.size.width;
        } else {
            frame.origin.y = *pFlowPos + layoutOffset.y;
            if ( !floats) *pFlowPos = frame.origin.y + frame.size.height;
        }
    }
    
    view.frame = frame;

    NSArray *assocData = findLayoutDescForFormat(format, assocDatas);
    if (assocData.count > 1) {
        NSDictionary *dict = assocData[1];
        for (NSString *key in dict) {
            @try {
                [view setValue:[dict objectForKey:key] forKey:key];
            } @catch (id exc) {
                NSLog(@"%s: %@", __func__, exc);
            }
        }
    }
}

+ (void)applyFadeMaskToLabel:(UITextView *)label
{
    CGRect textBounds = [label.attributedText boundingRectWithSize:CGSizeMake(label.bounds.size.width, 0) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    if (textBounds.size.height > label.bounds.size.height) {
        if ( !label.layer.mask) {
            label.layer.mask = [CAGradientLayer layer];
        }
        CAGradientLayer *fadeMask = (CAGradientLayer *)label.layer.mask;
    // determine bounds matching visible text content
    textBounds = [label.attributedText boundingRectWithSize:label.bounds.size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
        fadeMask.frame = textBounds;
        fadeMask.colors = @[(id)[UIColor whiteColor].CGColor, (id)[UIColor clearColor].CGColor];
        fadeMask.startPoint = CGPointMake(0.5, 0.5);
        fadeMask.endPoint = CGPointMake(0.5, 1.0);
    } else {
        label.layer.mask = nil;
    }
}

@end
