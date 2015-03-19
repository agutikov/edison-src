## Intel Edison Yocto sources


### Build Edison Yocto image

	# edit build/conf/bblayers.conf and build/conf/local.conf  
	# after relocation of edison-src directory clear SSTATE_DIR  

	source poky/oe-init-build-env

	bitbake edison-image

	../device-software/utils/flash/postBuild.sh

	ls build/toFlash

### Content

`./arduino` - ?

`./broadcom_cws` - ?

`./build` - build directory

`./build/conf` - configuration

`./device-software` - edison layers

`./mw` - ?

`./poky` - yocto poky base layers from poky-daisy-11.0.1.tar.bz2

`./README.md` - this file


### TODO

* Use layers from git:
 * Find related yocto-poky git - origin of poky-daisy-11.0.1.tar.bz2
 * Find related edison git - origin of device-software
 * Find what are ./arduino, ./broadcom_cws and ./mw directories


### Where this sources from

Download [edison-src-ww05-15.tgz](http://www.intel.com/support/edison/sb/CS-035180.htm)

Run:

	./device-software/setup.sh \  
		--dl_dir=/home/user/work/edison/bb_downloads/ \  
		--sstate_dir=/home/user/work/edison/bb_sstate/ \  
		--bb_number_thread=4 \  
		--parallel_make=4  

Remove:

	poky/meta-mingw/  
	poky/meta-darwin/  
	device-software/meta-mingw/  
	device-software/utils/*.patch  
	device-software/utils/*.tar.bz2  
	device-software/utils/Makefile.mk  
	device-software/setup.sh  
	Makefile  

