FROM jetbrains/teamcity-agent
LABEL maintainer="Daevid Preis <daevid.preis@gmail.com>"

ADD sdk-tools-linux-4333796.zip /
ADD utils/colors /utils/colors

VOLUME ["/root/.ssh"]

RUN apt-get update && \
    apt-get install -y wget vim sudo zip unzip openjdk-8-jdk openjdk-9-jre git iputils-ping build-essential; \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'; \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - ; \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - ; \
    apt-get update && \
    apt-get install -y google-chrome-stable nodejs; \
    npm i -g bower gulp cordova ionic yarn rollup typescript; \
    npm set "@dff:registry" https://npm.dff-solutions.de; \
    git config --global credential.helper store; \
    mkdir -p /opt/android-sdk; \
    unzip /sdk-tools-linux-4333796.zip -d /opt/android-sdk/; \
    rm -f /sdk-tools-linux-4333796.zip; \
    echo Y | /opt/android-sdk/tools/bin/sdkmanager --install tools; \
    echo Y | /opt/android-sdk/tools/bin/sdkmanager --install platform-tools; \
    echo Y | /opt/android-sdk/tools/bin/sdkmanager --install "build-tools;25.0.3"; \
    ln -s /opt/android-sdk/tools/bin/sdkmanager /usr/bin/sdkmanager; \
    sh -c 'echo PATH=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/android-sdk/tools:/opt/android-sdk/platform-tools\" > /etc/environment; echo ANDROID_HOME=\"/opt/android-sdk\" >> /etc/environment; echo CHROME_BIN=\"/usr/bin/google-chrome\" >> /etc/environment'; \
    sh -c 'echo export PATH=\"$PATH:/opt/android-sdk/tools:/opt/android-sdk/platform-tools\" >> /root/.bashrc'; \
    sh -c 'echo export ANDROID_HOME=\"/opt/android-sdk\" >> /root/.bashrc'; \
    sh -c 'echo export CHROME_BIN=\"/usr/bin/google-chrome\" >> /root/.bashrc'; \
    git config --global credential.helper store; \
    curl -s "https://get.sdkman.io" | bash; \
    bash -c 'source "$HOME/.sdkman/bin/sdkman-init.sh"; sdk install gradle'; \
    sh -c 'echo "if [ -e /utils/colors ]; then . /utils/colors; fi;" >> /etc/bash.bashrc'; \
    sh -c 'echo "echo; echo" >> /etc/bash.bashrc'; \
    sh -c 'echo "echo -e \"                \${purple}▬▬ι════════ﺤ   -════════ι▬▬\$iblue\"" >> /etc/bash.bashrc'; \
    sh -c 'echo "echo -e \"                ___________________________\"" >> /etc/bash.bashrc'; \
    sh -c 'echo "echo -e \"                ___  __ \__  ____/__  ____/\"" >> /etc/bash.bashrc'; \
    sh -c 'echo "echo -e \"                __  / / /_  /_   __  /_ \"" >> /etc/bash.bashrc'; \
    sh -c 'echo "echo -e \"                _  /_/ /_  __/   _  __/ \"" >> /etc/bash.bashrc'; \
    sh -c 'echo "echo -e \"                /_____/ /_/      /_/ \"" >> /etc/bash.bashrc'; \
    sh -c 'echo "echo -e \"                \$clroff\"" >> /etc/bash.bashrc'; \
    sh -c 'echo "echo -e \"                \${purple}▬▬ι════════ﺤ   -════════ι▬▬\$clroff\"" >> /etc/bash.bashrc'; \
    sh -c 'echo "echo; echo" >> /etc/bash.bashrc'; \
    sh -c 'echo "echo -e \"                        \${yellow}╭∩╮(\${clroff}Ο\${yellow}_\${clroff}Ο\${yellow})╭∩╮\"" >> /etc/bash.bashrc'; \
    sh -c 'echo "echo -e \"               \${red}Welcome \${green}to \${yellow}dff \${blue}TeamCity \${red}Agent!\$clroff\"" >> /etc/bash.bashrc'; \
    sh -c "echo \"echo -e \\\"                    ̿' ̿'\̵͇̿̿\з=(\\\${purple}◕\\\${clroff}_\\\${purple}◕\\\${clroff})=ε/̵͇̿̿/'̿'̿ ̿\\\"\" >> /etc/bash.bashrc"; \
    sh -c 'echo "echo; echo" >> /etc/bash.bashrc';
