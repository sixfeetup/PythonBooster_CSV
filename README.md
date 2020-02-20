# Python Booster

## Python and CSV

**Calvin Hendryx-Parker, CTO**
[Six Feet Up](http://www.sixfeetup.com)

 [![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

## Getting Started

Build the container and run it locally

```console
$ docker build -t pythonbooster_csv .
```

Start up the container in the foreground. Once running, Jupyter will output to
`stdout` the URL to access the notebook.

```console
$ docker run -p 8888:8888 --name pythonbooster_csv pythonbooster_csv
```

Use `ctrl-c` to stop the running notebook and the following command to start
it back up again.

```console
$ docker start -a pythonbooster_csv
```

Once you are done playing with the notebook and want to throw away the work
and container, use the following command.

```console
$ docker rm pythonbooster_csv
```

