# Mongo

## Start the database

```
./up.bash
```

## Stop the database

It's data will be lost. Make sure you dump it first.

```
./down.bash
```

## Connect to the database

```
./shell.bash
```

## Run a script in the database

```
./run.bash < script-file.js
```

## Dump your running database

Replace `dump_dir` with the name of the directory you want to
dump your data to.

```
./dump.bash dump_dir
```

## Load dump into your running database

Start with a fresh database. Replace `dump_dir` with the directory that
contains the data you want to load.

```
./load.bash dump_dir
```
