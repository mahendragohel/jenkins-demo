pipelineJob('pipelineJob') {
    definition {
        cps {
            script(readFileFromWorkspace('pipelineJob.groovy'))
            sandbox()
        }
    }
}
pipelineJob('spring-boot-api-example') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url 'https://github.com/mahendragohel/spring-boot-api-example.git'
                    }
                    branch 'master'
                }
            }
        }
    }
}

pipelineJob('kafka-example') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url 'https://github.com/mahendragohel/maven-docker-example.git'
                    }
                    branch 'master'
                }
            }
        }
    }
}