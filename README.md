# share_icomut
Dockerfile, tutorial, and standard jupyter notebook for viewing iCoMut plot externally. Docker must be installed and gcloud authenticated before running. Follow instructions below for setup.

## Setup
### Install Docker
1) Follow instructions [here](https://docs.docker.com/get-docker/) to install Docker on your device. The Docker Desktop app is needed to run docker containers locally.
2) Open Docker application

### Authenticate gcloud
1) Download and install the Google Cloud SDK command line interface, following [these instructions](https://cloud.google.com/sdk/docs/install-sdk).
  - Note: Python typically must be installed locally in order to install gcloud SDK.
2) After installation, open a command line terminal (search for `terminal` on Mac or `PowerShell` on Windows)
3) Type command and follow instructions to authenticate using your google account:
```
gcloud auth login
``` 
4) Repeat with this command:
```
gcloud auth application-default login
```
5) You can test authentication by trying to copy a file from a google bucket you have access to (`gsutil cp gs://<file-location> .`). If it copies without an error, authentication was successful!

## Run
### Start Docker container and open notebook
1) In your terminal, run:
```
docker run -i -p 8001:8001 -v ~/.config/gcloud:/home/jovyan/.config/gcloud --name icomut_container gcr.io/broad-getzlab-workflows/share_icomut:latest jupyter notebook --allow-root --port=8001
```
2) Copy the link from terminal and paste into an internet browser

### Run application
1) Click on the ***icomut_notebook.ipynb*** file to open it in a new tab
2) Change the date_id variable or filenames (if necessary) 
3) Hit the button with two triangles (looks like fast-forward) to run all cells
4) View and manipulate the iCoMut plot at the bottom of the notebook

### Docker commands
- To stop the docker container from the running terminal, press Ctrl-C
- If you wish to remove a docker container: `docker rm icomut_container`. The container can be recreated later using the command in the 1st Run section.
- It is also simple to restart a stopped docker container (which maintains any downloaded data/anything run in the container):
  1) `docker start icomut_container`
  2) `docker exec -it icomut_container bash`
  3) Display the notebook link after restarting (if notebook was closed in broswer): `jupyter notebook list`
  4) Copy link from terminal and paste into an internet browser
- To exit docker terminal: `Ctrl-D`
- To stop docker container: `docker stop icomut_container`
  
# Development
- In order to rebuild the Docker image, you must have git access to the [icomut-lattice](https://github.com/broadinstitute/icomut-lattice) repo. Contact [Duyen Nguyen](mailto:dnguyen@broadinstitute.org) or the [Broad Institute Pattern team](mailto:pattern@broadinstitute.org) for access.
