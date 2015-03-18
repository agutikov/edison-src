## Intel Edison Yocto sources


### Build Edison Yocto image

	# optional  
	./device-software/setup.sh --help  
	# then run ./device-software/setup.sh with new options  
	# or edit build/conf/bblayers.conf and build/conf/local.conf  

	# after relocation of edison-src directory clear sstate_dir

	source poky/oe-init-build-env

	bitbake edison-image

	../device-software/utils/flash/postBuild.sh

	ls build/toFlash



### Where this sources from

Download [edison-src-ww05-15.tgz](http://www.intel.com/support/edison/sb/CS-035180.htm)

Run  
	./device-software/setup.sh \  
		--dl_dir=/home/user/work/edison/bb_downloads/ \  
		--sstate_dir=/home/user/work/edison/bb_sstate/ \  
		--bb_number_thread=4 \  
		--parallel_make=4  
