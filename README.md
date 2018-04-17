# turtlecoind

Add your own config and build the image:

```docker build -t turtlecoind .```

Then start a container:

```docker run -d -p 11898:11898 turtlecoind```

___

You can also run using the prebuilt image from hub.docker.com (this will use the default config):

```docker run -d -p 11898:11898 andrewnk/turtlecoind```