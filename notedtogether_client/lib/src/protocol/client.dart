/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:notedtogether_client/src/protocol/notes.dart' as _i3;
import 'package:notedtogether_client/src/protocol/greeting.dart' as _i4;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i5;
import 'protocol.dart' as _i6;

/// {@category Endpoint}
class EndpointNotes extends _i1.EndpointRef {
  EndpointNotes(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'notes';

  _i2.Future<void> createNote(_i3.Note note) => caller.callServerEndpoint<void>(
        'notes',
        'createNote',
        {'note': note},
      );

  _i2.Future<List<_i3.Note>> getAllNotes() =>
      caller.callServerEndpoint<List<_i3.Note>>(
        'notes',
        'getAllNotes',
        {},
      );

  _i2.Future<void> deleteNote(_i3.Note note) => caller.callServerEndpoint<void>(
        'notes',
        'deleteNote',
        {'note': note},
      );
}

/// This is an example endpoint that returns a greeting message through its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i1.EndpointRef {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i2.Future<_i4.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i4.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i5.Caller(client);
  }

  late final _i5.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    notes = EndpointNotes(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointNotes notes;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'notes': notes,
        'greeting': greeting,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
