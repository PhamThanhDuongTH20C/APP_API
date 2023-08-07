<!--
Created: Thu May 28 2020 12:00:58 GMT+0900 (日本標準時)
Modified: Thu JAN 10 2023 16:49:15 GMT+0900 (日本標準時)
-->

# Prepare for training

&copy; 2023 RiverCrane Corp.

Estimated time: 0.5 day.

---

## Clone Training Project

* Open [this training project](https://redmine.ig.webike.net/gitbucket/Training-VN/WPNTrainingKit) on your browser. If you do not have access to GitBucket, please contact the administrator to grant access.
* Click [Fork](https://redmine.ig.webike.net/gitbucket/Training-VN/WPNTrainingKit/fork) button on the top right corner, then choose the link @username ( `username` is your GitBucket login username) to make a copy of the training project.
* Clone the copied repository to your local computer at `~/Training/` .

``` bash
rm -rf ~/Training/
mkdir -p ~/Training/
git clone https://redmine.ig.webike.net/gitbucket/git/<username>/WPNTrainingKit.git ~/Training/

git fetch --all --prune
git submodule update
```

※ `<username>` is your GitBucket login username

## For APP development

### Initialize the mobile project

* Open Git Bash (or Terminal on Mac), change working directory to `~/Training/` .
* Then run `bash ./mobile_app/init.sh` to init Flutter development environment.

``` bash
cd ~/Training/
bash ./mobile_app/init.sh
```

### Run the project on simulator

* Launch a simulator.
* Once it finished, try running `bash ./mobile_app/run.sh` to run the sample app on simulator.
* ✅ If everything is OK, you may start develop from here. View the **Test manual** section for details.
* ⚠️ If there was an error, please <u>try solving by yourself first (**Google it**)</u>.

``` bash
cd ~/Training/
bash ./mobile_app/run.sh
```


---

✅ If everything is OK, you may start develop from here. View the [Training manual](./test-manual.md#) for details.

---

* [Home](../readme.md#)
* [Setup Tools](./setup.md#)
* [Prepare for training](./prepare.md#)
* [Training manual](./test-manual.md#)

---

This project is only accessible within RiverCrane Corp.

&copy; 2023 RiverCrane Corp.
