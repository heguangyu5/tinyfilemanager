tinyfilemanager:
	bpc -v                                          \
		--static                                    \
		--althttpd                                  \
		-c bpc.conf                                 \
		-d max_execution_time=30                    \
		-d upload_max_filesize=50M                  \
		-d post_max_size=60M                        \
		-d memory_limit=512M                        \
		-d log_errors=on                            \
		-d date.timezone=Asia/Shanghai              \
		-d sys_temp_dir=/tmp/tinyfilemanager/tmp    \
		-d session.gc_maxlifetime=604800            \
		-d session.cookie_httponly=1                \
		tinyfilemanager.php                         \
		translation.json

clean:
	@rm -rf .bpc-build-* md5.map

run:
	mkdir -p /tmp/tinyfilemanager/tmp && mkdir -p /tmp/tinyfilemanager/public && chown -R www-data:www-data /tmp/tinyfilemanager && ./tinyfilemanager -project-name tinyfilemanager -port 7878 -home-page tinyfilemanager.php -root /tmp/tinyfilemanager/public -user www-data

run-docker:
	mkdir -p /tmp/tinyfilemanager/tmp && mkdir -p /tmp/tinyfilemanager/public && chown -R www-data:www-data /tmp/tinyfilemanager && docker run -v `pwd`:/bpc-app -v /tmp/tinyfilemanager:/tmp/tinyfilemanager -p 7878:7878 -it heguangyu5/bpc-base ./tinyfilemanager -project-name tinyfilemanager -port 7878 -home-page tinyfilemanager.php -root /tmp/tinyfilemanager/public -user www-data

run-docker-docker-build:
	mkdir -p /tmp/tinyfilemanager/tmp && mkdir -p /tmp/tinyfilemanager/public && chown -R www-data:www-data /tmp/tinyfilemanager && docker run -v `pwd`:/bpc-app -v /tmp/tinyfilemanager:/tmp/tinyfilemanager -p 7878:7878 -it heguangyu5/bpc-base ./tinyfilemanager -project-name bpc-workspace -port 7878 -home-page tinyfilemanager.php -root /tmp/tinyfilemanager/public -user www-data
