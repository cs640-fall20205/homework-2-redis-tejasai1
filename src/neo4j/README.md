# Day 1 - Neo4J

Neo4J comes with a web application for manipulating a database. But it
requires custom network schemes that GitPod.io does not support. So, we'll
need to run Neo4J locally to try out its web-interface.

Use these instructions to work through Neo4J day 1 in your text.

## Setup

1. Make sure the following are installed in the machine you will use for
    this assignment:

    * Docker Desktop
    * VS Code
    * Bash or Powershell
    * Git

2. Start Docker Desktop, if it's not already running (Look for Docker icon in
    your system tray).

    ![docker icon](images/docker.png)

3. In a terminal (bash or powershell) on your local machine, clone your repository.

    First copy the clone URL for your repository from GitLab.
    Then...

    ```bash
    git clone URL_TO_REPO YOUR_NAME
    ```

4. Open the cloned repository in VS Code.

    ```bash
    code YOUR_NAME
    ```

5. In a bash/powershel. terminal ***in VS Code***, reposition terminal to neo4j.

    ```bash
    cd neo4j
    ```

6. Start Neo4j.

    ```bash
    ./up.bash
    ```

    In powershell, you may not have permissions to run the script below. If that's the case,
    edit this file, and then copy-paste each command individually into powershell to run them.
    Do this anytime you need to run a powershell script.

    ```powershell
    ./up.ps1
    ```

## Clean DB

This step deletes logs/ and data/ directory which are created by the database.
This step may not be necessary when working locally. But you'll need it later
when working in GitPod.io.

I only have instructions for Mac/Linux. Hopefully Windows won't need this.

Before stopping your DB

```bash
./clean.bash
```

## Stop DB

On Mac/Linux

```bash
./stop.bash
```

In powershell, remember you may need to edit the script and copy-paste
its commands into powershell.

```powershell
./down.ps1
```
