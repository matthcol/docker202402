# build image
docker build . -t python_custom
docker build . -t python_custom:1.0

# see all outputs
docker build -t python_custom:1.0 --progress=plain --no-cache .

# args
docker build -t python_custom:1.2 --build-arg APP=compute.py .

# run a container with image
docker run -it python_custom:1.0