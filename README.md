# Budget Tracker (Notion DB)

A test project for FFG.

## Getting Started

First using --dart-define.
In VScode you can add launch.json file to .vscode, replacing notion api key and notion database id

```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "budget_tracker",
            "request": "launch",
            "type": "dart",
            "toolArgs": [
                "--dart-define",
                "NOTION_API_KEY=your-notion-api-key",
                "--dart-define",
                "NOTION_DATABASE_ID=your-notion-database-id",
            ]
        },
        {
            "name": "budget_tracker (profile mode)",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile"
        },
        {
            "name": "budget_tracker (release mode)",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release"
        }
    ]
}
```

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
