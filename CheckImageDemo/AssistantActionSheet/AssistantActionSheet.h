/*
 地址：
 描述：  仿照微信封装的ActionSheet控件,支持横竖屏切换,视图直接放置于keyWindow上
 */

#import <UIKit/UIKit.h>
@class AssistantActionSheet;

/**
 * block回调
 *
 * @param actionSheet AssistantActionSheet对象自身
 * @param index       被点击按钮标识,取消: 0, 删除: -1, 其他: 1.2.3...
 */
typedef void(^AssistantActionSheetBlock)(AssistantActionSheet *actionSheet, NSInteger index);

@interface AssistantActionSheet : UIView

/**
 * 创建AssistantActionSheet对象
 *
 * @param title                  提示文本
 * @param cancelButtonTitle      取消按钮文本
 * @param destructiveButtonTitle 删除按钮文本
 * @param otherButtonTitles      其他按钮文本
 * @param actionSheetBlock                  block回调
 *
 * @return AssistantActionSheet对象
 */
- (instancetype)initWithTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
       destructiveButtonTitle:(NSString *)destructiveButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
                      handler:(AssistantActionSheetBlock)actionSheetBlock NS_DESIGNATED_INITIALIZER;

/**
 * 创建AssistantActionSheet对象(便利构造器)
 *
 * @param title                  提示文本
 * @param cancelButtonTitle      取消按钮文本
 * @param destructiveButtonTitle 删除按钮文本
 * @param otherButtonTitles      其他按钮文本
 * @param actionSheetBlock                  block回调
 *
 * @return AssistantActionSheet对象
 */
+ (instancetype)actionSheetWithTitle:(NSString *)title
                   cancelButtonTitle:(NSString *)cancelButtonTitle
              destructiveButtonTitle:(NSString *)destructiveButtonTitle
                   otherButtonTitles:(NSArray *)otherButtonTitles
                             handler:(AssistantActionSheetBlock)actionSheetBlock;

/**
 * 弹出AssistantActionSheet视图
 *
 * @param title                  提示文本
 * @param cancelButtonTitle      取消按钮文本
 * @param destructiveButtonTitle 删除按钮文本
 * @param otherButtonTitles      其他按钮文本
 * @param actionSheetBlock                  block回调
 *
 * @return AssistantActionSheet对象
 */
+ (void)showActionSheetWithTitle:(NSString *)title
               cancelButtonTitle:(NSString *)cancelButtonTitle
          destructiveButtonTitle:(NSString *)destructiveButtonTitle
               otherButtonTitles:(NSArray *)otherButtonTitles
                         handler:(AssistantActionSheetBlock)actionSheetBlock;

/**
 * 弹出视图
 */
- (void)show;

@end
