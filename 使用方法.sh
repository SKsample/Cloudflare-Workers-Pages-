构建命令: bash build.sh  #生成构建脚本

GO项目
go build # 仅生成二进制文件，未运行程序，无法生成输出目录
go build -o generator main.go && ./generator  # 编译后运行，生成输出目录
go build -o compressor compress.go && ./compressor && cp -r src/* example/dump/bilibiliroom/  # 编译+运行+复制
go install
go mod init（推荐）


PHP项目
# 安装 PHP 和扩展
sudo apt-get update && 
sudo apt-get install -y php$PHP_VERSION php$PHP_VERSION-{mbstring,gd,curl,xml,zip} &&

# 安装 Composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer &&

# 安装项目依赖
composer install --no-dev --optimize-autoloader &&

# 运行构建脚本
php build.php




框架预设：有框架则选，无框架则不选


构建输出目录：项目目录
根目录：一般为项目名称，默认/即可。

环境变量
GO_BUILD_VERSION：版本号
PHP_VERSION：版本号
PHP_EXTENSIONS：mbstring,gd,curl  #需要的 PHP 扩展（根据项目需求调整）
PHP_MEMORY_LIMIT：256M	#PHP内存限制
BUILD_DIR：public	#构建输出目录
NODE_VERSION：20	#如果项目需要 Node.js
COMPOSER_MEMORY_LIMIT：-1	#禁用 Composer 内存限制


PHP构建处理

php.ini 
在项目根目录创建 .user.ini 文件：
; .user.ini
memory_limit = 256M
upload_max_filesize = 64M
post_max_size = 64M
max_execution_time = 120

Laravel:
Bash
# 构建命令
composer install --no-dev --optimize-autoloader
php artisan config:cache
php artisan route:cache
php artisan view:cache

WordPress (静态站点导出):
Bash
# 构建命令
wget https://raw.githubusercontent.com/WP2Static/wp2static/main/deployments/cloudflare-workers/cloudflare-workers.php
php cloudflare-workers.php
