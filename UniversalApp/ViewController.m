//
//  ViewController.m
//  UniversalApp
//
//  Created by Seba on 19/7/16.
//  Copyright © 2016 Seba. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelDispositivo;

@property (weak, nonatomic) IBOutlet UILabel *labelSizeDispositivo;

@property (weak, nonatomic) IBOutlet UILabel *labelTipoDispositivo;

@property (weak, nonatomic) IBOutlet UILabel *LabelBattery;



@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
}
-(void) viewWillAppear:(BOOL)animated{
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad){
        _labelDispositivo.text =[ _labelDispositivo.text stringByAppendingString: @" IPAD" ];
    }else{
        _labelDispositivo.text =[ _labelDispositivo.text stringByAppendingString: @" IPHONE" ];
        
    }
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    NSString * string = [NSString stringWithFormat: @" %i %@ %i", [[[NSNumber alloc]  initWithLong:rect.size.width ] intValue ] , @" x ", [[[NSNumber alloc]  initWithLong:rect.size.height ] intValue ]];
    _labelSizeDispositivo.text = string ;
    
    
    UIDevice *miDispositivo = [UIDevice currentDevice];
    NSLog(@"%@ es un %@ con la versión %@ de iOS", [miDispositivo name], [miDispositivo model], [miDispositivo systemVersion]);

    _labelTipoDispositivo.text =[NSString stringWithFormat: @" %@ %@ %@ %@ %@ %@", [miDispositivo name ] , @" es un ", [miDispositivo model], @" con la versión ", [miDispositivo systemName] , [miDispositivo systemVersion]     ];

    
    NSString *stringCargaBatery = nil;

    NSString *stringStateBatery = nil;
    if([miDispositivo batteryState] ==  UIDeviceBatteryStateUnknown ){
        stringStateBatery = @"Estado bateria desconocida";
        stringCargaBatery = @" ";

    }else if([miDispositivo batteryState]  ==  UIDeviceBatteryStateUnplugged ){
        stringStateBatery = @"Estado bateria desconectada";
        stringCargaBatery = [NSString stringWithFormat: @"%f", ([miDispositivo batteryLevel] * 100.0f)];

    }else if([miDispositivo batteryState] ==  UIDeviceBatteryStateCharging ){
        stringStateBatery = @"Estado bateria cargando menos 100 %";
        stringCargaBatery = [NSString stringWithFormat: @"%f", ([miDispositivo batteryLevel] * 100.0f)];

    }else if([miDispositivo batteryState] ==  UIDeviceBatteryStateFull ){
        stringStateBatery = @"Estado bateria cargando en 100 %";
        stringCargaBatery = [NSString stringWithFormat: @"%f", ([miDispositivo batteryLevel] * 100.0f)];

        
    }
    
    _LabelBattery.text = [NSString stringWithFormat: @"%@ %@", stringCargaBatery , stringStateBatery];



}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
