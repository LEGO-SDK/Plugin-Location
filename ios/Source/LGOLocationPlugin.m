//
//  LGOLocationPlugin.m
//  plugin

#import "LGOLocationPlugin.h"
#import <LEGO-SDK/LGOCore.h>

@interface LGOLocationRequest: LGORequest

@property (nonatomic, strong) NSString *precision;

@end

@implementation LGOLocationRequest

@end

@interface LGOLocationResponse: LGOResponse

@property (nonatomic, strong) NSString *location;

@end

@implementation LGOLocationResponse

- (NSDictionary *)resData {
    return @{
             @"location": self.location ?: @"",
             };
}

@end

@interface LGOLocationperation: LGORequestable

@property (nonatomic, strong) LGOLocationRequest *request;

@end

@implementation LGOLocationperation

- (LGOResponse *)requestSynchronize {
    return [[LGOLocationResponse new] accept:nil];
}

- (void)requestAsynchronize:(LGORequestableAsynchronizeBlock)callbackBlock {
    callbackBlock([self requestSynchronize]);
}

@end

@implementation LGOLocationPlugin

- (LGORequestable *)buildWithDictionary:(NSDictionary *)dictionary context:(LGORequestContext *)context {
    LGOLocationperation *operation = [LGOLocationperation new];
    operation.request = [LGOLocationRequest new];
    operation.request.precision = [dictionary[@"precision"] isKindOfClass:[NSString class]] ? dictionary[@"precision"] : nil;
    return operation;
}

- (LGORequestable *)buildWithRequest:(LGORequest *)request {
    if ([request isKindOfClass:[LGOLocationRequest class]]) {
        LGOLocationperation *operation = [LGOLocationperation new];
        operation.request = (LGOLocationRequest *)request;
        return operation;
    }
    return nil;
}

+ (void)load {
    [[LGOCore modules] addModuleWithName:@"Native.Location" instance:[self new]];
}

@end
