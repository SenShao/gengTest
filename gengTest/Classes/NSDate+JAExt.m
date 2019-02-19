//
//  NSDate+JAExt.m
//  WeiboByMing
//
//  Created by Jamie on 16/1/13.
//  Copyright © 2016年 Jamie. All rights reserved.
//

#import "NSDate+JAExt.h"

@implementation NSDate (JAExt)


-(NSString *)getDateNumStr
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    
    NSString *strDate = [dateFormatter stringFromDate:self];
    
    return strDate;
}


-(NSString *)getDateStr
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *strDate = [dateFormatter stringFromDate:self];
    
    return strDate;
}

/**
 计算与当前时间的时间间隔天数
 */
-(NSInteger )getTimeIntervalDays:(NSString *)timeStr
{
    NSString *currentTime = [self getTimeStampStr];
    NSInteger currentTimeInt = [currentTime integerValue];
    NSInteger timestrInt = [timeStr integerValue];
    NSInteger days = (currentTimeInt - timestrInt)/60/60/24;
    return days;
}

/**
 计算与当前时间的时间间隔秒
 */
-(NSInteger )getTimeIntervalSecond:(NSString *)timeStr
{
    if (!timeStr) {
        return 0;
    }
    NSString *currentTime = [self getTimeStampStr];
    NSInteger currentTimeInt = [currentTime integerValue];
    NSInteger timestrInt = [timeStr integerValue];
    NSInteger days = (currentTimeInt - timestrInt);
    return days;
}
/**计算开始到结束的时间长度*/
- (NSInteger)getTimeIntervalSecondsStart:(NSString *)startTime stopTime:(NSString *)stopTime
{
    
    NSInteger startTimeInt = [startTime integerValue];
    NSInteger stopTimeInt = [stopTime integerValue];
    NSInteger senconds = (stopTimeInt - startTimeInt);
    
    return senconds;
}
//获取时间戳
- (NSString *)getTimeStampStr
{
    UInt64 timeDate = [[NSDate date] timeIntervalSince1970];
    return [NSString stringWithFormat:@"%llu",timeDate];
}
/**
 *  是否为今天
 */
- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return
    (selfCmps.year == nowCmps.year) &&
    (selfCmps.month == nowCmps.month) &&
    (selfCmps.day == nowCmps.day);
}

/**
 *  距离现在5分钟以内
 
 */
-(BOOL)isInFiveMinute{
    
    NSTimeInterval lasttimeInterval = [self timeIntervalSince1970];
    
    NSTimeInterval NowtimeInterval = [[NSDate date] timeIntervalSince1970];
    
    NSTimeInterval DistanceTime = NowtimeInterval -lasttimeInterval;
    
    if (DistanceTime<=60.0*5.00) {
        
        return YES;
        
    }
    else{
        
        return NO;
        
    }
    
}


/**
 *  距离现在一个小时以内
 
 */
-(BOOL)isInAnHour{
    
    NSTimeInterval lasttimeInterval = [self timeIntervalSince1970];
    
    NSTimeInterval NowtimeInterval = [[NSDate date] timeIntervalSince1970];

    NSTimeInterval DistanceTime = NowtimeInterval -lasttimeInterval;
    
    
    if (DistanceTime<60.0*60.0) {
        
        return YES;
        
    }
    else{
        
        return NO;
        
    }

}

/**
 *  是否为昨天
 */
- (BOOL)isYesterday
{
    // 2014-05-01
    NSDate *nowDate = [[NSDate date] dateWithYMD];
    
    // 2014-04-30
    NSDate *selfDate = [self dateWithYMD];
    
    // 获得nowDate和selfDate的差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    return cmps.day == 1;
}
/**
 *  是否为前天
 */
- (BOOL)isBeforeYesterday
{
    // 2014-05-01
    NSDate *nowDate = [[NSDate date] dateWithYMD];
    
    // 2014-04-30
    NSDate *selfDate = [self dateWithYMD];
    
    // 获得nowDate和selfDate的差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    return cmps.day == 2;
}
/**
 *  是否为3-9天内
 */
- (BOOL)isThreeToNineDay
{
    // 2014-05-01
    NSDate *nowDate = [[NSDate date] dateWithYMD];
    
    // 2014-04-30
    NSDate *selfDate = [self dateWithYMD];
    
    // 获得nowDate和selfDate的差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    if (cmps.day <= 9 && cmps.day >= 3)  return YES;
    return NO;
}
/**
 * 距今日的时间天数
 */
- (NSInteger)fewDaysFromToday
{
    // 2014-05-01
    NSDate *nowDate = [[NSDate date] dateWithYMD];
    
    // 2014-04-30
    NSDate *selfDate = [self dateWithYMD];
    
    // 获得nowDate和selfDate的差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    return cmps.day;
}

- (NSDate *)dateWithYMD
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}

/**
 *  是否为今年
 */
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year;
}

- (NSString *)getrandomTime
{
    NSDate *returnDate;
    NSDate *nowDate = [NSDate date];
    
    NSInteger randomNum =  1 + (arc4random() % 6);//随机一个时间(单位:分钟) 1-5之内
    returnDate = [NSDate dateWithTimeInterval:randomNum * 60 sinceDate:nowDate];
    
    UInt64 timeDate = [returnDate timeIntervalSince1970];
    timeDate = timeDate - 300;
    return [NSString stringWithFormat:@"%llu",timeDate];
}



/**
 获取一个位于开始和结束时间段内的随机时间戳
 */
- (NSString *)getTimeStampForStartTime:(NSString *)startTime stopTime:(NSString *)stopTime
{
    NSInteger startTimeInt = [startTime integerValue];
    NSInteger stopTimeInt = [stopTime integerValue];
    NSInteger senconds = (stopTimeInt - startTimeInt);

    NSInteger randomNum = senconds <  3 ? 1 : arc4random() % senconds;
    NSInteger random = randomNum + startTimeInt;
    return [NSString stringWithFormat:@"%zd",random];
}

- (NSDateComponents *)deltaWithNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}

//获取某个格式的字符串
-(NSString *)GetNSStringWithFormat:(NSString *)Format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:Format];
    return [formatter stringFromDate:self];

}

@end
