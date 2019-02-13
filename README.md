# docker-acolite
Dockerfile to set up acolite and gsutil on an Ubuntu 18.04 image.

http://odnature.naturalsciences.be/remsem/software-and-data/acolite

Build the docker container with:
docker build -t acolite-<version> .

Run:
docker run -it -v /mnt:/mnt acolite-<version>

# get example data used in manual
gsutil -m cp -r gs://gcp-public-data-sentinel-2/tiles/31/U/ES/S2A_MSIL1C_20170526T105031_N0205_R051_T31UES_20170526T105518.SAFE/ ./

# settings for demo data
inputfile=/software/S2A_MSIL1C_20170526T105031_N0205_R051_T31UES_20170526T105518.SAFE 
output=/mnt/acolite
limit=51.3,3.0,51.4,3.25
l2w_parameters=rhos_*
