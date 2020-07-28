#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
#import "User.pbrpc.h"
#import "User.pbobjc.h"
#import <ProtoRPC/ProtoRPCLegacy.h>
#import <RxLibrary/GRXWriter+Immediate.h>

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

@implementation UserService

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

// Designated initializer
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [super initWithHost:host
                 packageName:@"user"
                 serviceName:@"UserService"
                 callOptions:callOptions];
}

- (instancetype)initWithHost:(NSString *)host {
  return [super initWithHost:host
                 packageName:@"user"
                 serviceName:@"UserService"];
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

#pragma mark GetUsers(GetUsersRequest) returns (GetUsersResponse)

/**
 * ユーザーのリスト取得
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getUsersWithRequest:(GetUsersRequest *)request handler:(void(^)(GetUsersResponse *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToGetUsersWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * ユーザーのリスト取得
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetUsersWithRequest:(GetUsersRequest *)request handler:(void(^)(GetUsersResponse *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"GetUsers"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[GetUsersResponse class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * ユーザーのリスト取得
 */
- (GRPCUnaryProtoCall *)getUsersWithMessage:(GetUsersRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"GetUsers"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[GetUsersResponse class]];
}

#pragma mark GetUserById(GetUserRequest) returns (GetUserResponse)

/**
 * 指定したidのユーザーを取得
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getUserByIdWithRequest:(GetUserRequest *)request handler:(void(^)(GetUserResponse *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToGetUserByIdWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * 指定したidのユーザーを取得
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetUserByIdWithRequest:(GetUserRequest *)request handler:(void(^)(GetUserResponse *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"GetUserById"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[GetUserResponse class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * 指定したidのユーザーを取得
 */
- (GRPCUnaryProtoCall *)getUserByIdWithMessage:(GetUserRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"GetUserById"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[GetUserResponse class]];
}

@end
#endif
