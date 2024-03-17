# downloader
download files suing proxy list

testing with CENTOS7 & UBUNTU20.4


> chmod +x download_service.sh


> [Unit]
> Description=Download Service
> After=network.target
> [Service]
> Type=simple
> ExecStart=/path/to/download_service.sh
> Restart=always
> [Install]
> WantedBy=multi-user.target
