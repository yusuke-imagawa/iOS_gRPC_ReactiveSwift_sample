// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: calling.proto

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

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum StartCallingResultType

typedef GPB_ENUM(StartCallingResultType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  StartCallingResultType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  StartCallingResultType_Success = 0,
  StartCallingResultType_ToUserInTalking = 1,
};

GPBEnumDescriptor *StartCallingResultType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL StartCallingResultType_IsValidValue(int32_t value);

#pragma mark - Enum CallingStatus

typedef GPB_ENUM(CallingStatus) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  CallingStatus_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  CallingStatus_Starting = 0,
  CallingStatus_Talking = 1,
  CallingStatus_End = 2,
};

GPBEnumDescriptor *CallingStatus_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL CallingStatus_IsValidValue(int32_t value);

#pragma mark - CallingRoot

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
@interface CallingRoot : GPBRootObject
@end

#pragma mark - StartCallingRequest

typedef GPB_ENUM(StartCallingRequest_FieldNumber) {
  StartCallingRequest_FieldNumber_ToUserId = 1,
};

@interface StartCallingRequest : GPBMessage

@property(nonatomic, readwrite) int64_t toUserId;

@end

#pragma mark - StartCallingResponse

typedef GPB_ENUM(StartCallingResponse_FieldNumber) {
  StartCallingResponse_FieldNumber_ResultType = 1,
};

@interface StartCallingResponse : GPBMessage

@property(nonatomic, readwrite) StartCallingResultType resultType;

@end

/**
 * Fetches the raw value of a @c StartCallingResponse's @c resultType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t StartCallingResponse_ResultType_RawValue(StartCallingResponse *message);
/**
 * Sets the raw value of an @c StartCallingResponse's @c resultType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetStartCallingResponse_ResultType_RawValue(StartCallingResponse *message, int32_t value);

#pragma mark - ReceiveCallingRequest

typedef GPB_ENUM(ReceiveCallingRequest_FieldNumber) {
  ReceiveCallingRequest_FieldNumber_FromUserId = 1,
  ReceiveCallingRequest_FieldNumber_ToUserId = 2,
};

@interface ReceiveCallingRequest : GPBMessage

@property(nonatomic, readwrite) int64_t fromUserId;

@property(nonatomic, readwrite) int64_t toUserId;

@end

#pragma mark - EndCallingRequest

typedef GPB_ENUM(EndCallingRequest_FieldNumber) {
  EndCallingRequest_FieldNumber_FromUserId = 1,
  EndCallingRequest_FieldNumber_ToUserId = 2,
};

@interface EndCallingRequest : GPBMessage

@property(nonatomic, readwrite) int64_t fromUserId;

@property(nonatomic, readwrite) int64_t toUserId;

@end

#pragma mark - ContinueCallingRequest

typedef GPB_ENUM(ContinueCallingRequest_FieldNumber) {
  ContinueCallingRequest_FieldNumber_FromUserId = 1,
  ContinueCallingRequest_FieldNumber_ToUserId = 2,
};

@interface ContinueCallingRequest : GPBMessage

@property(nonatomic, readwrite) int64_t fromUserId;

@property(nonatomic, readwrite) int64_t toUserId;

@end

#pragma mark - StatusResponse

typedef GPB_ENUM(StatusResponse_FieldNumber) {
  StatusResponse_FieldNumber_FromUserId = 1,
  StatusResponse_FieldNumber_ToUserId = 2,
  StatusResponse_FieldNumber_Status = 3,
};

@interface StatusResponse : GPBMessage

@property(nonatomic, readwrite) int64_t fromUserId;

@property(nonatomic, readwrite) int64_t toUserId;

@property(nonatomic, readwrite) CallingStatus status;

@end

/**
 * Fetches the raw value of a @c StatusResponse's @c status property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t StatusResponse_Status_RawValue(StatusResponse *message);
/**
 * Sets the raw value of an @c StatusResponse's @c status property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetStatusResponse_Status_RawValue(StatusResponse *message, int32_t value);

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)