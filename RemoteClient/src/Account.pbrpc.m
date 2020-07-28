#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
#import "Account.pbrpc.h"
#import "Account.pbobjc.h"
#import <ProtoRPC/ProtoRPCLegacy.h>
#import <RxLibrary/GRXWriter+Immediate.h>

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

@implementation AccountRegisterService

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

// Designated initializer
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [super initWithHost:host
                 packageName:@"account"
                 serviceName:@"AccountRegisterService"
                 callOptions:callOptions];
}

- (instancetype)initWithHost:(NSString *)host {
  return [super initWithHost:host
                 packageName:@"account"
                 serviceName:@"AccountRegisterService"];
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

#pragma mark Register(RegisterUserRequest) returns (RegisterUserResponse)

/**
 * ユーザー/登録
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)registerWithRequest:(RegisterUserRequest *)request handler:(void(^)(RegisterUserResponse *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToRegisterWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * ユーザー/登録
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToRegisterWithRequest:(RegisterUserRequest *)request handler:(void(^)(RegisterUserResponse *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"Register"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[RegisterUserResponse class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * ユーザー/登録
 */
- (GRPCUnaryProtoCall *)registerWithMessage:(RegisterUserRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"Register"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[RegisterUserResponse class]];
}

@end
@implementation AccountService

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

// Designated initializer
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [super initWithHost:host
                 packageName:@"account"
                 serviceName:@"AccountService"
                 callOptions:callOptions];
}

- (instancetype)initWithHost:(NSString *)host {
  return [super initWithHost:host
                 packageName:@"account"
                 serviceName:@"AccountService"];
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

#pragma mark UpdateProfile(UpdateProfileRequest) returns (Empty)

/**
 * ユーザー/プロフィール編集
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)updateProfileWithRequest:(UpdateProfileRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToUpdateProfileWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * ユーザー/プロフィール編集
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToUpdateProfileWithRequest:(UpdateProfileRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"UpdateProfile"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[GPBEmpty class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * ユーザー/プロフィール編集
 */
- (GRPCUnaryProtoCall *)updateProfileWithMessage:(UpdateProfileRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"UpdateProfile"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[GPBEmpty class]];
}

#pragma mark Leave(Empty) returns (Empty)

/**
 * ユーザー/退会
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)leaveWithRequest:(GPBEmpty *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToLeaveWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * ユーザー/退会
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToLeaveWithRequest:(GPBEmpty *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"Leave"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[GPBEmpty class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * ユーザー/退会
 */
- (GRPCUnaryProtoCall *)leaveWithMessage:(GPBEmpty *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"Leave"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[GPBEmpty class]];
}

@end
#endif
