#import "Thumbnailer.h"
#import <React/RCTLog.h>
#include <AVFoundation/AVFoundation.h>

@implementation Thumbnailer

RCT_EXPORT_MODULE()

// Example method
// See // https://facebook.github.io/react-native/docs/native-modules-ios
RCT_REMAP_METHOD(multiply,
                 multiplyWithA:(nonnull NSNumber*)a withB:(nonnull NSNumber*)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
  NSNumber *result = @([a floatValue] * [b floatValue]);

  resolve(result);
}

RCT_EXPORT_METHOD(getThumbnail: (NSString *)originalVideoUrl callback:(RCTResponseSenderBlock)callback)
{
        NSString *videoURL = originalVideoUrl;
        NSURL *url = [NSURL URLWithString:videoURL];
        AVAsset *asset = [AVAsset assetWithURL:url];
        AVAssetImageGenerator *imageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
        CMTime time = [asset duration];
        time.value = 0;
        CGImageRef imageRef = [imageGenerator copyCGImageAtTime:time actualTime:NULL error:NULL];
        UIImage *thumbnail = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        
        NSData *data = UIImageJPEGRepresentation(thumbnail, 1.0);
        NSUInteger *size = data.length;
        NSFileManager *fileManager = [NSFileManager defaultManager];         
        NSString *tmpDirectory = NSTemporaryDirectory();
        NSString *fullPath = [tmpDirectory stringByAppendingPathComponent:@"dickpic.png"];
        [fileManager createFileAtPath:fullPath contents:data attributes:nil];        
        
        
        NSDictionary *dict = @{
          @"uri":fullPath,
          @"size": [NSNumber numberWithUnsignedInteger:data.length]
        };
        
        return callback(@[[NSNull null], dict]); 
}

@end
