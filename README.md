# docker-acolite
Dockerfile to set up acolite and gsutil on an Ubuntu 18.04 image.

http://odnature.naturalsciences.be/remsem/software-and-data/acolite

Build the docker container with:
<pre><code>docker build -t acolite_version . </pre></code>

Run:
<pre><code>docker run -it -v /mnt:/mnt acolite_version</pre></code>

The build process puts gsutil and acolite in /usr/local/bin so the commands don't need the full path to the binary files.

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

<img src='/9j/4AAQSkZJRgABAQIAdgB2AAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCAALABEDAREAAhEBAxEB/8QAFwAAAwEAAAAAAAAAAAAAAAAABAYHBf/EACgQAAECBgEDAwUAAAAAAAAAAAECAwQFBgcREgATITEIQVYXUZKV0v/EABgBAQEAAwAAAAAAAAAAAAAAAAQCAQUG/8QAIxEAAgICAAUFAAAAAAAAAAAAAQIAAwQRBRIUUnEVIUFhof/aAAwDAQACEQMRAD8A3fU5VNx5ffyrmJfcKeQsuZjUBmEaj3UtMp6SOyUg4T3z44ay3RInGcRybkynVWIHmLEkqS60whFTRqvqhaZafbZ6ypi8kJKkqO2dgNRr3Oe2ffxwb5PJ8zOJVm5gLK50Psy69e6nz6M/bO8nrlm49PzO/wDZfawsXaip6yj6hn1HsRkwiXC666uIeG6wgAEpCwnwB7cbbUrb3FNhY9lxsZdmAiw9p4paDEUihwFScpMXEanXOoI6mMD7cOuJSrbA9/Jj1GgNR0+kduPicJ+S/wCuI6Wntl6E/9k=' />
