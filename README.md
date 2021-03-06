# GeoDevelopers.org website
Source code of our community site, [theses slides shows what we want to achieve with this site and how](https://docs.google.com/presentation/d/18zXqx5RdCLdoSkhwlZLPHN4Tbg5tcQCw0A1vn927mio/pub?start=false&loop=false&delayms=3000)

# Requirements
**Software**:
* Operative System: Windows/Linux/OS X
* Applicactions:
  * [Apache](https://httpd.apache.org/download.cgi) >= 2.2.31
  * [PHP](http://php.net/downloads.php) >= 5.5.8
  * [MySQL](https://www.mysql.com/downloads/) >= 5.6.15
  * [Composer](https://getcomposer.org/download/) >= 1.0.0

**Hardware**: 
* Whatever you need to make that software run ^_^

# How to install

The easiest way to install this site is:

1. Download and install [WAMP](http://www.wampserver.com/en/) (for Windows), [LAMP](https://bitnami.com/stack/lamp/installer) (for Linux) or [MAMP](https://www.mamp.info/en/) (for Mac)
2. [Download and unzipp last version of this project](https://github.com/Geo-Developers/geo-developers-site/archive/master.zip) inside the Apache public folder (or clone it)
3. Create an empty database and user using PhpMyAdmin (included in Wamp/Lamp/Mamp)
4. Import [the database schema](https://github.com/Geo-Developers/geo-developers-site/blob/master/install/database.sql) to your database
5. Create a config.php based on [config.php.sample.php](https://github.com/Geo-Developers/geo-developers-site/blob/master/config.php.sample.php) schema.

Now you should be able to run your application succesfuly.
