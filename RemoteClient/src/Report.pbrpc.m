#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
#import "Report.pbrpc.h"
#import "Report.pbobjc.h"
#import <ProtoRPC/ProtoRPCLegacy.h>
#import <RxLibrary/GRXWriter+Immediate.h>

#if defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS) && GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
#import <Protobuf/Empty.pbobjc.h>
#else
#import "google/protobuf/Empty.pbobjc.h"
#endif

@implementation ReportService

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

// Designated initializer
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [super initWithHost:host
                 packageName:@"report"
                 serviceName:@"ReportService"
                 callOptions:callOptions];
}

- (instancetype)initWithHost:(NSString *)host {
  return [super initWithHost:host
                 packageName:@"report"
                 serviceName:@"ReportService"];
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

#pragma mark PostReport(PostReportRequest) returns (Empty)

/**
 * 通報
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)postReportWithRequest:(PostReportRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToPostReportWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * 通報
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToPostReportWithRequest:(PostReportRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"PostReport"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[GPBEmpty class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
/**
 * 通報
 */
- (GRPCUnaryProtoCall *)postReportWithMessage:(PostReportRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions {
  return [self RPCToMethod:@"PostReport"
                   message:message
           responseHandler:handler
               callOptions:callOptions
             responseClass:[GPBEmpty class]];
}

@end
#endif
