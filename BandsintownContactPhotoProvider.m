#import "BandsintownContactPhotoProvider.h"

@interface UNNotificationAttachment
  -(NSURL *)URL;
@end

@interface UNNotificationContent
  -(NSArray *)attachments;
@end

@interface UNNotificationRequest
  -(UNNotificationContent *)content;
@end

@interface UNNotification
  -(UNNotificationRequest *)request;
@end

@interface NCNotificationRequest
  -(NSString *)threadIdentifier;
  -(UNNotification *)userNotification;
@end


@implementation BandsintownContactPhotoProvider
  - (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification {
    NCNotificationRequest *request = [notification request];
    UNNotification *userNotification = [request userNotification];
    UNNotificationRequest *notificationRequest = [userNotification request];
    UNNotificationContent *content = [notificationRequest content];
    UNNotificationAttachment *attachment = [content attachments][0];
    if (!attachment) return nil;
  
    NSString *imageURL = [attachment URL].path;
    UIImage *image = [UIImage imageWithContentsOfFile:imageURL];

    return [NSClassFromString(@"DDNotificationContactPhotoPromiseOffer") offerInstantlyResolvingPromiseWithPhotoIdentifier:imageURL image:image];
  }
@end
