# saspyrilia-sandbox

Repository contains code examples used for testing content at [saspyrilia.com](https://www.saspyrilia.com).

In addition, repository contains [Dockerfile](Dockerfile) to build a single Docker image that contains [Jupyter Lab](https://jupyterlab.readthedocs.io/en/stable/) and kernels for all four principal programming languages featured on [saspyrilia.com](https://www.saspyrilia.com).
- SAS
- Python
- R
- Julia

Over time will _consider_ adding other kernels for other languages.
- [.NET Interactive](https://github.com/dotnet/interactive)
  - C#
  - F#
  - PowerShell
- [Nushell](https://github.com/nushell/nu_jupyter)
- [Rust](https://github.com/google/evcxr)  

<!--
## Detailed Instructions

NOTE: The below is outdated (as of **2020-10-23**) and will be updated with new instructions for using Docker.

For details of setting up these respective environments, see the [Code Sandboxes](https://www.saspyrilia.com/blog/codesandboxes) post at [saspyrilia.com](https://www.saspyrilia.com).

Note that the setup instructions are my preferred way of working with environments.  There is obviously [more than one way to skin a cat](https://en.wiktionary.org/wiki/there%27s_more_than_one_way_to_skin_a_cat).
-->

## Code Examples
If interested in code examples, the directory structure should mirror the [docs](https://github.com/curtisalexander/saspyrilia/tree/main/docs) section of the [saspyrilia repo](https://github.com/curtisalexander/saspyrilia).

## Sandbox

### SAS Requirements
Running `SAS` as built out in this repository requires creating an account on [SAS On Demand for Academics](https://www.sas.com/en_us/software/on-demand-for-academics.html).

All SAS code evaluated is evaluated within SAS On Demand for Academics (SAS ODA).  Within a Jupyter notebook, code is sent to SAS ODA via the [saspy](https://sassoftware.github.io/saspy/index.html) library &mdash; a set of Python APIs for working with SAS.  [Instructions](https://support.sas.com/ondemand/saspy.html) for getting setup to utilize Jupyter and SAS ODA can be summarized as follows:
- Create a `sascfg_personal.py` file and copy it to the appropriate location
- Create an `authinfo` file containing the username and password for SAS ODA

In order to prevent leaking secrets into the Docker container, the username and password values will be passed into the Docker container via the `ODA_USER` and `ODA_PASSWORD` environment variables.  The environment variables may be set globally or on a per-run basis (my preference).

### Docker Build
In order to build the Docker image, build from the [Dockerfile](Dockerfile).  Assuming one is in the `saspyrilia-sandbox` directory, run the following.

```
docker build --tag saspyrilia-sandbox .
```

The [Dockerfile](Dockerfile) is based on the [datascience-notebook](https://github.com/jupyter/docker-stacks/tree/master/datascience-notebook) maintained by the Jupyter team.  See the [Jupyter Docker Stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/) page for other images available and for detailed instructions for utilizing the images.

> **BEWARE:** This creates a rather large &mdash; 4GB+ &mdash; image!

### Docker Startup
Starting the Docker container is as simple as running the shell script [sandbox-startup.sh](sandbox-startup.sh) in the root of this repository.

```sh
./sandbox-startup.sh
```

This will startup a Jupyter notebook that one may access via their web browser at https://127.0.0.1:8
To startup the Docker container, pass in the username and password for `ODA_USER` and `ODA_PASSWORD` and use the startup script in this repository.

> **NOTE:** There is a space in front of the command &mdash; this is purposeful!  This prevents the command from being saved in your shell's history.  Note that this works for both `bash` and `fish` shells.

```sh
 ODA_USER=myusername ODA_PASSWORD=mypassword ./sandbox-startup.sh
```

### Login
In order to login to [SAS On Demand for Academics](https://www.sas.com/en_us/software/on-demand-for-academics.html), run the script `update-authinfo.sh` which updates the file `~/.authinfo` with the environment variables `ODA_USER` and `ODA_PASSWORD`.
