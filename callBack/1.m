//
//  main.m
//  callBack
//
//  Created by ALS on 07/05/14.
//  Copyright (c) 2014 Cotrim. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Logger.h"
int main(int argc, char *argv[])
{
    
    Logger *log = [[Logger alloc] init];
//    NSTimer *timer = [NSTimer
//                      scheduledTimerWithTimeInterval:2.0
//                      target: log
//                      selector:@selector(updateLastTime:)
//                      userInfo:nil
//                      repeats:YES];
//    [[NSRunLoop currentRunLoop] run];
    
//    NSURL *url = [NSURL URLWithString:@"http://habitrpg.com"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    __unused NSURLConnection *fetchConn = [[NSURLConnection alloc]
//                                           initWithRequest:request
//                                           delegate:log
//                                           startImmediately:YES];
//    __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:log selector:@selector(updateLastTime:) userInfo:nil repeats:YES];
    [[NSNotificationCenter defaultCenter]
    addObserver:log
     selector:@selector(zoneChange:)
     name:NSSystemTimeZoneDidChangeNotification
     object:nil];
    
    [[NSRunLoop currentRunLoop] run];

    return NSApplicationMain(argc, (const char **)argv);
}
