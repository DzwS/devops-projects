[link](https://www.techworld-with-nana.com/gitlab-cicd-course)


## chapter 1: ingroduction to CI/CD and gitlab
1. what is CI/CD
2. introduction to gitlab CI/CD
3. how gitlab compares to other CI/CD platforms

## chapter 2: core concepts of gitlab CI/CD
1. chapter introduction
2. jobs: basic building blocks of pipeline
3. execute pipeline
4. stages: group jobs
5. needs: dependency between jobs
6. script: inline shell commands and executing shell script
7. only:specify when job should run 
8. workflow rules: control pipeline behavior
9. tigger pipeline on merge request
10. predefined CI/CD variables in gitlab
11. define custom variables

## chapter 3: gitlab architecture
1. gitlab runners for running the jobs
2. gitlab executors - different executor types
3. job execution flow
4. docker executor
5. specific runners:runner for specific project
6. demo overview: configure self-managed runners
7. install & register local runner on macos
8. install & register local runner on windows
9. aws pre-requisite
10. install & register an aws ec2 runner
11. execute jobs on specific runner(tags)
12. add docker runner on ec2 instance
13. group runners:runner for a gitlab group
14. self-managerd gitlab instance
15. note on gitlab runner versions compatibility
16. gitlab architecture recap

## chapter 4: build a real life CI/CD pipeline for node.js application
1. demo overview & node.js project overview
2. run unit tests & collect test reports
3. build docker image & push to private registry
4. deploy to dev server
5. gitlab environments: describe where code is deployed
6. deploy with docker compose


## optimize CI/CD pipeline & configure multi-state pipeline
1. section overview
2. configure dynamic versioning for docker image
3. configure caching to speed up pipeline execution
4. testing in CI/CD & configure security tests(SAST)
5. intro to multi-state deployments(multi-state demo-part1)
6. promote to statging(multi-state demo - part2)
7. reuse pipeline configurationusing extends(multi-stage demo - part3)
8. promote to production(multi-stage demo - part4)

## CI/CD microservice application (mono and polyrepo)
1. what are microservices
2. monorepo vs polyrepo
3. demo overview
4. monorepo - start services locally and get to know the application
5. prepare deployment server (monirepo demo - part 1)
6. build micro servies (monorepo demo - part 2)
7. deploy micro services (monorepo demo - part 3)
8. CI/CD pipeline for polyrepo
9. extract command logic(job template - part1)
10. CI templates - library for all projects (job templates - part2)

## deploy microservices to kubernetes cluster
1. introducation & demo overview
2. pre-requisite: kubernetes crash course
3. create a k8s cluster on lke
4. create gitlkab user with restricted permissions
5. deploy to kubernetes part 1
6. deploy to kubernetes part 2
7. wrap up & delete all cloud resources