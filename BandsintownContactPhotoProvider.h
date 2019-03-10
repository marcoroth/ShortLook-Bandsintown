#import "ShortLook-API.h"

@interface BandsintownContactPhotoProvider : NSObject <DDNotificationContactPhotoProviding>
  - (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification;
@end
