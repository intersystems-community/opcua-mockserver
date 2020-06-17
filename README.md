# OPC-UA Mock Server

## Usage instructions

You need to have a folder with a single file on it that will contain the data you want to mock. Once the server
starts, it will read that file. Here is the structure of the file:
* The first line of the file define the name of the OPC-UA nodes
* The second line of the file define the data types of the OPC-UA nodes. The current supported data types are:
  * INT64
  * DATETIME

Here is an example:

```bash
NODE_NAME1,NODE_NAME2
INT64,INT64
1,2
1,3
2,2
1,2
```

Let's say you have this file at **~/opcuadata/mockdata.csv**. Here is how you start the server with it:

```bash
docker run --name opcua_mockserver --init --rm \
    -v ~/opcuadata:/app/data \
    -p 4840:4840 \
    intersystemsdc/opcua-mockserver:version-0.3.0
```

Without any particular specification, the server will iterate through the lines of the input file at
the constant rate of about 1 row per second. However, it is also possible to be more specific as to how
long the server is to allow each data row to remain available to queries from OPC UA clients. In order
to do so, an additional column can be specified and given the "data type" of "DURATION".
(The name of the column is irrelevant.) The values in
such a column with thus indicate the length of time in milliseconds that the row should remain 
available for queries. For example, the specification below would 
indicate that each row should be held for an ascending number of seconds: the first for 1 second, the
second for 2 seconds, etc.

```bash
NODE_NAME1,NODE_NAME2,COLNAME
INT64,INT64,DURATION
1,2,1000
1,3,2000
2,2,3000
1,2,4000
```
