pipeline {
   agent {
       docker {
           image 'fedora:31'
       }
   }

   stages {
      stage('Build') {
         steps {
            echo 'Building or resolve dependences'
            sh 'cat /etc/*-release'
            sh 'dnf upgrade -y >/dev/null && echo OK'
            sh 'dnf install -y python37 >/dev/null && echo OK'
            sh 'dnf install -y chromedriver-stable >/dev/null && echo OK'
            sh 'dnf install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm >/dev/null && echo OK'
            sh 'chown root /usr/bin/chromedriver >/dev/null && echo OK'
            sh 'chmod +x /usr/bin/chromedriver >/dev/null && echo OK'
            sh 'chmod 755 /usr/bin/chromedriver >/dev/null && echo OK'
            sh 'chromedriver --version'
            sh 'python --version'
            sh 'pip3 install robotframework robotframework-seleniumlibrary robotframework-requests | grep "Successfully installed"'
         }
      }
      stage('Test') {
        steps {
            echo 'Running regression tests'
            sh 'robot -d ./results -v BROWSER:headlesschrome ./tests'
        }
      }
      stage('Prod') {
         steps {
            echo 'System is ready'
         }
      }
   }
}
