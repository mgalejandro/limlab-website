# Lim Lab - Website

**Website of the Lim Lab at UCSF.**

[Check out the live site.](https://limlab.ucsf.edu)

Contact Hersh Bhargava with questions.

Internal notes: https://www.notion.so/hershbhargava/Lim-Lab-Website-Reference-b64071ae9952440f9922b39ea1ac9c2b?pvs=4

## Architecture

The site is templated with **Jade** (now Pug) and styled with **Sass**. It is built by **Grunt**, which runs on **Node.js**. Sources live in `src/`; the built site is emitted to `dest/`.

`Gruntfile.js` defines the build pipeline (`sass`, `jade`, `cssmin`, `copy`). `package.json` pins the Node dependencies. `environment.yml` pins the Node.js toolchain via Conda so builds are reproducible.

## Build from scratch

Prerequisites: a working `conda` installation (Miniforge, Miniconda, or Anaconda). Nothing else is required on the host — Node.js, npm, and `grunt-cli` are all installed inside the Conda environment.

```bash
# One-time setup: creates the `limlab-website` conda env and installs grunt + plugins.
./config_conda_env.sh

# To build the site:
conda activate limlab-website
grunt
```

The built site lands in `dest/`. To preview locally, serve that directory with any static file server (e.g. `python -m http.server -d dest 9000`).

To rebuild the environment from scratch, uncomment the `conda env remove` lines at the top of `config_conda_env.sh` before running it.

## Contributing

Submit changes via pull request. The GitHub Actions workflow at `.github/workflows/` re-runs `config_conda_env.sh` and `grunt` on every push to verify the site still builds.
