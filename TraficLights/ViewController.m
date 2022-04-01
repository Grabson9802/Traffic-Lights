//
//  ViewController.m
//  TraficLights
//
//  Created by Krystian Grabowy on 01/04/2022.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageView = [[UIImageView alloc]init];
    _imageViewTrafficLights = [[UIImageView alloc]init];
    _button = [[UIButton alloc]init];
    _label = [[UILabel alloc]init];
    
    [self.view addSubview:_imageView];
    [self.view addSubview:_imageViewTrafficLights];
    [self.view addSubview:_button];
    [self.view addSubview:_label];
    
    [self setupImageView];
    [self setupImageViewTrafficLights];
    [self setupButton];
    [self setupLabel];
    
    scoreInt = 0;
    self.label.text = [NSString stringWithFormat:@"%i", scoreInt];
}

-(void) setupImageView {
    _imageView.translatesAutoresizingMaskIntoConstraints = false;
    [_imageView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [_imageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [_imageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [_imageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    
    _imageView.image = [UIImage imageNamed:@"Background"];
    _imageView.clipsToBounds = YES;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
}

-(void) setupImageViewTrafficLights {
    _imageViewTrafficLights.translatesAutoresizingMaskIntoConstraints = false;
    [_imageViewTrafficLights.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
    [_imageViewTrafficLights.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [_imageViewTrafficLights.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [_imageViewTrafficLights.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:0.3].active = YES;
    
    _imageViewTrafficLights.image = [UIImage imageNamed:@"trafficLight"];
    _imageViewTrafficLights.contentMode = UIViewContentModeScaleAspectFit;
}

-(void) setupButton {
    _button.translatesAutoresizingMaskIntoConstraints = NO;
    [_button.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
    [_button.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:0.3].active = YES;
    [_button.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:0.7].active = YES;
    [_button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    
    [_button setBackgroundImage:[UIImage imageNamed:@"stopButton"] forState:UIControlStateNormal];
    [_button setTitle:@"Start" forState:UIControlStateNormal];
    _button.titleLabel.font = [UIFont systemFontOfSize:50];
    
    [_button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonPressed:(id)sender {
    
    if (scoreInt == 0) {
        timerInt = 3;
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startTimer:) userInfo:nil repeats:YES];
        
        self.label.text = [NSString stringWithFormat:@"%i", scoreInt];
        self.button.enabled = NO;
        [self.button setTitle:@"" forState:UIControlStateNormal];
        
    } else {
        [scoreTimer invalidate];
        [_button setTitle:@"Restart" forState:UIControlStateNormal];
    }
    
    if (timerInt == 0) {
        scoreInt = 0;
        timerInt = 3;
    }
}

-(void)startTimer:(id)sender {
    timerInt -= 1;
    
    if (timerInt == 2) {
        self.imageViewTrafficLights.image = [UIImage imageNamed:@"trafficLight3"];
    } else if (timerInt == 1) {
        self.imageViewTrafficLights.image = [UIImage imageNamed:@"trafficLight2"];
    } else if (timerInt == 0) {
        self.imageViewTrafficLights.image = [UIImage imageNamed:@"trafficLight1"];
        
        [timer invalidate];
        
        scoreTimer = [NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(scoreCounter:) userInfo:nil repeats:YES];
        
        [self.button setTitle:@"Stop" forState:UIControlStateNormal];
        self.button.enabled = YES;
    }
}

-(void)scoreCounter:(id)sender {
    scoreInt += 1;
    self.label.text = [NSString stringWithFormat:@"%i", scoreInt];
}

-(void) setupLabel {
    _label.translatesAutoresizingMaskIntoConstraints = false;
    [_label.topAnchor constraintEqualToAnchor:_imageViewTrafficLights.bottomAnchor constant:10].active = YES;
    [_label.bottomAnchor constraintEqualToAnchor:_button.topAnchor constant:-10].active = YES;
    [_label.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [_label.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    
    [_label setText:@"0"];
    [_label setFont:[UIFont fontWithName:@"Avenir Next Heavy" size:100]];
    _label.textAlignment = NSTextAlignmentCenter;
    [_label setTextColor:UIColor.whiteColor];
}

@end
