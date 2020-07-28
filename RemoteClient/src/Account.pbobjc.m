// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: account.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import "Account.pbobjc.h"
#import "Commons.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - AccountRoot

@implementation AccountRoot

// No extensions in the file and none of the imports (direct or indirect)
// defined extensions, so no need to generate +extensionRegistry.

@end

#pragma mark - AccountRoot_FileDescriptor

static GPBFileDescriptor *AccountRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"account"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - RegisterUserRequest

@implementation RegisterUserRequest

@dynamic name;
@dynamic genderType;
@dynamic age;
@dynamic pr;

typedef struct RegisterUserRequest__storage_ {
  uint32_t _has_storage_[1];
  GenderType genderType;
  int32_t age;
  NSString *name;
  NSString *pr;
} RegisterUserRequest__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = RegisterUserRequest_FieldNumber_Name,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(RegisterUserRequest__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "genderType",
        .dataTypeSpecific.enumDescFunc = GenderType_EnumDescriptor,
        .number = RegisterUserRequest_FieldNumber_GenderType,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(RegisterUserRequest__storage_, genderType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "age",
        .dataTypeSpecific.className = NULL,
        .number = RegisterUserRequest_FieldNumber_Age,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(RegisterUserRequest__storage_, age),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "pr",
        .dataTypeSpecific.className = NULL,
        .number = RegisterUserRequest_FieldNumber_Pr,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(RegisterUserRequest__storage_, pr),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[RegisterUserRequest class]
                                     rootClass:[AccountRoot class]
                                          file:AccountRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(RegisterUserRequest__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\002\n\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t RegisterUserRequest_GenderType_RawValue(RegisterUserRequest *message) {
  GPBDescriptor *descriptor = [RegisterUserRequest descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:RegisterUserRequest_FieldNumber_GenderType];
  return GPBGetMessageInt32Field(message, field);
}

void SetRegisterUserRequest_GenderType_RawValue(RegisterUserRequest *message, int32_t value) {
  GPBDescriptor *descriptor = [RegisterUserRequest descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:RegisterUserRequest_FieldNumber_GenderType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - RegisterUserResponse

@implementation RegisterUserResponse

@dynamic apiToken;
@dynamic hasUser, user;

typedef struct RegisterUserResponse__storage_ {
  uint32_t _has_storage_[1];
  NSString *apiToken;
  User *user;
} RegisterUserResponse__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "apiToken",
        .dataTypeSpecific.className = NULL,
        .number = RegisterUserResponse_FieldNumber_ApiToken,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(RegisterUserResponse__storage_, apiToken),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "user",
        .dataTypeSpecific.className = GPBStringifySymbol(User),
        .number = RegisterUserResponse_FieldNumber_User,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(RegisterUserResponse__storage_, user),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[RegisterUserResponse class]
                                     rootClass:[AccountRoot class]
                                          file:AccountRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(RegisterUserResponse__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\001\010\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - UpdateProfileRequest

@implementation UpdateProfileRequest

@dynamic hasName, name;
@dynamic hasAge, age;
@dynamic hasPr, pr;

typedef struct UpdateProfileRequest__storage_ {
  uint32_t _has_storage_[1];
  GPBStringValue *name;
  GPBInt32Value *age;
  GPBStringValue *pr;
} UpdateProfileRequest__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "name",
        .dataTypeSpecific.className = GPBStringifySymbol(GPBStringValue),
        .number = UpdateProfileRequest_FieldNumber_Name,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(UpdateProfileRequest__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "age",
        .dataTypeSpecific.className = GPBStringifySymbol(GPBInt32Value),
        .number = UpdateProfileRequest_FieldNumber_Age,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(UpdateProfileRequest__storage_, age),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "pr",
        .dataTypeSpecific.className = GPBStringifySymbol(GPBStringValue),
        .number = UpdateProfileRequest_FieldNumber_Pr,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(UpdateProfileRequest__storage_, pr),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[UpdateProfileRequest class]
                                     rootClass:[AccountRoot class]
                                          file:AccountRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(UpdateProfileRequest__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)