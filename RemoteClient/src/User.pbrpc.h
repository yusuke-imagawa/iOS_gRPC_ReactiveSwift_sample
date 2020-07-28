#if !defined(GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO) || !GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO
#import "User.pbobjc.h"
#endif

#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
#import <ProtoRPC/ProtoService.h>
#import <ProtoRPC/ProtoRPCLegacy.h>
#import <RxLibrary/GRXWriteable.h>
#import <RxLibrary/GRXWriter.h>
#endif

@class GetUserRequest;
@class GetUserResponse;
@class GetUsersRequest;
@class GetUsersResponse;

#if !defined(GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO) || !GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO
#if defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS) && GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
  #import <Protobuf/Timestamp.pbobjc.h>
#else
  #import "google/protobuf/Timestamp.pbobjc.h"
#endif
#if defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS) && GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
  #import <Protobuf/Wrappers.pbobjc.h>
#else
  #import "google/protobuf/Wrappers.pbobjc.h"
#endif
  #import "Commons.pbobjc.h"
#endif

@class GRPCUnaryProtoCall;
@class GRPCStreamingProtoCall;
@class GRPCCallOptions;
@protocol GRPCProtoResponseHandler;
@class GRPCProtoCall;


NS_ASSUME_NONNULL_BEGIN

@protocol UserService2 <NSObject>

#pragma mark GetUsers(GetUsersRequest) returns (GetUsersResponse)

/**
 * ユーザーのリスト取得
 */
- (GRPCUnaryProtoCall *)getUsersWithMessage:(GetUsersRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark GetUserById(GetUserRequest) returns (GetUserResponse)

/**
 * 指定したidのユーザーを取得
 */
- (GRPCUnaryProtoCall *)getUserByIdWithMessage:(GetUserRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

@end

/**
 * The methods in this protocol belong to a set of old APIs that have been deprecated. They do not
 * recognize call options provided in the initializer. Using the v2 protocol is recommended.
 */
@protocol UserService <NSObject>

#pragma mark GetUsers(GetUsersRequest) returns (GetUsersResponse)

/**
 * ユーザーのリスト取得
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getUsersWithRequest:(GetUsersRequest *)request handler:(void(^)(GetUsersResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * ユーザーのリスト取得
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetUsersWithRequest:(GetUsersRequest *)request handler:(void(^)(GetUsersResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark GetUserById(GetUserRequest) returns (GetUserResponse)

/**
 * 指定したidのユーザーを取得
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getUserByIdWithRequest:(GetUserRequest *)request handler:(void(^)(GetUserResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * 指定したidのユーザーを取得
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetUserByIdWithRequest:(GetUserRequest *)request handler:(void(^)(GetUserResponse *_Nullable response, NSError *_Nullable error))handler;


@end


#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
/**
 * Basic service implementation, over gRPC, that only does
 * marshalling and parsing.
 */
@interface UserService : GRPCProtoService<UserService2, UserService>
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions NS_DESIGNATED_INITIALIZER;
+ (instancetype)serviceWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions;
// The following methods belong to a set of old APIs that have been deprecated.
- (instancetype)initWithHost:(NSString *)host;
+ (instancetype)serviceWithHost:(NSString *)host;
@end
#endif

NS_ASSUME_NONNULL_END

