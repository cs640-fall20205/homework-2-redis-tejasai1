# Using Redis in this course

## Start the database

```
$ ./up.bash
$
```

## Connect to the database

```
$ ./shell.bash
redis>
```

## Disconnect from the database

```
redis> quit
```

## Save your data

```
redis> SAVE
redis> quit
$ cp /tmp/redis-data/dump.rdb dump.rdb
```

## Stop the database

```
$ ./down.bash
```

## Restore your data

```
$ ./up.bash
$ 
$ sudo cp dump.rdb /tmp/redis-data/dump.rdb
```

## Start clean after saving (in same CodeSpace session)

```
$ ./down.bash
$ sudo rm /tmp/redis-data/dump.rdb
$ ./up.bash
```

## Daily workflow

## 1. Open your project in GitPod.

## 2. Reposition terminal

```
$ cd redis

```

## 3. Restore saved database from last time. (Skip if this is your first time.)

```
$ ./up.bash
$
$ sudo cp dump.rdb /tmp/redis-data/dump.rdb

```

## 4. Start and connect to database

```
$ ./up.bash
$ ./shell.bash

```

## 5. Do work

```
redis>

```

## 6. 6Save, disconnect from, and stop database

```
redis> SAVE
redis> quit
$ cp /tmp/redis-data/dump.rdb dump.rdb
$ ./down.bash

```

## 7. Save work to GitHub
