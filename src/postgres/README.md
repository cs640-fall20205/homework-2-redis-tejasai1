# Postgres

This file describes how to manipulate the
Postgres server so that you can work through the
Postgres chapters in our text.

## Starting and connecting to the Postgres server

1. Open your personal repository in GitPod.

2. Reposition GitPod's terminal to the postgres directory

    ```bash
    cd postgres
    ```

3. Start the Postgres server

    ```bash
    ./up.bash
    ```

4. Connect to the Postgres server

    ```bash
    ./shell.bash
    ```

Your prompt should be `7dbs=# `.

Turn to page 11 in your text and continue ***AFTER*** `$ psql 7dbs`.

When you are done interacting with the Postgres server, type `exit` or `\q`
to return to the bash prompt. This does not stop the server, it just
disconnects you from the server. You can reconnect by running `./shell.bash`
again.

## Saving the database state

Assuming your Postgres server is running, and your terminal is still
positioned in the `postgres/` directory, run the following...

```bash
./save.bash data.sql
```

This dumps the database into a file named `data.sql`.

## Stopping and delete the Postgres server

```bash
./down.bash
```

## Loading the database state

After starting a new Postgres server, it will be
empty. Assuming you saved the state of your database
in `data.sql`, you can restore the currently empty
server to this state as follows.

```bash
./load.bash data.sql
```

## Best Practice

Postgres is saving your data inside a Docker container (a virtual machine)
inside GitPod (a virtual machine). There is no telling what will happen
when you stop GitPod. To be safe, you should assume that you will lose
your database when you stop your GitPod workspace.

I guarantee you'll lose your database if you run `./down.bash` as it
destroys the container running your DBMS.

So to protect your data, I recommend that when you are done working,
save your database to an SQL file, take down your DBMS, and then
save and stop your workspace as follows:

    ./save.bash mydb.sql
    ./down.bash
    save-and-stop

When you sit down to work again, start a new GitPod workspace, reposition
into `postgres/`, bring up your DBMS, and load it with your SQL file as
follows:

    cd postgres
    ./up.bash
    ./load.bash mydb.sql

Now you are ready to continue your work.
