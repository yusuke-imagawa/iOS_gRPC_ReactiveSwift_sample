#if !defined(GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO) || !GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO
#import "Chat.pbobjc.h"
#endif

#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
#import <ProtoRPC/ProtoService.h>
#import <ProtoRPC/ProtoRPCLegacy.h>
#import <RxLibrary/GRXWriteable.h>
#import <RxLibrary/GRXWriter.h>
#endif

@class AllChatMessageRequest;
@class AllChatMessageResponse;
@class GPBEmpty;
@class ReceiveMessageResponse;
@class SendMessageRequest;

#if !defined(GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO) || !GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO
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
#endif

@class GRPCUnaryProtoCall;
@class GRPCStreamingProtoCall;
@class GRPCCallOptions;
@protocol GRPCProtoResponseHandler;
@class GRPCProtoCall;


NS_ASSUME_NONNULL_BEGIN

@protocol ChatService2 <NSObject>

#pragma mark SendMessage(SendMessageRequest) returns (Empty)

/**
 * メッセージ/送信
 */
- (GRPCUnaryProtoCall *)sendMessageWithMessage:(SendMessageRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark ReceiveMessage(Empty) returns (stream ReceiveMessageResponse)

/**
 * メッセージ/受信
 */
- (GRPCUnaryProtoCall *)receiveMessageWithMessage:(GPBEmpty *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark GetAllMessages(AllChatMessageRequest) returns (AllChatMessageResponse)

/**
 * チャット/すべてのメッセージを取得:
 * 想定される呼び出しタイミング: アプリ起動時、ログイン時に呼び出す。
 * メッセージと相手のユーザー情報を取得して、端末のdbを更新する。
 */
- (GRPCUnaryProtoCall *)getAllMessagesWithMessage:(AllChatMessageRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

@end

/**
 * The methods in this protocol belong to a set of old APIs that have been deprecated. They do not
 * recognize call options provided in the initializer. Using the v2 protocol is recommended.
 */
@protocol ChatService <NSObject>

#pragma mark SendMessage(SendMessageRequest) returns (Empty)

/**
 * メッセージ/送信
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)sendMessageWithRequest:(SendMessageRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler;

/**
 * メッセージ/送信
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToSendMessageWithRequest:(SendMessageRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler;


#pragma mark ReceiveMessage(Empty) returns (stream ReceiveMessageResponse)

/**
 * メッセージ/受信
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)receiveMessageWithRequest:(GPBEmpty *)request eventHandler:(void(^)(BOOL done, ReceiveMessageResponse *_Nullable response, NSError *_Nullable error))eventHandler;

/**
 * メッセージ/受信
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToReceiveMessageWithRequest:(GPBEmpty *)request eventHandler:(void(^)(BOOL done, ReceiveMessageResponse *_Nullable response, NSError *_Nullable error))eventHandler;


#pragma mark GetAllMessages(AllChatMessageRequest) returns (AllChatMessageResponse)

/**
 * チャット/すべてのメッセージを取得:
 * 想定される呼び出しタイミング: アプリ起動時、ログイン時に呼び出す。
 * メッセージと相手のユーザー情報を取得して、端末のdbを更新する。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getAllMessagesWithRequest:(AllChatMessageRequest *)request handler:(void(^)(AllChatMessageResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * チャット/すべてのメッセージを取得:
 * 想定される呼び出しタイミング: アプリ起動時、ログイン時に呼び出す。
 * メッセージと相手のユーザー情報を取得して、端末のdbを更新する。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetAllMessagesWithRequest:(AllChatMessageRequest *)request handler:(void(^)(AllChatMessageResponse *_Nullable response, NSError *_Nullable error))handler;


@end


#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
/**
 * Basic service implementation, over gRPC, that only does
 * marshalling and parsing.
 */
@interface ChatService : GRPCProtoService<ChatService2, ChatService>
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions NS_DESIGNATED_INITIALIZER;
+ (instancetype)serviceWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions;
// The following methods belong to a set of old APIs that have been deprecated.
- (instancetype)initWithHost:(NSString *)host;
+ (instancetype)serviceWithHost:(NSString *)host;
@end
#endif

NS_ASSUME_NONNULL_END

