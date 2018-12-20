//
//  NSDate+JAExt.h
//  WeiboByMing
//
//  Created by Jamie on 16/1/13.
//  Copyright © 2016年 Jamie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (JAExt)


-(NSString *)getDateNumStr;

-(NSString *)getDateStr;

/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为前天
 */
- (BOOL)isBeforeYesterday;
/**
 *  是否为3-9天内
 */
- (BOOL)isThreeToNineDay;

/**
 *  距离现在5分钟以内

 */
-(BOOL)isInFiveMinute;
/**
 * 距今日的时间天数
 */
- (NSInteger)fewDaysFromToday;
/**
 *  是否为今年
 */
- (BOOL)isThisYear;

/**
 *  距离现在一个小时以内

 */
-(BOOL)isInAnHour;

/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)dateWithYMD;

/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow;

/**
 计算与当前时间的时间间隔天数
 */
-(NSInteger)getTimeIntervalDays:(NSString *)timeStr;

/**
 计算与当前时间的时间间隔秒
 */
-(NSInteger )getTimeIntervalSecond:(NSString *)timeStr;

/**计算开始到结束的时间长度*/
- (NSInteger)getTimeIntervalSecondsStart:(NSString *)startTime stopTime:(NSString *)stopTime;
//获取时间戳
- (NSString *)getTimeStampStr;

//获取当前时间到过去五分钟时间内的随机时间戳
- (NSString *)getrandomTime;

/**
 获取一个位于开始和结束时间段内的随机时间戳
 */
- (NSString *)getTimeStampForStartTime:(NSString *)startTime stopTime:(NSString *)stopTime;

//获取某个格式的字符串
-(NSString *)GetNSStringWithFormat:(NSString *)Format;


@end
