# Setup

### Init
```
conda create --name pysandbox
```

### `environment.yml` init

Create an `environment.yml` file.

### Add and Remove Dependencies

Edit the `environment.yml` file.  Can be edited in simple manner or more complex manner.

https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#updating-an-environment

```
conda env update pysandbox --file environment.yml --prune
```

### Identical Environment

Export

```
conda list --explicit > spec-file.txt
```




