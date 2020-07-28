#if !defined(GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO) || !GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO
#import "Calling.pbobjc.h"
#endif

#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
#import <ProtoRPC/ProtoService.h>
#import <ProtoRPC/ProtoRPCLegacy.h>
#import <RxLibrary/GRXWriteable.h>
#import <RxLibrary/GRXWriter.h>
#endif

@class ContinueCallingRequest;
@class EndCallingRequest;
@class GPBEmpty;
@class ReceiveCallingRequest;
@class StartCallingRequest;
@class StartCallingResponse;
@class StatusResponse;

#if !defined(GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO) || !GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO
#if defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS) && GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
  #import <Protobuf/Empty.pbobjc.h>
#else
  #import "google/protobuf/Empty.pbobjc.h"
#endif
#endif

@class GRPCUnaryProtoCall;
@class GRPCStreamingProtoCall;
@class GRPCCallOptions;
@protocol GRPCProtoResponseHandler;
@class GRPCProtoCall;


NS_ASSUME_NONNULL_BEGIN

@protocol CallingService2 <NSObject>

#pragma mark StartCalling(StartCallingRequest) returns (StartCallingResponse)

/**
 * 通話を掛ける。
 */
- (GRPCUnaryProtoCall *)startCallingWithMessage:(StartCallingRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark ReceiveCalling(ReceiveCallingRequest) returns (Empty)

/**
 * 通話を受ける。
 */
- (GRPCUnaryProtoCall *)receiveCallingWithMessage:(ReceiveCallingRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark EndCalling(EndCallingRequest) returns (Empty)

/**
 * 通話を切る。
 */
- (GRPCUnaryProtoCall *)endCallingWithMessage:(EndCallingRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark ContinueCalling(ContinueCallingRequest) returns (Empty)

/**
 * 通話が継続していることを記録
 */
- (GRPCUnaryProtoCall *)continueCallingWithMessage:(ContinueCallingRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark ReceiveCallingStatus(Empty) returns (stream StatusResponse)

/**
 * 通話 / ステータス受信　ステータス: 開始、通話中、終了
 * ・ステータスの変更時に受信する。
 * ・clientからの接続時にも受信する。
 */
- (GRPCUnaryProtoCall *)receiveCallingStatusWithMessage:(GPBEmpty *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

@end

/**
 * The methods in this protocol belong to a set of old APIs that have been deprecated. They do not
 * recognize call options provided in the initializer. Using the v2 protocol is recommended.
 */
@protocol CallingService <NSObject>

#pragma mark StartCalling(StartCallingRequest) returns (StartCallingResponse)

/**
 * 通話を掛ける。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)startCallingWithRequest:(StartCallingRequest *)request handler:(void(^)(StartCallingResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * 通話を掛ける。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToStartCallingWithRequest:(StartCallingRequest *)request handler:(void(^)(StartCallingResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark ReceiveCalling(ReceiveCallingRequest) returns (Empty)

/**
 * 通話を受ける。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)receiveCallingWithRequest:(ReceiveCallingRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler;

/**
 * 通話を受ける。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToReceiveCallingWithRequest:(ReceiveCallingRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler;


#pragma mark EndCalling(EndCallingRequest) returns (Empty)

/**
 * 通話を切る。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)endCallingWithRequest:(EndCallingRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler;

/**
 * 通話を切る。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToEndCallingWithRequest:(EndCallingRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler;


#pragma mark ContinueCalling(ContinueCallingRequest) returns (Empty)

/**
 * 通話が継続していることを記録
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)continueCallingWithRequest:(ContinueCallingRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler;

/**
 * 通話が継続していることを記録
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToContinueCallingWithRequest:(ContinueCallingRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler;


#pragma mark ReceiveCallingStatus(Empty) returns (stream StatusResponse)

/**
 * 通話 / ステータス受信　ステータス: 開始、通話中、終了
 * ・ステータスの変更時に受信する。
 * ・clientからの接続時にも受信する。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)receiveCallingStatusWithRequest:(GPBEmpty *)request eventHandler:(void(^)(BOOL done, StatusResponse *_Nullable response, NSError *_Nullable error))eventHandler;

/**
 * 通話 / ステータス受信　ステータス: 開始、通話中、終了
 * ・ステータスの変更時に受信する。
 * ・clientからの接続時にも受信する。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToReceiveCallingStatusWithRequest:(GPBEmpty *)request eventHandler:(void(^)(BOOL done, StatusResponse *_Nullable response, NSError *_Nullable error))eventHandler;


@end


#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
/**
 * Basic service implementation, over gRPC, that only does
 * marshalling and parsing.
 */
@interface CallingService : GRPCProtoService<CallingService2, CallingService>
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions NS_DESIGNATED_INITIALIZER;
+ (instancetype)serviceWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions;
// The following methods belong to a set of old APIs that have been deprecated.
- (instancetype)initWithHost:(NSString *)host;
+ (instancetype)serviceWithHost:(NSString *)host;
@end
#endif

NS_ASSUME_NONNULL_END

