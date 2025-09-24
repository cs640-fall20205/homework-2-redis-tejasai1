# Assignment 4 - Columnar Databases and HBase

## 7in7 - HBase - Day 1

### Interactive Reading

Read Day 1 and work through the examples in the chapter.
Save your final database in a directory `day1` as follows.

```
./save.bash wiki day1
```

You can use the same script to save your database between work sessions.
But you cannot save over an existing save. So use temporary names like:
`day1a`, `day1b`, etc. You can use the `./load.bash` script to restore
an empty database from a saved state.

Here are some additional tips:

* Skip **Configuring HBase**.
* Begin with the last command on p57: `version`.
* p59 - Do not run these in the shell, which is Ruby.
    These are illustrative examples in python.
* p64 - The last example is split over 2 lines. `hbase>` and `hbase*` are
    not part of the command.


### 7in7 - HBase Day 1 - Find

1. Figure our how to use the shell to do the following:

    * Delete individual column values in a row:

        ```
        WRITE EXAMPLE COMMAND HERE
        ```

    * Delete an entire row

        ```
        WRITE EXAMPLE COMMAND HERE
        ```


2. Bookmark the HBase API documentation for the version of HBase you’re using.

    ```
    WRITE URL HERE
    ```

### 7in7 - HBase Day 1 - Do

1. Create a function called put_many() that creates a Put instance, adds any
   number of column-value pairs to it, and commits it to a table.

   Below is some starter code with comments. The code fragment below was
   created by combining the example on p65 with the starter function in
   the problem description.

    def put_many(table_name, row, column_values)
        # The code in this function was taken from the example on pg 65.
        # You need to generalize it by replacing strings like "wiki" and
        # "Home" with input parameters.

        table = HTable.new(@hbase.configuration, "wiki")
        p = Put.new(*jbytes("Home"))

        # The following three lines from the example on pg 65 must be
        # converted into a loop.
        #
        #    p.add(*jbytes("text", "", "Hello world"))
        #    p.add(*jbytes("revision", "author", "jimbo"))
        #    p.add(*jbytes("revision", "comment", "my first edit"))
        #
        # The column_values parameter contains a hash. See the second problem
        # in the text for an example of what will be passed for column_values.
        #
        # In Ruby, you use the "each_pair do" to loop through the values of a hash.
        # For example, if myhash is a variable containing a hash, here is
        # a loop that makes each key, value pair available inside the loop.
        #
        #     myhash.each_pair do |key, value|
        #         # On each pass of the loop, key and value are assigned
        #         # one of the key-value pairs in myhash.
        #     end
        #
        # You'll need one more trick to complete the loop. Notice that each
        # key contains a string that has the form "family:column". You'll
        # need to use the split function to separate them into two variables.
        # Here is the code for that.
        #
        #     family, column = key.split(':')
        #
        # Now write a loop to process each key, value pair in column_values
        # and add them to the Put object p.


        # Now we execute the put statement. You don't need to modify this
        # statement.
        table.put(p)
    end

2. Define your put_many() function by pasting it in the HBase shell, and then
   call it like so:

        put_many 'wiki', 'Some title', {
            hbase* "text:" => "Some article text",
            hbase* "revision:author" => "jschmoe",
            hbase* "revision:comment" => "no comment" }

    Test that it worked by running:

        scan "wiki"

    Paste the output from the last command below.

    ```
    PASTE OUTPUT HERE
    ```


### 7in7 - Day 3 - Wrap Up

Read Day 3 - Wrap Up. Then answer the following.

1. List the pros of HBase as described in our text.

    ```
    ANSWER HERE
    ```

2. List the cons of HBase as described in our text.

    ```
    ANSWER HERE
    ```


### 7in7 - Day 2 - OPTIONAL

OPTIONAL - You may safely skip Day 2.

This section contains a code-heavy example of loading a large amount
of data into your HBase database. If you feel like a challenge and are
interested, feel free to work through it.

If you do this section, please **do not** use ./save.bash to save
your database, because it may become very large.

So if you are ready for the challenge, below are some instructions to
help you along. Good luck!

1. Download and extract the source code for the text: https://pragprog.com/titles/pwrdata/seven-databases-in-seven-weeks-second-edition/

2. Drag the following files into 02_hbase/local/scripts on GitPod.
    * source_code/02_hbase/import_from_wikipedia.rb
    * source_code/02_hbase/create_wiki_schema.rb

3. Start your database.

4. Run the following to create the wiki table.

    ```
    ./shell.bash create_wiki_schema.rb
    ```

5. Now you should be able to run the command below.
    BEFORE YOU DO... be ready to press CTRL+C to stop the process. This
    command will load a lot of data very fast.

    ```
    curl https://dumps.wikimedia.org/enwiki/latest/enwiki-latest-pages-articles.xml.bz2 | bzcat | ./shell.bash import_from_wikipedia.rb
    ```

6. After it appears to be working, press CTRL+C to stop it.

7. Connect to your database.

8. Run the command below to count the number of
    rows in your 'wiki' table.

    ```
    count 'wiki'
    ```

    Copy and paste the output of this command below.

9. Run the command below to get information about your database's regions.

    ```
    scan 'hbase:meta',{FILTER=>"PrefixFilter('wiki')"}
    ```

    Copy and past the output of this command below.


