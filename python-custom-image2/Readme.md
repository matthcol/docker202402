# build image (arg default APP=hello.py)
docker build -t python_custom:2.0 .
docker build -t python_custom:2.1 --build-arg APP=compute.py .

# inspect image
docker inspect python_custom:2.0

# run container with this image
docker run -it --rm python_custom:2.0
docker run -it --rm -e MAIN=compute.py python_custom:2.0
docker run -it --rm python_custom:2.1

# extra args are given to docker-entrypoint.sh (-i -e)
docker run -it --rm python_custom:2.0 -i -e