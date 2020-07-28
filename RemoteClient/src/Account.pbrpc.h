#if !defined(GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO) || !GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO
#import "Account.pbobjc.h"
#endif

#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
#import <ProtoRPC/ProtoService.h>
#import <ProtoRPC/ProtoRPCLegacy.h>
#import <RxLibrary/GRXWriteable.h>
#import <RxLibrary/GRXWriter.h>
#endif

@class GPBEmpty;
@class RegisterUserRequest;
@class RegisterUserResponse;
@class UpdateProfileRequest;

#if !defined(GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO) || !GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO
#if defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS) && GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
  #import <Protobuf/Empty.pbobjc.h>
#else
  #import "google/protobuf/Empty.pbobjc.h"
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

@protocol AccountRegisterService2 <NSObject>

#pragma mark Register(RegisterUserRequest) returns (RegisterUserResponse)

/**
 * ユーザー/登録
 */
- (GRPCUnaryProtoCall *)registerWithMessage:(RegisterUserRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

@end

@protocol AccountService2 <NSObject>

#pragma mark UpdateProfile(UpdateProfileRequest) returns (Empty)

/**
 * ユーザー/プロフィール編集
 */
- (GRPCUnaryProtoCall *)updateProfileWithMessage:(UpdateProfileRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark Leave(Empty) returns (Empty)

/**
 * ユーザー/退会
 */
- (GRPCUnaryProtoCall *)leaveWithMessage:(GPBEmpty *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

@end

/**
 * The methods in this protocol belong to a set of old APIs that have been deprecated. They do not
 * recognize call options provided in the initializer. Using the v2 protocol is recommended.
 */
@protocol AccountRegisterService <NSObject>

#pragma mark Register(RegisterUserRequest) returns (RegisterUserResponse)

/**
 * ユーザー/登録
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)registerWithRequest:(RegisterUserRequest *)request handler:(void(^)(RegisterUserResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * ユーザー/登録
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToRegisterWithRequest:(RegisterUserRequest *)request handler:(void(^)(RegisterUserResponse *_Nullable response, NSError *_Nullable error))handler;


@end

/**
 * The methods in this protocol belong to a set of old APIs that have been deprecated. They do not
 * recognize call options provided in the initializer. Using the v2 protocol is recommended.
 */
@protocol AccountService <NSObject>

#pragma mark UpdateProfile(UpdateProfileRequest) returns (Empty)

/**
 * ユーザー/プロフィール編集
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)updateProfileWithRequest:(UpdateProfileRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler;

/**
 * ユーザー/プロフィール編集
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToUpdateProfileWithRequest:(UpdateProfileRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler;


#pragma mark Leave(Empty) returns (Empty)

/**
 * ユーザー/退会
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)leaveWithRequest:(GPBEmpty *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler;

/**
 * ユーザー/退会
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToLeaveWithRequest:(GPBEmpty *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler;


@end


#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
/**
 * Basic service implementation, over gRPC, that only does
 * marshalling and parsing.
 */
@interface AccountRegisterService : GRPCProtoService<AccountRegisterService2, AccountRegisterService>
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions NS_DESIGNATED_INITIALIZER;
+ (instancetype)serviceWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions;
// The following methods belong to a set of old APIs that have been deprecated.
- (instancetype)initWithHost:(NSString *)host;
+ (instancetype)serviceWithHost:(NSString *)host;
@end
/**
 * Basic service implementation, over gRPC, that only does
 * marshalling and parsing.
 */
@interface AccountService : GRPCProtoService<AccountService2, AccountService>
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions NS_DESIGNATED_INITIALIZER;
+ (instancetype)serviceWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions;
// The following methods belong to a set of old APIs that have been deprecated.
- (instancetype)initWithHost:(NSString *)host;
+ (instancetype)serviceWithHost:(NSString *)host;
@end
#endif

NS_ASSUME_NONNULL_END

