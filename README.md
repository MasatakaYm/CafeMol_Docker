# What is this?

This is a Dockerfile for installing [CafeMol 3.2.1](https://www.cafemol.org/).

## Making a docker image

A Docker image can be built as follows:
```sh
$ docker build -t cafemol-3.2.1 .
```

## Perfoming CafeMol

```sh
$  docker run -v /path-to/workdir_host:/path-to/workdir_container cafemol-3.2.1 cafemol cafemol.inp
```

Note that the local directory `/path-to/workdir_host` is mounted on `/path-to/workdir_container` in the container so that CafeMol can read input files (`para`, `pdb`, `ninfo`, etc.) and dump output files (`.ts`, `.dcd.`, `.ninfo`, `.dat`, etc.).