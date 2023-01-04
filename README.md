# share_icomut
Docker file, tutorial, and standard jupyter notebook for viewing iCoMut plot externally. Docker must be installed and gcloud authenticated before running. Follow instructions below for setup.

## Setup
### Install Docker
1) Follow instructions [here](https://docs.docker.com/get-docker/) to install Docker on your device. The Docker Desktop app is needed to run docker containers locally.
2) Open Docker application
### Authenticate gcloud
1) Download and install the Google Cloud SDK command line interface, following [these instructions](https://cloud.google.com/sdk/docs/install-sdk).
2) After installation, open a command line terminal (search for `terminal` on Mac or `PowerShell` on Windows)
3) Type command `gcloud auth login` and follow instructions to authenticate using your google account
4) Type command `gcloud auth application-default login` and follow instructions to authenticate using your google account
5) You can test authentication by trying to copy a file from a google bucket you have access to (`gsutil cp gs://<file-location> .`). If it copies without an error, authentication was sucessful

## Run
### Start Docker container and open notebook
1) In your terminal, run `docker run -id -p 8001:8001 -v ~/.config/gcloud:/home/jovyan/.config/gcloud --name icomut_container <image_name>`
2) Next run `docker exec -it icomut_container bash`
3) `jupyter notebook --port=8001`
4) Copy the link from terminal and paste into an internet browser

OR maybe `docker run -p 8001:8001 -v ~/.config/gcloud:/home/jovyan/.config/gcloud --name icomut_container <image_name> jupyter notebook --port=8001`

### Run application
1) Click on the ***icomut_notebook.ipynb*** file to open it in a new tab
2) Change the date_id variable or filenames (if necessary) 
3) Hit the button with two triangles (looks like fast-forward) to run all cells
4) View and manipulate the iCoMut plot at the bottom of the notebook
