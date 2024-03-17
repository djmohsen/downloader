# downloader
download files suing proxy list

testing with CENTOS7 & UBUNTU20.4


    chmod +x download_service.sh

fil /etc/systemd/system/download_service.service with:

    [Unit]
    Description=Download Service
    After=network.target
    [Service]
    Type=simple
    ExecStart=/path/to/download_service.sh
    Restart=always
    [Install]
    WantedBy=multi-user.target



![telegram-cloud-photo-size-4-6033100527757278628-x](https://github.com/djmohsen/downloader/assets/1389139/d407e9b3-55ff-4008-b755-543fde483da5)

 در یک صفحه نوار های سرعت و استفاده رو نشان بدهید
کدام پروکسی ها در حال دانلود
هر کدام با چه سرعتی
جمع کل سرعت مصرفی
