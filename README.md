# dff-tc-agent

Runs a TeamCity Agent in a docker container.

On [Docker Hub](https://hub.docker.com/r/illegalentity/dff-tc-agent/)

## Docker Commands

### Build the docker image

```docker build -t dff-tc-agent ./```

### Create a container

```docker run --restart=unless-stopped -e SERVER_URL="xxx.xxx.xxx.xxx" -e AGENT_NAME="agentname" --name="dff-tc-agent" -v $HOME/.ssh:/root/.ssh -v /some/path:/data/teamcity_agent/conf illegalentity/dff-tc-agent```

### Open a TTY in the container

```docker exec -it dff-tc-agent bash```

## Todo in a new container

### Modify TeamCity Config

Add the following lines to ```/data/teamcity_agent/conf/buildAgent.properties```

```shell
teamcity.git.use.native.ssh=true
env.CORDOVA_VERSION=X
env.ANDROID_HOME=/opt/android-sdk
```

### Authenticate DFF NPM Registry

```npm adduser --registry https://npm.dff-solutions.de```

### Store GIT HTTP Credentials

Manually checkout a private dff repository on GitHub.

## Resources

- [Android SDK](https://developer.android.com/studio/#downloads)
- [Base Docker Image](https://hub.docker.com/r/jetbrains/teamcity-agent/)
- [SDKMAN](https://sdkman.io/)
- [Gradle](https://gradle.org/)
