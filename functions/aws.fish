function aws --description 'aws-cli in docker'
  docker run \
    --rm \
    --interactive \
    --tty \
    --env HTTP_PROXY=(string replace --regex --ignore-case '\\blocalhost\\b' host.docker.internal $HTTP_PROXY) \
    --env HTTPS_PROXY=(string replace --regex --ignore-case '\\blocalhost\\b' host.docker.internal $HTTPS_PROXY) \
    --env AWS_PROFILE \
    --volume ~/.aws:/root/.aws \
    --volume (pwd):/aws \
    amazon/aws-cli \
    $argv
end
