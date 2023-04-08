<?php
/**
 * This is project's console commands configuration for Robo task runner.
 *
 * @see https://robo.li/
 */
class RoboFile extends \Robo\Tasks
{
    // define public methods as commands
    public function buildImage()
    {
        $version = time();
        $this->_exec("docker build -t chatchan . && docker tag chatchan easychen/chatchan:latest && docker push easychen/chatchan:latest&& docker tag chatchan easychen/chatchan:$version && docker push easychen/chatchan:$version");
        $this->say("Build image easychen/chatchan:$version");
    }
}
