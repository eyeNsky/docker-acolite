# docker-acolite
Dockerfile to set up acolite and gsutil on an Ubuntu 18.04 image.

http://odnature.naturalsciences.be/remsem/software-and-data/acolite

Build the docker container with:
<pre><code>docker build -t acolite_version . </pre></code>

The build process puts gsutil and acolite in /usr/local/bin so the commands don't need the full path to the binary files.

If you get <b>"ERROR 404: Not Found."</b> the acolite version has changed. Visit their website to determine the new version and update the Dockerfile. Also, file an issue and I will update.

Run:
<pre><code>docker run -it -v /mnt:/mnt acolite_version</pre></code>

This will cross mount the local /mnt directory with the container /mnt directory. Windows users will need to substitute the local directory they shared with Docker for the fisrt /mnt. Similar to:

<pre><code>docker run -it -v C:\path\to\share:/mnt acolite_version</pre></code>

The working directory (/mnt/acolite) will be created on the local machine and the container will start there (see WORKDIR in Dockerfile):

Get the example data used in manual:
<pre><code>gsutil -m cp -r gs://gcp-public-data-sentinel-2/tiles/31/U/ES/S2A_MSIL1C_20170526T105031_N0205_R051_T31UES_20170526T105518.SAFE/ ./ </pre></code>

Settings file for demo data:
<pre><code>inputfile=/mnt/acolite/S2A_MSIL1C_20170526T105031_N0205_R051_T31UES_20170526T105518.SAFE 
output=/mnt/acolite
limit=51.3,3.0,51.4,3.25
l2w_parameters=rhos_*</pre></code>

Put the settings in to a file (settings.txt) and run:

<pre><code>acolite --cli --settings=settings.txt</pre></code>

The output should look something like this:

![Alt text](/S2A_MSI_2017_05_26_10_50_31_T31UES_rgb_rhos.jpg?raw=true "acolite output")
