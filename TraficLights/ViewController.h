//
//  ViewController.h
//  TraficLights
//
//  Created by Krystian Grabowy on 01/04/2022.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSTimer *timer;
    NSTimer *scoreTimer;
    
    int timerInt;
    int scoreInt;
}

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIImageView *imageViewTrafficLights;
@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UILabel *label;

@end

