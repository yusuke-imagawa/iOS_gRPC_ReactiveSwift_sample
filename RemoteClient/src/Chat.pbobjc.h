// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: chat.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers.h>
#else
 #import "GPBProtocolBuffers.h"
#endif

#if GOOGLE_PROTOBUF_OBJC_VERSION < 30002
#error This file was generated by a newer version of protoc which is incompatible with your Protocol Buffer library sources.
#endif
#if 30002 < GOOGLE_PROTOBUF_OBJC_MIN_SUPPORTED_VERSION
#error This file was generated by an older version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

@class ChatMessage;
@class GPBTimestamp;
@class User;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - ChatRoot

/**
 * Exposes the extension registry for this file.
 *
 * The base class provides:
 * @code
 *   + (GPBExtensionRegistry *)extensionRegistry;
 * @endcode
 * which is a @c GPBExtensionRegistry that includes all the extensions defined by
 * this file and all files that it depends on.
 **/
@interface ChatRoot : GPBRootObject
@end

#pragma mark - SendMessageRequest

typedef GPB_ENUM(SendMessageRequest_FieldNumber) {
  SendMessageRequest_FieldNumber_ToUserId = 1,
  SendMessageRequest_FieldNumber_Message = 2,
};

@interface SendMessageRequest : GPBMessage

@property(nonatomic, readwrite) int64_t toUserId;

@property(nonatomic, readwrite, copy, null_resettable) NSString *message;

@end

#pragma mark - ReceiveMessageResponse

typedef GPB_ENUM(ReceiveMessageResponse_FieldNumber) {
  ReceiveMessageResponse_FieldNumber_ChatMessage = 1,
  ReceiveMessageResponse_FieldNumber_FromUser = 2,
  ReceiveMessageResponse_FieldNumber_ToUser = 3,
};

@interface ReceiveMessageResponse : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) ChatMessage *chatMessage;
/** Test to see if @c chatMessage has been set. */
@property(nonatomic, readwrite) BOOL hasChatMessage;

@property(nonatomic, readwrite, strong, null_resettable) User *fromUser;
/** Test to see if @c fromUser has been set. */
@property(nonatomic, readwrite) BOOL hasFromUser;

@property(nonatomic, readwrite, strong, null_resettable) User *toUser;
/** Test to see if @c toUser has been set. */
@property(nonatomic, readwrite) BOOL hasToUser;

@end

#pragma mark - AllChatMessageRequest

typedef GPB_ENUM(AllChatMessageRequest_FieldNumber) {
  AllChatMessageRequest_FieldNumber_MinMessageId = 1,
};

@interface AllChatMessageRequest : GPBMessage

@property(nonatomic, readwrite) int64_t minMessageId;

@end

#pragma mark - AllChatMessageResponse

typedef GPB_ENUM(AllChatMessageResponse_FieldNumber) {
  AllChatMessageResponse_FieldNumber_UsersArray = 1,
  AllChatMessageResponse_FieldNumber_MessagesArray = 2,
};

@interface AllChatMessageResponse : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<User*> *usersArray;
/** The number of items in @c usersArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger usersArray_Count;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<ChatMessage*> *messagesArray;
/** The number of items in @c messagesArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger messagesArray_Count;

@end

#pragma mark - ChatMessage

typedef GPB_ENUM(ChatMessage_FieldNumber) {
  ChatMessage_FieldNumber_Id_p = 1,
  ChatMessage_FieldNumber_FromUserId = 2,
  ChatMessage_FieldNumber_ToUserId = 3,
  ChatMessage_FieldNumber_Message = 4,
  ChatMessage_FieldNumber_Date = 5,
};

@interface ChatMessage : GPBMessage

@property(nonatomic, readwrite) int64_t id_p;

@property(nonatomic, readwrite) int64_t fromUserId;

@property(nonatomic, readwrite) int64_t toUserId;

@property(nonatomic, readwrite, copy, null_resettable) NSString *message;

@property(nonatomic, readwrite, strong, null_resettable) GPBTimestamp *date;
/** Test to see if @c date has been set. */
@property(nonatomic, readwrite) BOOL hasDate;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
