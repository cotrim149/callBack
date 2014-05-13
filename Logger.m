//
//  Logger.m
//  callBack
//
//  Created by ALS on 07/05/14.
//  Copyright (c) 2014 Cotrim. All rights reserved.
//

#import "Logger.h"

@implementation Logger

-(NSString *) lastTimeString{
    static NSDateFormatter *dateFormatter = nil;
    if(!dateFormatter){
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"Formato criado!");
    }
    return [dateFormatter stringFromDate:self.lastTime];
}

-(void) updateLastTime:(NSTimer *)t{
    NSDate *now = [NSDate date];
    [self setLastTime:now];
    NSLog(@"tempo de %@",self.lastTimeString);
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    if(!_incomingData){
        _incomingData = [[NSMutableData alloc] init];
    }
    [_incomingData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"Pegou tudo");
    NSString *string = [[NSString alloc] initWithData:_incomingData encoding:NSUTF8StringEncoding];
    
    _incomingData = nil;
    
    NSLog(@"ele tem %lu de caracteres",[string length]);
    
    NSLog(@"toda string %@",string);
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"A conexao falhou %@",[error localizedDescription]);
    _incomingData = nil;
}

-(void)zoneChange:(NSNotification *)note{
    NSLog(@"O fuso horario foi mudado!");
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
