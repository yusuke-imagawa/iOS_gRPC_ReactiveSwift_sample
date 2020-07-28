#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
#import "Calling.pbrpc.h"
#import "Calling.pbobjc.h"
#import <ProtoRPC/ProtoRPCLegacy.h>
#import <RxLibrary/GRXWriter+Immediate.h>

#if defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS) && GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
#import <Protobuf/Empty.pbobjc.h>
#else
#import "google/protobuf/Empty.pbobjc.h"
#endif

@implementation CallingService

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

// Designated initializer
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [super initWithHost:host
                 packageName:@"calling"
                 serviceName:@"CallingService"
                 callOptions:callOptions];
}

- (instancetype)initWithHost:(NSString *)host {
  return [super initWithHost:host
                 packageName:@"calling"
                 serviceName:@"CallingService"];
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

#pragma mark StartCalling(StartCallingRequest) returns (StartCallingResponse)

/**
 * 通話を掛ける。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)startCallingWithRequest:(StartCallingRequest *)request handler:(void(^)(StartCallingResponse *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToStartCallingWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * 通話を掛ける。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToStartCallingWithRequest:(StartCallingRequest *)request handler:(void(^)(StartCallingResponse *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"StartCalling"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[StartCallingResponse class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * 通話を掛ける。
 */
- (GRPCUnaryProtoCall *)startCallingWithMessage:(StartCallingRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"StartCalling"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[StartCallingResponse class]];
}

#pragma mark ReceiveCalling(ReceiveCallingRequest) returns (Empty)

/**
 * 通話を受ける。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)receiveCallingWithRequest:(ReceiveCallingRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToReceiveCallingWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * 通話を受ける。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToReceiveCallingWithRequest:(ReceiveCallingRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"ReceiveCalling"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[GPBEmpty class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * 通話を受ける。
 */
- (GRPCUnaryProtoCall *)receiveCallingWithMessage:(ReceiveCallingRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"ReceiveCalling"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[GPBEmpty class]];
}

#pragma mark EndCalling(EndCallingRequest) returns (Empty)

/**
 * 通話を切る。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)endCallingWithRequest:(EndCallingRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToEndCallingWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * 通話を切る。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToEndCallingWithRequest:(EndCallingRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"EndCalling"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[GPBEmpty class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * 通話を切る。
 */
- (GRPCUnaryProtoCall *)endCallingWithMessage:(EndCallingRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"EndCalling"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[GPBEmpty class]];
}

#pragma mark ContinueCalling(ContinueCallingRequest) returns (Empty)

/**
 * 通話が継続していることを記録
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)continueCallingWithRequest:(ContinueCallingRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToContinueCallingWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * 通話が継続していることを記録
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToContinueCallingWithRequest:(ContinueCallingRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"ContinueCalling"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[GPBEmpty class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * 通話が継続していることを記録
 */
- (GRPCUnaryProtoCall *)continueCallingWithMessage:(ContinueCallingRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"ContinueCalling"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[GPBEmpty class]];
}

#pragma mark ReceiveCallingStatus(Empty) returns (stream StatusResponse)

/**
 * 通話 / ステータス受信　ステータス: 開始、通話中、終了
 * ・ステータスの変更時に受信する。
 * ・clientからの接続時にも受信する。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)receiveCallingStatusWithRequest:(GPBEmpty *)request eventHandler:(void(^)(BOOL done, StatusResponse *_Nullable response, NSError *_Nullable error))eventHandler{
  [[self RPCToReceiveCallingStatusWithRequest:request eventHandler:eventHandler] start];
}
// Returns a not-yet-started RPC object.
/**
 * 通話 / ステータス受信　ステータス: 開始、通話中、終了
 * ・ステータスの変更時に受信する。
 * ・clientからの接続時にも受信する。
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToReceiveCallingStatusWithRequest:(GPBEmpty *)request eventHandler:(void(^)(BOOL done, StatusResponse *_Nullable response, NSError *_Nullable error))eventHandler{
  return [self RPCToMethod:@"ReceiveCallingStatus"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[StatusResponse class]
        responsesWriteable:[GRXWriteable writeableWithEventHandler:eventHandler]];
}
/**
 * 通話 / ステータス受信　ステータス: 開始、通話中、終了
 * ・ステータスの変更時に受信する。
 * ・clientからの接続時にも受信する。
 */
- (GRPCUnaryProtoCall *)receiveCallingStatusWithMessage:(GPBEmpty *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"ReceiveCallingStatus"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[StatusResponse class]];
}

@end
#endif
