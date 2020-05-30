# Setup

See the below for details on managing conda environments.

https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html

## Init

Ensure your shell is configured for working with `conda`.
```
conda init <shellname>
```

Use a specific location for an environment
```
conda create --prefix ./envs
```

Create an `environment.yml` file.  First ensure you have [activated](#activate) your environment.

```
conda env export > environment.yml
```

Now edit the `environment.yml` file to utilize relative directory paths instead of absolute paths.  Give the environment an appropriate name &mdash; for this example, I named my environment `sandbox`.

Make sure to add the `envs` directory to your `.gitignore` file.

## Activate

Activate your environment
```
conda activate ./envs
```

## Add and Remove Dependencies

Again, ensure you have [activated](#activate) your environment.

Edit the `environment.yml` file by adding needed dependencies.  Dependencies can be added simply with the package required.  For a more complex setup package versions may be included.  Add dependencies under the `dependencies` key in the yaml file.

Run the following to build the environment based on your `environment.yml` file.  Note that with the `--prune` option, packages not listed will be removed.
```
conda env update --prefix ./envs --file environment.yml --prune
```

### Identical Environment

Export the environment, with detailed versioning information, to an explicit specification file.  As the conda documentation notes, an explicit specification file is not cross platform.

```
conda list --explicit > spec-file.txt
```




