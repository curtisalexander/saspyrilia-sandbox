# saspyrilia-sandboxes

Repository contains code used for testing examples at [saspyrilia.com](https://www.saspyrilia.com).

### Setup
For details of setting up these respective environments, see the [Code Sandboxes](https://www.saspyrilia.com/blog/codesandboxes) post at [saspyrilia.com](https://www.saspyrilia.com).

Note that the setup instructions are my preferred way of working with environments.  There is obviously [more than one way to skin a cat](https://en.wiktionary.org/wiki/there%27s_more_than_one_way_to_skin_a_cat).

### Startup
To startup, pass in the username and password for `ODA_USER` and `ODA_PASSWORD` and use the startup script.

> **NOTE:** There is a space in front of the command &mdash; this is purposeful!  This prevents the command from being saved in your shell's history.  Note that this works for both `bash` and `fish` shells.

```sh
 ODA_USER=myusername ODA_PASSWORD=mypassword ./sandbox-startup.sh
```
