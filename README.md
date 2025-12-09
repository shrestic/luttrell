# Template


## Using FVM

If using FVM, in all command need to add "fvm" before the old command

```bash
$ fvm flutter pub get
```

## Run gen-l10n

Run:

```bash
$ flutter gen-l10n
```

## Run build_runner

Run:

```bash
$ dart run build_runner build --delete-conflicting-outputs
```

## Build Android release

- flutter build apk --release --flavor <env_name> -t lib/main_<env_name>.dart

Example: Build Stage

```bash
 flutter build apk --release --flavor dev -t lib/main_stage.dart
```
## Fake login form
{
    "username":"emilys,
    "password":"emilyspass"
}
## If your are using VS Code IDE
 - Create a launch.json
 - Add:
     "configurations": [
        {
            "name": "DEVELOPMENT",
            "request": "launch",
            "type": "dart",
            "program": "lib/main_dev.dart",
            "args": ["--flavor", "dev"],
        },
        {
            "name": "STAGE",
            "request": "launch",
            "type": "dart",
            "program": "lib/main_stage.dart",
            "args": ["--flavor", "stage"],
        },
        {
            "name": "PRODUCTION",
            "request": "launch",
            "type": "dart",
            "program": "lib/main_prod.dart",
            "args": ["--flavor", "prod"],
        }
    ]
## Git flow:
https://github.com/nhatphongcgp/git-flow-example/blob/master/README.md

