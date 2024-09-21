import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('No command provided.');
    return;
  }
  //

  final command = arguments.first;

  // Define your command aliases
  final commandsMap = {
    'apk': 'flutter build apk --release',
    'ios': 'flutter build ios',
    'launcher':'flutter pub run flutter_launcher_icons',
    'build_runner':'dart run build_runner build --delete-conflicting-outputs'
    // Add more aliases here as needed
  };

  if (commandsMap.containsKey(command)) {
    runCommand(commandsMap[command]!);
  } else {
    print('Unknown command: $command');
  }
}

void runCommand(String command) async {
  // Run the mapped Flutter command
  Process.run(command.split(' ').first, command.split(' ').skip(1).toList()).then((result) {
    stdout.write(result.stdout);
    stderr.write(result.stderr);
  });
}