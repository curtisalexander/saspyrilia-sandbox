# saspyrilia-sandboxes

Repository contains code used for testing examples at [saspyrilia.com](https://www.saspyrilia.com).

<!--
## Detailed Instructions

NOTE: The below is outdated (as of **2020-10-23**) and will be updated with new instructions for using Docker.

For details of setting up these respective environments, see the [Code Sandboxes](https://www.saspyrilia.com/blog/codesandboxes) post at [saspyrilia.com](https://www.saspyrilia.com).

Note that the setup instructions are my preferred way of working with environments.  There is obviously [more than one way to skin a cat](https://en.wiktionary.org/wiki/there%27s_more_than_one_way_to_skin_a_cat).
-->

## Requirements
Running `SAS` requires an account on [SAS On Demand for Academics](https://www.sas.com/en_us/software/on-demand-for-academics.html).  The environment variables &mdash; `ODA_USER` and `ODA_PASSWORD` &mdash; are utilized to login to the environment.

## Docker

### Build
Build the Docker image

```
docker build --tag saspyrilia-sandbox .
```

This sets up Jupyter with kernels for `SAS`, `Python`, `R`, and `Julia`.

### Startup
To startup, pass in the username and password for `ODA_USER` and `ODA_PASSWORD` and use the startup script in this repository.

> **NOTE:** There is a space in front of the command &mdash; this is purposeful!  This prevents the command from being saved in your shell's history.  Note that this works for both `bash` and `fish` shells.

```sh
 ODA_USER=myusername ODA_PASSWORD=mypassword ./sandbox-startup.sh
```

### Login
In order to login to [SAS On Demand for Academics](https://www.sas.com/en_us/software/on-demand-for-academics.html), run the script `update-authinfo.sh` which updates the file `~/.authinfo` with the environment variables `ODA_USER` and `ODA_PASSWORD`.
