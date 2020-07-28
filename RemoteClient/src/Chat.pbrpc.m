#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
#import "Chat.pbrpc.h"
#import "Chat.pbobjc.h"
#import <ProtoRPC/ProtoRPCLegacy.h>
#import <RxLibrary/GRXWriter+Immediate.h>

#if defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS) && GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
#import <Protobuf/Empty.pbobjc.h>
#else
#import "google/protobuf/Empty.pbobjc.h"
#endif
#if defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS) && GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
#import <Protobuf/Timestamp.pbobjc.h>
#else
#import "google/protobuf/Timestamp.pbobjc.h"
#endif
#import "Commons.pbobjc.h"

@implementation ChatService

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

// Designated initializer
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [super initWithHost:host
                 packageName:@"chat"
                 serviceName:@"ChatService"
                 callOptions:callOptions];
}

- (instancetype)initWithHost:(NSString *)host {
  return [super initWithHost:host
                 packageName:@"chat"
                 serviceName:@"ChatService"];
}

#pragma clang diagnostic pop

// Override superclass initializer to disallow different package and service names.
- (instancetype)initWithHost:(NSString *)host
                 packageName:(NSString *)packageName
                 serviceName:(NSString *)serviceName {
  return [self initWithHost:host];
}

- (instancetype)initWithHost:(NSString *)host
                 packageName:(NSString *)packageName
                 serviceName:(NSString *)serviceName
                 callOptions:(GRPCCallOptions *)callOptions {
  return [self initWithHost:host callOptions:callOptions];
}

#pragma mark - Class Methods

+ (instancetype)serviceWithHost:(NSString *)host {
  return [[self alloc] initWithHost:host];
}

+ (instancetype)serviceWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [[self alloc] initWithHost:host callOptions:callOptions];
}

#pragma mark - Method Implementations

#pragma mark SendMessage(SendMessageRequest) returns (Empty)

/**
 * メッセージ/送信
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)sendMessageWithRequest:(SendMessageRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToSendMessageWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * メッセージ/送信
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToSendMessageWithRequest:(SendMessageRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"SendMessage"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[GPBEmpty class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * メッセージ/送信
 */
- (GRPCUnaryProtoCall *)sendMessageWithMessage:(SendMessageRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"SendMessage"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[GPBEmpty class]];
}

#pragma mark ReceiveMessage(Empty) returns (stream ReceiveMessageResponse)

/**
 * メッセージ/受信
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)receiveMessageWithRequest:(GPBEmpty *)request eventHandler:(void(^)(BOOL done, ReceiveMessageResponse *_Nullable response, NSError *_Nullable error))eventHandler{
  [[self RPCToReceiveMessageWithRequest:request eventHandler:eventHandler] start];
}
// Returns a not-yet-started RPC object.
/**
 * メッセージ/受信
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToReceiveMessageWithRequest:(GPBEmpty *)request eventHandler:(void(^)(BOOL done, ReceiveMessageResponse *_Nullable response, NSError *_Nullable error))eventHandler{
  return [self RPCToMethod:@"ReceiveMessage"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[ReceiveMessageResponse class]
        responsesWriteable:[GRXWriteable writeableWithEventHandler:eventHandler]];
}
/**
 * メッセージ/受信
 */
- (GRPCUnaryProtoCall *)receiveMessageWithMessage:(GPBEmpty *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"ReceiveMessage"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[ReceiveMessageResponse class]];
}

#pragma mark GetAllMessages(AllChatMessageRequest) returns (AllChatMessageResponse)

/**
 * チャット/すべてのメッセージを取得:
 * 想定される呼び出しタイミング: アプリ起動時、ログイン時に呼び出す。
 * メッセージと相手のユーザー情報を取得して、端末のdbを更新する。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getAllMessagesWithRequest:(AllChatMessageRequest *)request handler:(void(^)(AllChatMessageResponse *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToGetAllMessagesWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * チャット/すべてのメッセージを取得:
 * 想定される呼び出しタイミング: アプリ起動時、ログイン時に呼び出す。
 * メッセージと相手のユーザー情報を取得して、端末のdbを更新する。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetAllMessagesWithRequest:(AllChatMessageRequest *)request handler:(void(^)(AllChatMessageResponse *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"GetAllMessages"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[AllChatMessageResponse class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * チャット/すべてのメッセージを取得:
 * 想定される呼び出しタイミング: アプリ起動時、ログイン時に呼び出す。
 * メッセージと相手のユーザー情報を取得して、端末のdbを更新する。
 */
- (GRPCUnaryProtoCall *)getAllMessagesWithMessage:(AllChatMessageRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"GetAllMessages"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[AllChatMessageResponse class]];
}

@end
#endif
