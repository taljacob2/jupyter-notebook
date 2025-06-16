# jupyter-notebook

Run a jupyter notebook server via a docker image.

## Usage

### Provide a `requirements.txt` file

Provide a `requirements.txt` file, so jupyter will import all your `pip` packages.

You can export a `requirements.txt` file by running the following command:

```
echo "$(python3 -m pip freeze)" > requirements.txt 
```

### Build The Image Locally

Basic image:

```sh
docker build . -t jupyter-notebook
```

Ubuntu image:

```sh
docker build -f Dockerfile.ubuntu . -t jupyter-notebook:ubuntu
```

Ubuntu2 image:

```sh
docker build -f Dockerfile.ubuntu2 . -t jupyter-notebook:ubuntu2
```

Ubuntu3 image:

```sh
docker build -f Dockerfile.ubuntu3 . -t jupyter-notebook:ubuntu3
```

### Run The Jupyter Notebook Server

Choose one of the following options:

#### Run the image, in an isolated container

> ATTENTION: Once the container is removed, the whole changes you have made in the workspace will be removed with it.

```
docker run -d -it --name jupyter-notebook -p 8888:8888 -v "$(pwd)/.jupyter:/home/jovyan/.jupyter" jupyter-notebook
```

or

```
docker run -d -it --name jupyter-notebook -p 8888:8888 -v "$(pwd)/.jupyter:/root/.jupyter" jupyter-notebook:ubuntu
```

or

```
docker run -d -it --name jupyter-notebook -p 8888:8888 -v "$(pwd)/.jupyter:/root/.jupyter" jupyter-notebook:ubuntu2
```

#### Live edit the workspace with the host machine (RECOMMENDED)

> This will also backup the changes you have made in the workspace in the host machine.

```
docker run -d -it --name jupyter-notebook -p 8888:8888 -v "$(pwd)/.jupyter:/home/jovyan/.jupyter" -v "$(pwd):/workspace" jupyter-notebook
```

or

```
docker run -d -it --name jupyter-notebook -p 8888:8888 -v "$(pwd)/.jupyter:/root/.jupyter" -v "$(pwd):/workspace" jupyter-notebook:ubuntu
```

or

```
docker run -d -it --name jupyter-notebook -p 8888:8888 -v "$(pwd)/.jupyter:/root/.jupyter" -v "$(pwd):/workspace" jupyter-notebook:ubuntu2
```

or

```
docker run -d -it --name jupyter-notebook -p 8888:8888 -p 6006:6006 -v "$(pwd)/.jupyter:/root/.jupyter" -v "$(pwd):/workspace" jupyter-notebook:ubuntu3
```

Once you have run the container, navigate to http://localhost:8888/lab to run a notebook.
