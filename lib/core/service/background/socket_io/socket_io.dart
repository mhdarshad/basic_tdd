import 'package:laravel_echo/laravel_echo.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// const String BEARER_TOKEN = 'YOUR_BEARER_TOKEN_HERE';

Echo initSocketIOClient(token) {
  IO.Socket socket = IO.io(
    // 'http://20.216.0.221:6001',
    'https://app-staging.cloudmesoft.com:6001',
    IO.OptionBuilder()
        .disableAutoConnect()
        .setTransports(['websocket']).build(),
  );

  Echo echo =  Echo(
    broadcaster: EchoBroadcasterType.SocketIO,
    client: socket,
    options: {
      'auth': {
        'headers': {
          'Authorization': 
          'Bearer $token',
        }
      },
    },
  );

  return echo;
}
