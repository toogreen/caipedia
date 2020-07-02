-- phpMyAdmin SQL Dump
-- version 2.11.8.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 03, 2008 at 02:39 PM
-- Server version: 5.0.67
-- PHP Version: 5.2.6-2ubuntu3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `caipedia1`
--

-- --------------------------------------------------------

--
-- Table structure for table `cp1_archive`
--

CREATE TABLE IF NOT EXISTS `cp1_archive` (
  `ar_namespace` int(11) NOT NULL default '0',
  `ar_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `ar_text` mediumblob NOT NULL,
  `ar_comment` tinyblob NOT NULL,
  `ar_user` int(10) unsigned NOT NULL default '0',
  `ar_user_text` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  `ar_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ar_minor_edit` tinyint(4) NOT NULL default '0',
  `ar_flags` tinyblob NOT NULL,
  `ar_rev_id` int(10) unsigned default NULL,
  `ar_text_id` int(10) unsigned default NULL,
  `ar_deleted` tinyint(3) unsigned NOT NULL default '0',
  `ar_len` int(10) unsigned default NULL,
  `ar_page_id` int(10) unsigned default NULL,
  KEY `name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  KEY `usertext_timestamp` (`ar_user_text`,`ar_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_archive`
--


-- --------------------------------------------------------

--
-- Table structure for table `cp1_categorylinks`
--

CREATE TABLE IF NOT EXISTS `cp1_categorylinks` (
  `cl_from` int(10) unsigned NOT NULL default '0',
  `cl_to` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `cl_sortkey` varchar(70) character set latin1 collate latin1_bin NOT NULL default '',
  `cl_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  UNIQUE KEY `cl_from` (`cl_from`,`cl_to`),
  KEY `cl_sortkey` (`cl_to`,`cl_sortkey`,`cl_from`),
  KEY `cl_timestamp` (`cl_to`,`cl_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_categorylinks`
--

INSERT INTO `cp1_categorylinks` (`cl_from`, `cl_to`, `cl_sortkey`, `cl_timestamp`) VALUES
(10, 'English', 'Caipedia:Privacy policy', '2008-01-26 08:19:28'),
(10, 'Policy', 'Caipedia:Privacy policy', '2008-01-26 08:19:28');

-- --------------------------------------------------------

--
-- Table structure for table `cp1_externallinks`
--

CREATE TABLE IF NOT EXISTS `cp1_externallinks` (
  `el_from` int(10) unsigned NOT NULL default '0',
  `el_to` blob NOT NULL,
  `el_index` blob NOT NULL,
  KEY `el_from` (`el_from`,`el_to`(40)),
  KEY `el_to` (`el_to`(60),`el_from`),
  KEY `el_index` (`el_index`(60))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_externallinks`
--

INSERT INTO `cp1_externallinks` (`el_from`, `el_to`, `el_index`) VALUES
(3, 0x687474703a2f2f7777772e656174696e676368696e612e636f6d2f726563697065732f726963652e68746d, 0x687474703a2f2f636f6d2e656174696e676368696e612e7777772e2f726563697065732f726963652e68746d),
(4, 0x687474703a2f2f7777772e656174696e676368696e612e636f6d2f696d616765732d726563697065732f6672696564726963652e6a7067, 0x687474703a2f2f636f6d2e656174696e676368696e612e7777772e2f696d616765732d726563697065732f6672696564726963652e6a7067),
(9, 0x6d61696c746f3a746f6f677265656e40676d61696c2e636f6d, 0x6d61696c746f3a636f6d2e676d61696c40746f6f677265656e2e),
(10, 0x687474703a2f2f43616970656469612e6f72672f77696b692f43616970656469615f70726f6a656374733a56696c6c6167655f70756d70, 0x687474703a2f2f6f72672e63616970656469612e2f77696b692f43616970656469615f70726f6a656374733a56696c6c6167655f70756d70);

-- --------------------------------------------------------

--
-- Table structure for table `cp1_filearchive`
--

CREATE TABLE IF NOT EXISTS `cp1_filearchive` (
  `fa_id` int(11) NOT NULL auto_increment,
  `fa_name` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `fa_archive_name` varchar(255) character set latin1 collate latin1_bin default '',
  `fa_storage_group` varbinary(16) default NULL,
  `fa_storage_key` varbinary(64) default '',
  `fa_deleted_user` int(11) default NULL,
  `fa_deleted_timestamp` binary(14) default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted_reason` text,
  `fa_size` int(10) unsigned default '0',
  `fa_width` int(11) default '0',
  `fa_height` int(11) default '0',
  `fa_metadata` mediumblob,
  `fa_bits` int(11) default '0',
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') default NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart') default 'unknown',
  `fa_minor_mime` varbinary(32) default 'unknown',
  `fa_description` tinyblob,
  `fa_user` int(10) unsigned default '0',
  `fa_user_text` varchar(255) character set latin1 collate latin1_bin default NULL,
  `fa_timestamp` binary(14) default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`fa_id`),
  KEY `fa_name` (`fa_name`,`fa_timestamp`),
  KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  KEY `fa_deleted_user` (`fa_deleted_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cp1_filearchive`
--


-- --------------------------------------------------------

--
-- Table structure for table `cp1_hitcounter`
--

CREATE TABLE IF NOT EXISTS `cp1_hitcounter` (
  `hc_id` int(10) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1 MAX_ROWS=25000;

--
-- Dumping data for table `cp1_hitcounter`
--


-- --------------------------------------------------------

--
-- Table structure for table `cp1_image`
--

CREATE TABLE IF NOT EXISTS `cp1_image` (
  `img_name` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `img_size` int(10) unsigned NOT NULL default '0',
  `img_width` int(11) NOT NULL default '0',
  `img_height` int(11) NOT NULL default '0',
  `img_metadata` mediumblob NOT NULL,
  `img_bits` int(11) NOT NULL default '0',
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') default NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart') NOT NULL default 'unknown',
  `img_minor_mime` varbinary(32) NOT NULL default 'unknown',
  `img_description` tinyblob NOT NULL,
  `img_user` int(10) unsigned NOT NULL default '0',
  `img_user_text` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  `img_timestamp` varbinary(14) NOT NULL default '',
  `img_sha1` varbinary(32) NOT NULL default '',
  PRIMARY KEY  (`img_name`),
  KEY `img_usertext_timestamp` (`img_user_text`,`img_timestamp`),
  KEY `img_size` (`img_size`),
  KEY `img_timestamp` (`img_timestamp`),
  KEY `img_sha1` (`img_sha1`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_image`
--


-- --------------------------------------------------------

--
-- Table structure for table `cp1_imagelinks`
--

CREATE TABLE IF NOT EXISTS `cp1_imagelinks` (
  `il_from` int(10) unsigned NOT NULL default '0',
  `il_to` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  UNIQUE KEY `il_from` (`il_from`,`il_to`),
  KEY `il_to` (`il_to`,`il_from`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_imagelinks`
--

INSERT INTO `cp1_imagelinks` (`il_from`, `il_to`) VALUES
(3, 'Friedrice.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cp1_interwiki`
--

CREATE TABLE IF NOT EXISTS `cp1_interwiki` (
  `iw_prefix` varchar(32) NOT NULL,
  `iw_url` blob NOT NULL,
  `iw_local` tinyint(1) NOT NULL,
  `iw_trans` tinyint(4) NOT NULL default '0',
  UNIQUE KEY `iw_prefix` (`iw_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_interwiki`
--

INSERT INTO `cp1_interwiki` (`iw_prefix`, `iw_url`, `iw_local`, `iw_trans`) VALUES
('abbenormal', 0x687474703a2f2f7777772e6f7572706c612e6e65742f6367692d62696e2f70696b69652e6367693f2431, 0, 0),
('acronym', 0x687474703a2f2f7777772e6163726f6e796d66696e6465722e636f6d2f61662d71756572792e6173703f537472696e673d6578616374264163726f6e796d3d2431, 0, 0),
('advogato', 0x687474703a2f2f7777772e6164766f6761746f2e6f72672f2431, 0, 0),
('aiwiki', 0x687474703a2f2f7777772e6966692e756e697a682e63682f61696c61622f616977696b692f6169772e6367693f2431, 0, 0),
('annotationwiki', 0x687474703a2f2f7777772e7365656477696b692e636f6d2f706167652e63666d3f77696b6969643d33363826646f633d2431, 0, 0),
('arxiv', 0x687474703a2f2f7777772e61727869762e6f72672f6162732f2431, 0, 0),
('bemi', 0x687474703a2f2f62656d692e667265652e66722f76696b696f2f696e6465782e7068703f2431, 0, 0),
('c2find', 0x687474703a2f2f63322e636f6d2f6367692f77696b693f46696e64506167652676616c75653d2431, 0, 0),
('cache', 0x687474703a2f2f7777772e676f6f676c652e636f6d2f7365617263683f713d63616368653a2431, 0, 0),
('cliki', 0x687474703a2f2f77772e74656c656e742e6e65742f636c696b692f2431, 0, 0),
('cmwiki', 0x687474703a2f2f7777772e6f7572706c612e6e65742f6367692d62696e2f77696b692e706c3f2431, 0, 0),
('codersbase', 0x687474703a2f2f7777772e636f64657273626173652e636f6d2f696e6465782e7068702f2431, 0, 0),
('commons', 0x687474703a2f2f636f6d6d6f6e732e77696b696d656469612e6f72672f77696b692f2431, 0, 0),
('consciousness', 0x687474703a2f2f746561647675732e696e73706972616c2e6f72672f, 0, 0),
('corpknowpedia', 0x687474703a2f2f636f72706b6e6f7770656469612e6f72672f77696b692f696e6465782e7068702f2431, 0, 0),
('creationmatters', 0x687474703a2f2f7777772e6f7572706c612e6e65742f6367692d62696e2f77696b692e706c3f2431, 0, 0),
('dejanews', 0x687474703a2f2f7777772e64656a612e636f6d2f3d646e632f676574646f632e78703f414e3d2431, 0, 0),
('dictionary', 0x687474703a2f2f7777772e646963742e6f72672f62696e2f446963743f44617461626173653d2a26466f726d3d44696374312653747261746567793d2a2651756572793d2431, 0, 0),
('disinfopedia', 0x687474703a2f2f7777772e646973696e666f70656469612e6f72672f77696b692e7068746d6c3f7469746c653d2431, 0, 0),
('diveintoosx', 0x687474703a2f2f64697665696e746f6f73782e6f72672f2431, 0, 0),
('docbook', 0x687474703a2f2f77696b692e646f63626f6f6b2e6f72672f746f7069632f2431, 0, 0),
('dolphinwiki', 0x687474703a2f2f7777772e6f626a6563742d617274732e636f6d2f77696b692f68746d6c2f446f6c7068696e2f2431, 0, 0),
('drumcorpswiki', 0x687474703a2f2f7777772e6472756d636f72707377696b692e636f6d2f696e6465782e7068702f2431, 0, 0),
('dwjwiki', 0x687474703a2f2f7777772e737562657269632e6e65742f6367692d62696e2f64776a2f77696b692e6367693f2431, 0, 0),
('echei', 0x687474703a2f2f7777772e696b736f2e6e65742f6367692d62696e2f77696b692e706c3f2431, 0, 0),
('ecxei', 0x687474703a2f2f7777772e696b736f2e6e65742f6367692d62696e2f77696b692e706c3f2431, 0, 0),
('efnetceewiki', 0x687474703a2f2f7075726c2e6e65742f77696b692f632f2431, 0, 0),
('efnetcppwiki', 0x687474703a2f2f7075726c2e6e65742f77696b692f6370702f2431, 0, 0),
('efnetpythonwiki', 0x687474703a2f2f7075726c2e6e65742f77696b692f707974686f6e2f2431, 0, 0),
('efnetxmlwiki', 0x687474703a2f2f7075726c2e6e65742f77696b692f786d6c2f2431, 0, 0),
('elibre', 0x687474703a2f2f656e6369636c6f70656469612e75732e65732f696e6465782e7068702f2431, 0, 0),
('eljwiki', 0x687474703a2f2f656c6a2e736f75726365666f7267652e6e65742f70687077696b692f696e6465782e7068702f2431, 0, 0),
('emacswiki', 0x687474703a2f2f7777772e656d61637377696b692e6f72672f6367692d62696e2f77696b692e706c3f2431, 0, 0),
('eokulturcentro', 0x687474703a2f2f6573706572616e746f2e746f756c6f7573652e667265652e66722f77616b6b612e7068703f77696b693d2431, 0, 0),
('evowiki', 0x687474703a2f2f7777772e65766f77696b692e6f72672f696e6465782e7068702f2431, 0, 0),
('eÄ‰ei', 0x687474703a2f2f7777772e696b736f2e6e65742f6367692d62696e2f77696b692e706c3f2431, 0, 0),
('finalempire', 0x687474703a2f2f66696e616c2d656d706972652e736f75726365666f7267652e6e65742f6367692d62696e2f77696b692e706c3f2431, 0, 0),
('firstwiki', 0x687474703a2f2f666972737477696b692e6f72672f696e6465782e7068702f2431, 0, 0),
('foldoc', 0x687474703a2f2f7777772e666f6c646f632e6f72672f666f6c646f632f666f6c646f632e6367693f2431, 0, 0),
('foxwiki', 0x687474703a2f2f666f782e77696b69732e636f6d2f77632e646c6c3f57696b697e2431, 0, 0),
('fr.be', 0x687474703a2f2f66722e77696b696e6174696f6e732e62652f2431, 0, 0),
('fr.ca', 0x687474703a2f2f66722e63612e77696b696e6174696f6e732e6f72672f2431, 0, 0),
('fr.fr', 0x687474703a2f2f66722e66722e77696b696e6174696f6e732e6f72672f2431, 0, 0),
('fr.org', 0x687474703a2f2f66722e77696b696e6174696f6e732e6f72672f2431, 0, 0),
('freebsdman', 0x687474703a2f2f7777772e467265654253442e6f72672f6367692f6d616e2e6367693f6170726f706f733d312671756572793d2431, 0, 0),
('gamewiki', 0x687474703a2f2f67616d6577696b692e6f72672f77696b692f696e6465782e7068702f2431, 0, 0),
('gej', 0x687474703a2f2f7777772e6573706572616e746f2e64652f6367692d62696e2f616b746976696b696f2f77696b692e706c3f2431, 0, 0),
('gentoo-wiki', 0x687474703a2f2f67656e746f6f2d77696b692e636f6d2f2431, 0, 0),
('globalvoices', 0x687474703a2f2f63796265722e6c61772e686172766172642e6564752f64796e2f676c6f62616c766f696365732f77696b692f2431, 0, 0),
('gmailwiki', 0x687474703a2f2f7777772e676d61696c77696b692e636f6d2f696e6465782e7068702f2431, 0, 0),
('google', 0x687474703a2f2f7777772e676f6f676c652e636f6d2f7365617263683f713d2431, 0, 0),
('googlegroups', 0x687474703a2f2f67726f7570732e676f6f676c652e636f6d2f67726f7570733f713d2431, 0, 0),
('gotamac', 0x687474703a2f2f7777772e676f742d612d6d61632e6f72672f2431, 0, 0),
('greencheese', 0x687474703a2f2f7777772e677265656e6368656573652e6f72672f2431, 0, 0),
('hammondwiki', 0x687474703a2f2f7777772e64616972696b692e6f72672f48616d6d6f6e6457696b692f696e6465782e706870333f2431, 0, 0),
('haribeau', 0x687474703a2f2f77696b692e68617269626561752e64652f6367692d62696e2f77696b692e706c3f2431, 0, 0),
('herzkinderwiki', 0x687474703a2f2f7777772e6865727a6b696e646572696e666f2e64652f4d6564696177696b692f696e6465782e7068702f2431, 0, 0),
('hewikisource', 0x687474703a2f2f68652e77696b69736f757263652e6f72672f77696b692f2431, 1, 0),
('hrwiki', 0x687474703a2f2f7777772e687277696b692e6f72672f696e6465782e7068702f2431, 0, 0),
('iawiki', 0x687474703a2f2f7777772e494177696b692e6e65742f2431, 0, 0),
('imdb', 0x687474703a2f2f75732e696d64622e636f6d2f5469746c653f2431, 0, 0),
('infosecpedia', 0x687474703a2f2f7777772e696e666f73656370656469612e6f72672f70656469612f696e6465782e7068702f2431, 0, 0),
('jargonfile', 0x687474703a2f2f73756e69722e6f72672f617070732f6d6574612e706c3f77696b693d4a6172676f6e46696c652672656469726563743d2431, 0, 0),
('jefo', 0x687474703a2f2f7777772e6573706572616e746f2d6a65756e65732e6f72672f76696b696f2f696e6465782e7068703f2431, 0, 0),
('jiniwiki', 0x687474703a2f2f7777772e63646567726f6f742e636f6d2f6367692d62696e2f6a696e693f2431, 0, 0),
('jspwiki', 0x687474703a2f2f7777772e65637972642e636f6d2f4a535057696b692f57696b692e6a73703f706167653d2431, 0, 0),
('kerimwiki', 0x687474703a2f2f77696b692e6f7875732e6e65742f2431, 0, 0),
('kmwiki', 0x687474703a2f2f7777772e766f6768742e636f6d2f6367692d62696e2f707977696b693f2431, 0, 0),
('knowhow', 0x687474703a2f2f777777322e69726f2e756d6f6e747265616c2e63612f7e70617175657473652f6367692d62696e2f77696b692e6367693f2431, 0, 0),
('lanifexwiki', 0x687474703a2f2f6f70742e6c616e696665782e636f6d2f6367692d62696e2f77696b692e706c3f2431, 0, 0),
('lasvegaswiki', 0x687474703a2f2f77696b692e676d6e6f772e636f6d2f696e6465782e7068702f2431, 0, 0),
('linuxwiki', 0x687474703a2f2f7777772e6c696e757877696b692e64652f2431, 0, 0),
('lojban', 0x687474703a2f2f7777772e6c6f6a62616e2e6f72672f74696b692f74696b692d696e6465782e7068703f706167653d2431, 0, 0),
('lqwiki', 0x687474703a2f2f77696b692e6c696e75787175657374696f6e732e6f72672f77696b692f2431, 0, 0),
('lugkr', 0x687474703a2f2f6c75672d6b722e736f75726365666f7267652e6e65742f6367692d62696e2f6c756777696b692e706c3f2431, 0, 0),
('lutherwiki', 0x687474703a2f2f7777772e6c7574686572616e61726368697665732e636f6d2f6d772f696e6465782e7068702f2431, 0, 0),
('mathsongswiki', 0x687474703a2f2f5365656457696b692e636f6d2f706167652e63666d3f77696b6969643d32333726646f633d2431, 0, 0),
('mbtest', 0x687474703a2f2f7777772e7573656d6f642e636f6d2f6367692d62696e2f6d62746573742e706c3f2431, 0, 0),
('meatball', 0x687474703a2f2f7777772e7573656d6f642e636f6d2f6367692d62696e2f6d622e706c3f2431, 0, 0),
('mediawikiwiki', 0x687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f2431, 0, 0),
('mediazilla', 0x687474703a2f2f6275677a696c6c612e77696b6970656469612e6f72672f2431, 1, 0),
('memoryalpha', 0x687474703a2f2f7777772e6d656d6f72792d616c7068612e6f72672f656e2f696e6465782e7068702f2431, 0, 0),
('metaweb', 0x687474703a2f2f7777772e6d6574617765622e636f6d2f77696b692f77696b692e7068746d6c3f7469746c653d2431, 0, 0),
('metawiki', 0x687474703a2f2f73756e69722e6f72672f617070732f6d6574612e706c3f2431, 0, 0),
('metawikipedia', 0x687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f2431, 0, 0),
('moinmoin', 0x687474703a2f2f7075726c2e6e65742f77696b692f6d6f696e2f2431, 0, 0),
('mozillawiki', 0x687474703a2f2f77696b692e6d6f7a696c6c612e6f72672f696e6465782e7068702f2431, 0, 0),
('muweb', 0x687474703a2f2f7777772e64756e737461626c652e636f6d2f736372697074732f4d755765625765623f2431, 0, 0),
('netvillage', 0x687474703a2f2f7777772e6e657462726f732e636f6d2f3f2431, 0, 0),
('oeis', 0x687474703a2f2f7777772e72657365617263682e6174742e636f6d2f6367692d62696e2f6163636573732e6367692f61732f6e6a61732f73657175656e6365732f656973412e6367693f416e756d3d2431, 0, 0),
('openfacts', 0x687474703a2f2f6f70656e66616374732e6265726c696f732e64652f696e6465782e7068746d6c3f7469746c653d2431, 0, 0),
('openwiki', 0x687474703a2f2f6f70656e77696b692e636f6d2f3f2431, 0, 0),
('opera7wiki', 0x687474703a2f2f6e6f6e74726f70706f2e6f72672f77696b692f2431, 0, 0),
('orgpatterns', 0x687474703a2f2f7777772e62656c6c2d6c6162732e636f6d2f6367692d757365722f4f72675061747465726e732f4f72675061747465726e733f2431, 0, 0),
('osi reference model', 0x687474703a2f2f77696b692e7469676d612e65652f, 0, 0),
('pangalacticorg', 0x687474703a2f2f7777772e70616e67616c61637469632e6f72672f57696b692f2431, 0, 0),
('patwiki', 0x687474703a2f2f67617573732e666669692e6f72672f2431, 0, 0),
('personaltelco', 0x687474703a2f2f7777772e706572736f6e616c74656c636f2e6e65742f696e6465782e6367692f2431, 0, 0),
('phpwiki', 0x687474703a2f2f70687077696b692e736f75726365666f7267652e6e65742f70687077696b692f696e6465782e7068703f2431, 0, 0),
('pikie', 0x687474703a2f2f70696b69652e6461726b746563682e6f72672f6367692f70696b69653f2431, 0, 0),
('pmeg', 0x687474703a2f2f7777772e62657274696c6f772e636f6d2f706d65672f24312e706870, 0, 0),
('ppr', 0x687474703a2f2f63322e636f6d2f6367692f77696b693f2431, 0, 0),
('purlnet', 0x687474703a2f2f7075726c2e6f636c632e6f72672f4e45542f2431, 0, 0),
('pythoninfo', 0x687474703a2f2f7777772e707974686f6e2e6f72672f6367692d62696e2f6d6f696e6d6f696e2f2431, 0, 0),
('pythonwiki', 0x687474703a2f2f7777772e707974686f6e77696b692e64652f2431, 0, 0),
('pywiki', 0x687474703a2f2f7777772e766f6768742e636f6d2f6367692d62696e2f707977696b693f2431, 0, 0),
('raec', 0x687474703a2f2f7777772e726165632e636c6163736f2e6564752e61723a383038302f726165632f4d656d626572732f7261656370656469612f2431, 0, 0),
('revo', 0x687474703a2f2f7075726c2e6f72672f4e45542f766f6b6f2f7265766f2f6172742f24312e68746d6c, 0, 0),
('rfc', 0x687474703a2f2f7777772e7266632d656469746f722e6f72672f7266632f72666324312e747874, 0, 0),
('s23wiki', 0x687474703a2f2f69732d726f6f742e64652f77696b692f696e6465782e7068702f2431, 0, 0),
('scoutpedia', 0x687474703a2f2f7777772e73636f757470656469612e696e666f2f696e6465782e7068702f2431, 0, 0),
('seapig', 0x687474703a2f2f7777772e7365617069672e6f72672f2431, 0, 0),
('seattlewiki', 0x687474703a2f2f73656174746c6577696b692e6f72672f77696b692f2431, 0, 0),
('seattlewireless', 0x687474703a2f2f73656174746c65776972656c6573732e6e65742f3f2431, 0, 0),
('seeds', 0x687474703a2f2f7777772e49736c616e6453656564732e6f72672f77696b692f2431, 0, 0),
('senseislibrary', 0x687474703a2f2f73656e736569732e786d702e6e65742f3f2431, 0, 0),
('shakti', 0x687474703a2f2f6367692e616c676f6e65742e73652f687462696e2f636769777261702f7067642f5368616b746957696b692f2431, 0, 0),
('slashdot', 0x687474703a2f2f736c617368646f742e6f72672f61727469636c652e706c3f7369643d2431, 0, 0),
('smikipedia', 0x687474703a2f2f7777772e736d696b6970656469612e6f72672f2431, 0, 0),
('sockwiki', 0x687474703a2f2f77696b692e736f636b6c6162732e636f6d2f2431, 0, 0),
('sourceforge', 0x687474703a2f2f736f75726365666f7267652e6e65742f2431, 0, 0),
('squeak', 0x687474703a2f2f6d696e6e6f772e63632e6761746563682e6564752f73717565616b2f2431, 0, 0),
('strikiwiki', 0x687474703a2f2f63682e7477692e747564656c66742e6e6c2f7e6d6f73746572742f737472696b692f74657374737472696b692e706c3f2431, 0, 0),
('susning', 0x687474703a2f2f7777772e7375736e696e672e6e752f2431, 0, 0),
('svgwiki', 0x687474703a2f2f7777772e70726f746f636f6c372e636f6d2f7376672d77696b692f64656661756c742e6173703f2431, 0, 0),
('tavi', 0x687474703a2f2f746176692e736f75726365666f7267652e6e65742f2431, 0, 0),
('tejo', 0x687474703a2f2f7777772e74656a6f2e6f72672f76696b696f2f2431, 0, 0),
('terrorwiki', 0x687474703a2f2f7777772e6c69626572616c73616761696e7374746572726f7269736d2e636f6d2f77696b692f696e6465782e7068702f2431, 0, 0),
('theopedia', 0x687474703a2f2f7777772e7468656f70656469612e636f6d2f2431, 0, 0),
('tmbw', 0x687474703a2f2f7777772e746d62772e6e65742f77696b692f696e6465782e7068702f2431, 0, 0),
('tmnet', 0x687474703a2f2f7777772e746563686e6f6d616e69666573746f732e6e65742f3f2431, 0, 0),
('tmwiki', 0x687474703a2f2f7777772e45617379546f7069634d6170732e636f6d2f3f706167653d2431, 0, 0),
('turismo', 0x687474703a2f2f7777772e74656a6f2e6f72672f74757269736d6f2f2431, 0, 0),
('twiki', 0x687474703a2f2f7477696b692e6f72672f6367692d62696e2f766965772f2431, 0, 0),
('twistedwiki', 0x687474703a2f2f7075726c2e6e65742f77696b692f747769737465642f2431, 0, 0),
('uea', 0x687474703a2f2f7777772e74656a6f2e6f72672f7565612f2431, 0, 0),
('unreal', 0x687474703a2f2f77696b692e6265796f6e64756e7265616c2e636f6d2f77696b692f2431, 0, 0),
('ursine', 0x687474703a2f2f77696b692e757273696e652e63612f2431, 0, 0),
('usej', 0x687474703a2f2f7777772e74656a6f2e6f72672f7573656a2f2431, 0, 0),
('usemod', 0x687474703a2f2f7777772e7573656d6f642e636f6d2f6367692d62696e2f77696b692e706c3f2431, 0, 0),
('visualworks', 0x687474703a2f2f77696b692e63732e756975632e6564752f56697375616c576f726b732f2431, 0, 0),
('warpedview', 0x687474703a2f2f7777772e776172706564766965772e636f6d2f696e6465782e7068702f2431, 0, 0),
('webdevwikinl', 0x687474703a2f2f7777772e70726f6d6f2d69742e6e6c2f57656244657657696b692f696e6465782e7068703f706167653d2431, 0, 0),
('webisodes', 0x687474703a2f2f7777772e77656269736f6465732e6f72672f2431, 0, 0),
('webseitzwiki', 0x687474703a2f2f776562736569747a2e666c7578656e742e636f6d2f77696b692f2431, 0, 0),
('why', 0x687474703a2f2f636c75626c65742e636f6d2f632f632f7768793f2431, 0, 0),
('wiki', 0x687474703a2f2f63322e636f6d2f6367692f77696b693f2431, 0, 0),
('wikia', 0x687474703a2f2f7777772e77696b69612e636f6d2f77696b692f2431, 0, 0),
('wikibooks', 0x687474703a2f2f656e2e77696b69626f6f6b732e6f72672f77696b692f2431, 1, 0),
('wikicities', 0x687474703a2f2f7777772e77696b696369746965732e636f6d2f696e6465782e7068702f2431, 0, 0),
('wikif1', 0x687474703a2f2f7777772e77696b6966312e6f72672f2431, 0, 0),
('wikihow', 0x687474703a2f2f7777772e77696b69686f772e636f6d2f2431, 0, 0),
('wikimedia', 0x687474703a2f2f77696b696d65646961666f756e646174696f6e2e6f72672f77696b692f2431, 0, 0),
('wikinews', 0x687474703a2f2f656e2e77696b696e6577732e6f72672f77696b692f2431, 1, 0),
('wikinfo', 0x687474703a2f2f7777772e77696b696e666f2e6f72672f77696b692e7068703f7469746c653d2431, 0, 0),
('wikipedia', 0x687474703a2f2f656e2e77696b6970656469612e6f72672f77696b692f2431, 1, 0),
('wikiquote', 0x687474703a2f2f656e2e77696b6971756f74652e6f72672f77696b692f2431, 1, 0),
('wikisource', 0x687474703a2f2f736f75726365732e77696b6970656469612e6f72672f77696b692f2431, 1, 0),
('wikispecies', 0x687474703a2f2f737065636965732e77696b6970656469612e6f72672f77696b692f2431, 1, 0),
('wikitravel', 0x687474703a2f2f77696b6974726176656c2e6f72672f656e2f2431, 0, 0),
('wikiworld', 0x687474703a2f2f57696b69576f726c642e636f6d2f77696b692f696e6465782e7068702f2431, 0, 0),
('wikt', 0x687474703a2f2f656e2e77696b74696f6e6172792e6f72672f77696b692f2431, 1, 0),
('wiktionary', 0x687474703a2f2f656e2e77696b74696f6e6172792e6f72672f77696b692f2431, 1, 0),
('wlug', 0x687474703a2f2f7777772e776c75672e6f72672e6e7a2f2431, 0, 0),
('wlwiki', 0x687474703a2f2f77696e736c6f77736c6169722e73757072656d65706978656c732e6e65742f77696b692f696e6465782e7068702f2431, 0, 0),
('ypsieyeball', 0x687474703a2f2f736b6e6b77726b732e64796e646e732e6f72673a313935372f777269746577696b692f77696b692e706c3f2431, 0, 0),
('zwiki', 0x687474703a2f2f7777772e7a77696b692e6f72672f2431, 0, 0),
('zzz wiki', 0x687474703a2f2f77696b692e7a7a7a2e65652f, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cp1_ipblocks`
--

CREATE TABLE IF NOT EXISTS `cp1_ipblocks` (
  `ipb_id` int(11) NOT NULL auto_increment,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(10) unsigned NOT NULL default '0',
  `ipb_by` int(10) unsigned NOT NULL default '0',
  `ipb_reason` tinyblob NOT NULL,
  `ipb_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ipb_auto` tinyint(1) NOT NULL default '0',
  `ipb_anon_only` tinyint(1) NOT NULL default '0',
  `ipb_create_account` tinyint(1) NOT NULL default '1',
  `ipb_enable_autoblock` tinyint(1) NOT NULL default '1',
  `ipb_expiry` varbinary(14) NOT NULL default '',
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_deleted` tinyint(1) NOT NULL default '0',
  `ipb_block_email` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`ipb_id`),
  UNIQUE KEY `ipb_address` (`ipb_address`(255),`ipb_user`,`ipb_auto`,`ipb_anon_only`),
  KEY `ipb_user` (`ipb_user`),
  KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  KEY `ipb_timestamp` (`ipb_timestamp`),
  KEY `ipb_expiry` (`ipb_expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cp1_ipblocks`
--


-- --------------------------------------------------------

--
-- Table structure for table `cp1_job`
--

CREATE TABLE IF NOT EXISTS `cp1_job` (
  `job_id` int(10) unsigned NOT NULL auto_increment,
  `job_cmd` varbinary(60) NOT NULL default '',
  `job_namespace` int(11) NOT NULL,
  `job_title` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  `job_params` blob NOT NULL,
  PRIMARY KEY  (`job_id`),
  KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cp1_job`
--


-- --------------------------------------------------------

--
-- Table structure for table `cp1_langlinks`
--

CREATE TABLE IF NOT EXISTS `cp1_langlinks` (
  `ll_from` int(10) unsigned NOT NULL default '0',
  `ll_lang` varbinary(20) NOT NULL default '',
  `ll_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  UNIQUE KEY `ll_from` (`ll_from`,`ll_lang`),
  KEY `ll_lang` (`ll_lang`,`ll_title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_langlinks`
--


-- --------------------------------------------------------

--
-- Table structure for table `cp1_logging`
--

CREATE TABLE IF NOT EXISTS `cp1_logging` (
  `log_type` varbinary(10) NOT NULL default '',
  `log_action` varbinary(10) NOT NULL default '',
  `log_timestamp` binary(14) NOT NULL default '19700101000000',
  `log_user` int(10) unsigned NOT NULL default '0',
  `log_namespace` int(11) NOT NULL default '0',
  `log_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `log_comment` varchar(255) NOT NULL default '',
  `log_params` blob NOT NULL,
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `log_deleted` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`log_id`),
  KEY `type_time` (`log_type`,`log_timestamp`),
  KEY `user_time` (`log_user`,`log_timestamp`),
  KEY `page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  KEY `times` (`log_timestamp`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `cp1_logging`
--

INSERT INTO `cp1_logging` (`log_type`, `log_action`, `log_timestamp`, `log_user`, `log_namespace`, `log_title`, `log_comment`, `log_params`, `log_id`, `log_deleted`) VALUES
('patrol', 'patrol', '20071117165436', 1, 0, 'Chinese_cuisine', '', 0x390a380a31, 1, 0),
('protect', 'protect', '20071117165500', 1, 0, 'Main_Page', '[edit=sysop:move=sysop]', '', 2, 0),
('patrol', 'patrol', '20071117170541', 1, 0, 'Dan_Chao_Fan', '', 0x31310a300a31, 3, 0),
('protect', 'unprotect', '20080126071048', 1, 4, 'About', '', '', 4, 0),
('patrol', 'patrol', '20080126071604', 1, 0, 'Chinese_cuisine', '', 0x32330a32300a31, 5, 0),
('patrol', 'patrol', '20080126071757', 1, 0, 'Chinese_cuisine', '', 0x32340a32330a31, 6, 0),
('patrol', 'patrol', '20080126071822', 1, 0, 'General/Common', '', 0x32350a300a31, 7, 0),
('patrol', 'patrol', '20080126071854', 1, 0, 'Chinese_cuisine', '', 0x32360a32340a31, 8, 0),
('patrol', 'patrol', '20080126071907', 1, 0, 'General/Common', '', 0x32370a32350a31, 9, 0),
('patrol', 'patrol', '20080126071943', 1, 0, 'Dan_Chao_Fan', '', 0x32380a31360a31, 10, 0),
('patrol', 'patrol', '20080126072134', 1, 0, 'Dan_Chao_Fan', '', 0x32390a32380a31, 11, 0),
('patrol', 'patrol', '20080126073143', 1, 0, 'Main_Page', '', 0x33300a31300a31, 12, 0),
('patrol', 'patrol', '20080126074136', 1, 0, 'Main_Page', '', 0x33310a33300a31, 13, 0),
('patrol', 'patrol', '20080126074720', 1, 0, 'Main_Page', '', 0x33320a33310a31, 14, 0),
('patrol', 'patrol', '20080126074843', 1, 0, 'Main_Page', '', 0x33330a33320a31, 15, 0),
('patrol', 'patrol', '20080126074926', 1, 0, 'Main_Page', '', 0x33340a33330a31, 16, 0),
('move', 'move', '20080126075230', 1, 0, 'Chinese_cuisine', '', 0x4368696e657365, 17, 0),
('patrol', 'patrol', '20080126075728', 1, 0, 'Main_Page', '', 0x33370a33340a31, 18, 0),
('patrol', 'patrol', '20080126075757', 1, 0, 'Main_Page', '', 0x33380a33370a31, 19, 0),
('patrol', 'patrol', '20080126075821', 1, 0, 'Main_Page', '', 0x33390a33380a31, 20, 0),
('patrol', 'patrol', '20080126075943', 1, 0, 'Main_Page', '', 0x34300a33390a31, 21, 0),
('patrol', 'patrol', '20080126080554', 1, 0, 'Main_Page', '', 0x34310a34300a31, 22, 0),
('patrol', 'patrol', '20080126080711', 1, 0, 'Contact_us', '', 0x34320a300a31, 23, 0),
('patrol', 'patrol', '20080126080743', 1, 0, 'Contact_us', '', 0x34330a34320a31, 24, 0),
('patrol', 'patrol', '20080126080801', 1, 0, 'Contact_us', '', 0x34340a34330a31, 25, 0),
('patrol', 'patrol', '20080126081928', 1, 4, 'Privacy_policy', '', 0x34350a300a31, 26, 0),
('patrol', 'patrol', '20080126082413', 1, 4, 'General_disclaimer', '', 0x34360a300a31, 27, 0),
('patrol', 'patrol', '20080126082636', 1, 4, 'General_disclaimer', '', 0x34370a34360a31, 28, 0),
('patrol', 'patrol', '20080126082703', 1, 4, 'General_disclaimer', '', 0x34380a34370a31, 29, 0),
('protect', 'unprotect', '20080126082725', 1, 4, 'General_disclaimer', '', '', 30, 0),
('protect', 'unprotect', '20080126082736', 1, 4, 'About', '', '', 31, 0),
('protect', 'unprotect', '20080126082745', 1, 4, 'About', '', '', 32, 0),
('protect', 'unprotect', '20080126082756', 1, 4, 'About', '', '', 33, 0),
('protect', 'unprotect', '20080126082811', 1, 4, 'Privacy_policy', '', '', 34, 0),
('patrol', 'patrol', '20080126083700', 1, 4, 'Privacy_policy', '', 0x35340a35330a31, 35, 0),
('protect', 'protect', '20080126085943', 1, 0, 'Contact_us', '[edit=sysop:move=sysop]', '', 36, 0),
('protect', 'unprotect', '20080126085951', 1, 0, 'Contact_us', '', '', 37, 0),
('protect', 'unprotect', '20080126085955', 1, 0, 'Contact_us', '', '', 38, 0),
('protect', 'protect', '20080126090001', 1, 0, 'Contact_us', '[edit=sysop:move=sysop]', '', 39, 0),
('protect', 'protect', '20080126090035', 1, 4, 'General_disclaimer', '[edit=sysop:move=sysop]', '', 40, 0),
('protect', 'protect', '20080126090054', 1, 4, 'About', '[edit=sysop:move=sysop]', '', 41, 0),
('protect', 'protect', '20080126090104', 1, 4, 'Privacy_policy', '[edit=sysop:move=sysop]', '', 42, 0),
('patrol', 'patrol', '20080126160933', 1, 0, 'Main_Page', '', 0x36320a34310a31, 43, 0),
('patrol', 'patrol', '20080126160949', 1, 0, 'English', '', 0x36330a300a31, 44, 0),
('protect', 'protect', '20080126161000', 1, 0, 'English', '[edit=autoconfirmed:move=autoconfirmed]', '', 45, 0),
('patrol', 'patrol', '20080126161050', 1, 0, 'Main_Page', '', 0x36350a36320a31, 46, 0),
('patrol', 'patrol', '20080126161635', 1, 0, 'Chinese/CN', '', 0x36360a300a31, 47, 0),
('patrol', 'patrol', '20080126161746', 1, 0, 'English/EN', '', 0x36370a300a31, 48, 0),
('move', 'move', '20080126161902', 1, 0, 'English/EN', '', 0x456e676c69736820efbd9ce88bb1e8afad, 49, 0),
('patrol', 'patrol', '20080126162000', 1, 0, 'Main_Page', '', 0x37300a36350a31, 50, 0),
('patrol', 'patrol', '20080126162101', 1, 0, 'Main_Page', '', 0x37310a37300a31, 51, 0),
('move', 'move', '20080126162129', 1, 0, 'Chinese/CN', '', 0x4368696e65736520efbd9c20e4b8ade69687, 52, 0),
('patrol', 'patrol', '20080126162300', 1, 0, 'Main_Page', '', 0x37340a37310a31, 53, 0),
('move', 'move', '20080126162512', 1, 0, 'Chinese_ï½œ_ä¸­æ–‡', '', 0xe4b8ade69687, 54, 0),
('move', 'move', '20080126162601', 1, 0, 'ä¸­æ–‡', '', 0x4368696e657365202d20e4b8ade69687, 55, 0),
('patrol', 'patrol', '20080126162622', 1, 0, 'Main_Page', '', 0x37390a37340a31, 56, 0),
('patrol', 'patrol', '20080126162842', 1, 0, 'ä¸­å›½', '', 0x38300a300a31, 57, 0),
('move', 'move', '20080126162909', 1, 0, 'English_ï½œè‹±è¯­', '', 0x456e676c697368202d20e88bb1e8afad, 58, 0),
('patrol', 'patrol', '20080126162922', 1, 0, 'Main_Page', '', 0x38330a37390a31, 59, 0),
('patrol', 'patrol', '20080126162955', 1, 0, 'Chinese_-_ä¸­æ–‡', '', 0x38340a37370a31, 60, 0),
('patrol', 'patrol', '20080126163520', 1, 0, 'ä¸­å›½', '', 0x38360a38350a31, 61, 0),
('patrol', 'patrol', '20080126163556', 1, 0, 'ä¸­å›½', '', 0x38370a38360a31, 62, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cp1_math`
--

CREATE TABLE IF NOT EXISTS `cp1_math` (
  `math_inputhash` varbinary(16) NOT NULL,
  `math_outputhash` varbinary(16) NOT NULL,
  `math_html_conservativeness` tinyint(4) NOT NULL,
  `math_html` text,
  `math_mathml` text,
  UNIQUE KEY `math_inputhash` (`math_inputhash`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_math`
--


-- --------------------------------------------------------

--
-- Table structure for table `cp1_objectcache`
--

CREATE TABLE IF NOT EXISTS `cp1_objectcache` (
  `keyname` varbinary(255) NOT NULL default '',
  `value` mediumblob,
  `exptime` datetime default NULL,
  UNIQUE KEY `keyname` (`keyname`),
  KEY `exptime` (`exptime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_objectcache`
--

INSERT INTO `cp1_objectcache` (`keyname`, `value`, `exptime`) VALUES
('caipedia1-cp1_:messages', 0x4bb432b4aa2eb632b7520a730d0af6f4f753b2ceb432b4ae0500, '2008-06-09 15:27:10'),
('caipedia1-cp1_:pcache:idhash:1-0!1!0!!en!2!edit=0', 0x8d53c16e9b4010cdd95fb1acc411c312079335468a1db7b194c69562b5476b0d53b30a2c08d68d2dcbe71e7aef5f44556ffda0aaca6774979a065b39f404fb6676decc7bb3334a5c8adfb3b28272b696c55a624a7cbaabe805c5d91c36120f2ada3b27140745182cc38f9046790648e668cc7801316746602fc34e60ab78118e933caf00dd32b15ab315d0060f184a4af834c47674b8667311c3a65b24853d11ab9457c9c25a9813dff447e688e89fab37e6d5354692cb1486f890842cf4fcf5c7f3f7271c9e2281cdc2ffe21b275c4005355fcf1c29a66b73e299979ee9f7fff11d9254f55f3f9f7e7ffb82c353e4886f5922fbb55327302c0bddb3cf10232e50514b8d221625801eb94cd0036c51d323b1a2822c685187298f13562594588e410cc7304018aea1d2e4d0414cc4aad10c2ac9b202b98ee33b9ee3930bb74f08b2acb0a37d233d656263c52d170f151e30ead0dd5ec594a5d9984958e5258776a0af03b9908c8b6a96c6efd88a4778b0a48eaee8d4b754777345de701cd36bd457691fa0ac782ef4512d13e97a5d173725e65ae366bd14a03f9e6eb66992d01d578c8cba7a19898abd9876f0435d51bb4bceeba22ae1658b0e0b7248e8e1c17edff04256a46ae8f6bc6e0b9fc6ad8816629a29e9dad95ad2c946422958fa9aa477f0780f91ac076f697697bf65690ae5f608bd01164f2564a7edfc7d8a3779de2eefaa19cfda4ff52ce695ea7a5b8b795477de6cc69143c4f588e75ebaca86fd1f, '2008-06-09 15:27:11'),
('caipedia1-cp1_:pcache:idhash:13-0!1!0!!en!2', 0x9d56cb6edb4614cdda5f311a60da952492d683a42816a42c27069c38408c76198cc8893430451224155b30bceb225924590545d102dd342dd23680811648daa2e9cf5876f317bdc387441969215a9b199dcb9973df770e7459d1f17d1ac52c3a9825e12cc1baaceaa7b1ded6f1f4909d24b817ebb2d6ddd6b1119a038f3b4728f011450e4dd83888e668c4bce0182513e623271563e6f204a32440d475e14b9f1da388393c640d74df633466c8a06812b1477ddc7428e02ea74deebbeca4114ec2e620f013ea240f67315cc2138ff5710e21804c67b9379ad444fc119a07b34f5d74cce38920752206aa21ea07a053b4d4b3b165344373cb48e8c863f0b19b4cfa58962482cd2d043f2389d063eaf1b1dfc74910e628ca442e1c0c4d63645a31a7bed11c9928bd4e80ff670a19b688ad126b870cdb44b389bdb334e9e2dd9bc5377f61335b85299bdcf859769a0c3b44eb12ab9d6e06c41a7c42a7610fdcc203bf9ff9dff1681cf731787fc979f9d5abcb6f7fc166b656e6d488b64b2c6d69cb469c1fbe7b9dda99ad37b0d3de26b6548df3f2d7f394335b2b73b689ba9373da16b13a1b712e9e9d2ffef8019bd9bac63932bf6071c2a23471aa5bafb5ab5aff32b7fee5cd3caeb688ba2b38ad16b1baa93f2087b5cdc8bf7cb1f8fec7c593d7c05f6c6f10007b48ec6e35b317efdfa666676b65ceaee05487d538afde3f4f39b375c9596a1d4dd13b3eda4af669c27d5a39255451f5f6ae501882243a0b6ca032370bcf3faffebe7af1e6eae9d7d85c6e2bbb0a7a9a265262a54bd6e5ac8d54b8f8fd09505fbcfb097a5fb15d2f970835cbc57397bb2eb4ec21bd590d69c4b6f3c0424ad9ad34b1ed4df3f9c39fcf176f7f5bfc0cf9bcdcfe87b6d7a39eef22214da70e248251abd7d103fa98b988fb284ce72e8c28672246523241476c8e0a5be4ba13ca0ff53015ebdc9dd078a2cbdb75a926d7a45a8df93505a69c0b9a4ea1bd803148912455ea48aadc56ba4a1bd5ebe6563abe5b30cbf7a93f9ed131dbe7fe518c7b5497f4d33390c9201b643392b3b2a02b0462d6723f3ef0dcbb74cc1ddc1be992b8514a4f815e87405e70acd30b5485cf3e67510c2e167fe14d21373a0d0517571c0a2717af0c00c4d211ca164acafa290746d86c8b478938547a1e886b74ace5a7f2890a7fe0492317685ea23d9e2a0e40de277240d34b35b1c25649bac256a9b0c256ed6e4590f7df12908ddd1590cfc4f291f36b4a66d32405cece0a6fb169e841a8ca51524af89e5b9288f0ed4d21e0e5af45220c4f441951ef6389708f1d3f606945ac45fa5e709b7a1e8be66be81d46ddbd844dafab93bd23ef0441f97a058cba557e67de72790c5acfd31458bbf7b0c8e7b5bc92958edc51b436e4d5d9bf, '2008-06-09 15:27:25'),
('caipedia1-cp1_:pcache:idhash:14-0!1!0!!en!2', 0x9d57df6fdb3610ee73fe0a9ac0b627db92d6ba896cb3e882aecd9a340562b48fc559642d2232255072122fc8ffdee32f4b2eb241aa5f481e3fdd773cde1dcfd7699ca4f433e85ae8eb5d53ed1a9ac6a7e9639dbe4ae976251e1a3aafd3e4cf6496d245c5ce0b99dd9252112019346253ea3d598ba2bc274d2e14c9ec36155c3694342501ce11a9c43dd12293959890cf85805a9005905c8bef4b3acd00e55cc2542a2e1e26555e4dcf4bd540d67cdbd5a844368558522f222862d961be980223f23bd997bb3f38b997756e48332dd03402aa449bf4c1cec9c9625ab1934503eb42209837f992c651f41b6527047f8b46933b28e4462d6953565e4adc16c70f2bb658b3b7b504b598ae19b1ea8cf07f8f924b256ad19ec3af999f9813f451f4c67dff0f54a07e876d354707c8522d9da7b302ea7a49d1cf07228ba4cc0e03493e96e8c05e241649991d0692ac72900528de8b2780290bb3816c170aa5bda82c92323b1c91ac3599e26acdbe8aba11dac6c0000bfed64265792f131c9432370e3d698321dc33463c164feb2603a9de0bbdedc9e4a094b97120cfdbadd032ebc914c09485d981ad93cf5393d0cfe6f7253452c1c0cbbda940f633cf2229b3c340375c89079995bd581c9432370ebdd61d16cc2d14fdf2e580c6cb0dd381843750dc012f753f077a30fad0cf06b261e12d442f2a8bb495ba185aa7ffd2f0af2c7ab13828656e1c9a1a7a239409d87eb911d0981c61fa5c8d0b2b762539c7b7f21dfc4ac5bb146b7c82fba585c752e627ff61d5cf19ec67daecda671d937a311a8fc90ddc094ea422956d6cb007c872f3e63739b9157b126c8ec759157f4b2bbb9d4a9e439da7f1cb71348a47d16824d428c13682a3955b2cfa78109244d169348b4ee357c9eb2426e3313b31fd51fc129ba54b509b1d6cc4a554b7359d431aa58f4fb817e3deb96b42a4e86ebc361ba69991aabe2ef8156c6446e7eb34321a23fb15dab542f2c0714c6fa4a708fb22748dee354b6cdae2c96c92d0a062651c1cda38149861668c0d46c6e9a34446f05d1fda147a14a3022983aa4e57e676cecc7896764ac05c5adb51bfaf405e8056b9c2e7d768f4218f5b88cb37bf463b4250780932b501dc32f9fc69351f5e8016e39f9f96ca352eedda754bad8e43c3d1425c63d05a171ecf96c5bfdb56f0f414fc2fb65581fee9de7bd2915ff0ce8e09888b2d8650176d42ebdd834940289e0bad4fe2fe46d8fc3a8a9d4fe57b280aa1f747d20f02f805ded6cfe6b8d6ff435976d59b9eff45f7afc10b2e6bb47a6f83ea48ef2a64c851a4c6c92c9e25671146cad30f, '2008-06-09 15:27:21'),
('caipedia1-cp1_:pcache:idhash:2-0!1!0!!en!2', 0x95554d6fdb300cedb9bf42d161b7d41f5dd354713c60d9d016e8da020986ed342836176bb565c392db0645fefb28c74aec62c0ec832d8aa2f828927a7a609ecfe8232f15940f952e2a4d9937656f8a5d309aade055d399629e37b9623428c2601d2e923c5740d65bf258e6cf4246e02cf536051638ebf034700afc5529fe5211069c2425fc9e5327e2a280587047c8185ecf8aa470ae4142c953679167592e29d142a730a7efd461771e383c0c1c74fd5fff9ff6fe96224a2a2e41c1079e15331e6991cb399a6a4aa2942b35a7125e0ee847731a1ee5c1a83795ec8f698d6968a5c1780b2e75de1bf0604dc383383cb109979b848bfea96d6dc0e4b666c3d38b7b3fe3d72fbd8d31a6b79106e37dc97123885e708d2d0d1b6130d80f21ff88be87b3c634b4d260bc9f95c4aeeb85b637a5e17e6c2139e6c69f06a3f1982cf933c4444852d4a442221e25405e844ec8136c890dc31b4785f78b15f5321371c255c2fcb13bf246ee680472e4132e6304ce40698c8df8ae3b7527eed4bbf0afbc73321e87a735357d449ebac373577c0377423e293ae3cc656f3b435bb8b6e01a367929a0bd70691672a9b1ffd4431a7fe31b11d1d99ab9c6a35befc2b056086e31baf0463b45b3ef502acc9899225f7a6793339f5a172b9333cba0a830c3c4046b83f4d89b4044ceae0cdf1a9077dc673c317a69460cd836d64cd46122fca1f88d0abd37153ada1cbabf5119baefdc44abc7085be4d77260d9a951e14370e48f5ab7dbd9134356a498ee76a6fd96fe366ead9812dc6658b4b6b529e6d7570da5e4e9bf8a790f2f4ba89bb453adfbfc9aa72994db8ef606787cab217b1fcefe9dbbc9f3b67b1f9377d27e074f62a130ea6d5dc68edf95edc94e6f78fec4bdbcf0cf5d3adbfd05, '2008-06-09 15:29:13'),
('caipedia1-cp1_:pcache:idhash:3-0!1!0!!en!2', 0x9557db6edb4610ed33bf62cc872005ac0b653b7129c5456f690d3449513b05fa54acc811b9d17297e02eada845febd6796942d0579091020e25e66ce9c3933b37e97678b3cfd43759ebb777d68fb90e6d975fe9fcfaff2b4b9e78f215dfa7cf17231cfd3557bb3525477bc7995ce0aa55b2eb59a695bf2c7695bb7df071d0cbfba6bb9d0cae4ef5be354f94c35ed72d7fecc3ebcd6d87ddd692e3b5df0f4435ba55418e5fdabd4f22ea5e17a7adba88af3d373375f585ccdd44db29a01537bf3de1abd65dad53a30c901f959d4a43d29b3537b4f08ef814bd216ff4afda0cb5e195abb9df1e7b411b3e3351d702b786a94dde368d52146b601a760ab70d6eb92b106b38df38114d69ad630dc360c8bca967270f4e6ec70a0e92df65aa3024fe98ddcbb577aa72c7ba650bbbeaacfa905addc5170c42a00c2004591777d1bcd62d5b0c25d67991eb8e2a0d686a9d4be9e1e78b813bf3ea7cbc3c2ed5304c915157d2b41b82db03d33617948e66356eb10da7c36dbed7653a040f845adad9a22845987acb6ec6791fe3a348fb98344b893f8361df36316bfca52c7061a701b678cdba5375f715744903eabc2f229f512d84cc95ab220ae2aa46e0d336c934bf241992dd2d376b00a223532f4dc17ca18fcf2df9e8321706f91848c8a869e5fccaed36f41bbad42ed933fb485a6bc3261fcd972db7297641453e15b07734e1b382a8c4322a8529dd1c539195dd5c1eca9e87a5f7399645773aae8f915b97fc5bcb2d4ba6e7b4e1f7a835c599c588cc952eb35940f60b583af7200e71b20a65673c13ec966f12c8e769d0b50b3b60c571e8ec5d3ec62d8453d6cd98201576c01f00931e87038aefa820faa79c3506519bf92b72eb05f39739310ad8cbef9b163b5856ac73a8b788e4aaaea9486c928debdeb3baaa15d2f024ed05b4849fd4c5733183ad813b94b9aa6f443595236bb24b789f68fb38424c625703fd88acca398f447dab13153fa4dec2888702f975a500a600a5559eabea13aeea28a3ccab48bf012640a0614fa060ebb8651c5529f77e631ae639e87dbfca510a2ebc8084b790ee8615dbacdce6d29027be06e4f90778412634d067544c3804d1bd709606d7b28b9b70106a2114f9bde20a3c3f1c9c6a807100b2d4ca874897581d69ddbd9e8753833a53fb98100c74f5af7b1776041a1b3f550ee884eae44843e699df71a9a384d4ecc809c001b82e209fda8581f74170f75aad5a519a2b898279ed12c4b24f51dbad57a1f9b96c22df1f824ea2859e436727b9c6ee9df869383f5c1635480e8379e8f5f07e54ac4a1ef8e4910c8f84a807e4a3fa1e93d354d1f515a478deba4032be9d31bde8de4fb130ec473947a040940c492cb500bdae060b246df1e927764231932381489a7da81b6dbcd53e1a015759833a2b280d21cd10ad7e7d051899806ae9343e40785461cd2c44f05134359f346fe93f1337089fd61ec0c11ad6652c8a8f07b180c9df88d957a3401819551ceb88dae31ce2099314253905dcb3a460cc02554ebe417827055b59fd2dfae278f89664a1261f61870180bbe96de37cc9d814a2f134efb78b5728ef762ae915ac4577984674aef61c3f02640cf5d5c3a179fb1a610ba6efa06fd1575f9a1f76172ec04bf1f45de024ca4cb2213fdd0005c3f54add1e500bc50764830b0495e5a8629b010350b632065568efda573e809903788b4630625a2c11be097158ff92930c031a7d116c4b388bd52d2183e470071c48679122bdaa74756d97ed1b4c8adc4ebe67c782fa03cd72c0f8910f63137a214d8044f183f8407478c4bca50c167c0a01e64b38342ba8302638549c55880f018252872d5f0048e4e723818b5c291a2b5960ee3fd787b181dabb3c984eed4f8ee6ae31b132417f5f8ceda22ed8767643629daec9fbc8ddbb92e11779d5f4ce667d9d9fcec8cedd962287adda0c7e24d498bf9fc7afe627e9d5d2dbecbae6932b949e4a59a5de2d9fabbb2558f0ef3bbb65b9f2e553ecffffb84bd0c7b3f21d6ca415fc71b2f65c3d920b3eb9d29dfa84a17e9729dcfc5e23cde02ac7b383ff838752fabd738f6171843fb924f3c9fb3e98be9223d98b89787d1e1418d05f9ef8580fd0c643ccb4d2cdbe3f5c5d1fa6d79b423e0e3fb38ae65f276cf2ef2f4f405bdd479b6fc34f2f3cbf8647b741d2f5de2d2d73cdb1e4d0aad6f7977c74588c11ff1f6d6fd8a118a7679b28a8159de066e3e0f6ff803e43788ec68670192be39fe03e51bb423b0b08f849ed8bd3fa8e3244bd9e2c5fce522bbb84c979ffe07, '2008-06-09 15:29:18'),
('caipedia1-cp1_:pcache:idhash:7-0!1!0!!en!2', 0x95535d6f9b3014ed737e85f1c3de1230693e6a087b68b63655d74c2ada2bba85bb60150c02b3248af2df6b274232d3a46d4fd6fdf03dc7e71e6f39f339fd0e4d8bcdb65375a728674b7e6af98cd332c683a241cb6f178cd3b02ba251588828049237f87345dd14448d990057c80c0f933aafdd35c8e43e872af90a92122554812baa93c4248949467614ba1085ae1efad7c99fafb3d690acab2e893b737c82b20e2055a2922bddad28490b68db1595b8b7c0896e2571670e836e85ff0dffd0956ffa714f22590bb9fb27fceb15f22488b942a3616c31708dc0a3d0198fc92bfcc28c0849eacb66480a698e642f544edef1487a7a6c9cd62ce1f5a5cc4596439bf3c5d87398e3390e4ac72720334da4c45669aec4f7bca537f7966ce6dfb119198fa391d92fbbd5cb7e06b9eb6087cf42beb73400eef1d359d7f4eacb7b50b8ab1a817661610a95542064bb2db26fb013290ddeb867267a975b9a56acc17b8c21bcc92e75db0f6c5aada009b5e9d8643ef1693f22361af636d40973cc0dd99e24e327a111814f8d698d99070e3473389df60486eba381b8929d9a5b96afae85f3b92781655d6805ecc7fb567e935915a3caa6d43adadd46df2f07858d84e24ffabee0fe152f3e1a08f8523d405160731c641f11b28dc2f2773ad7fffb5855f6785fab7563ffef9b4cb49af5f1a2ec606edcdb64b02ee6cfbd05bbf31634387f00, '2008-06-09 15:29:15'),
('caipedia1-cp1_:pcache:idhash:9-0!1!0!!en!2!edit=0', 0x7d535d6b1b3110ccb37f854ecfb1231d8e6bcb1f144a690c695c88e94b29657db7be13d1498724373521ff3dab4b5dce29ed93d0ee8e766676b5513257fc0bf8807e7388ed217225a7ea29a86bc59b2dfe8a7c1ed458d06dd1aeb68e796c9d8f0c2cd3b6d025da78c9a02c53800e1db5b3605801112be78fcc795638efb148902361f6ce3790aa58ac21321d98759121216167f092b5062120816c0402c51ad923ee1a08113d83a8068bab764554a2739547b4efab06b41915ae5900ab3dee973c05a2537f577056180861c94916fac4130ed1d943b343cf59d4d1e07fd11ecd925bb777c6b847befa26bf2fae60d5311a2cb2e190ddc34f2c49246b3b43c98622f1d7b1660f78a4ab6e4929c861d1ca1faaedd24a9735845acd86229399c832b4599e254396823c2b8957832142d3b25c88a99888a9bcce67e3191b0e5783341d39a651dd82ad0e50e1adb60f81cf4109f5f44c3949b90fafd3d0d84fbc4b89e4b2b66163cacf50e982cf774aa417458722765b6a7eea71de3e45a754f6157da071a62b2d891c4d46393f3db14d969e968802e99824b26f4876b5d8b48688f6e3792fbe2e7b99447edd90dc7e75b2e1e3efc9fee920d32ee76999ff39d7b956727ef2ea0e1fef695b3b453d33eedc273006fdf12c7a8350ae23366f39bffea41be7fa2a73527ed1ff6917a50e24edd8b974f6eef634f233eb653e11332184e4f3e717, '2008-06-09 15:29:49');

-- --------------------------------------------------------

--
-- Table structure for table `cp1_oldimage`
--

CREATE TABLE IF NOT EXISTS `cp1_oldimage` (
  `oi_name` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `oi_archive_name` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `oi_size` int(10) unsigned NOT NULL default '0',
  `oi_width` int(11) NOT NULL default '0',
  `oi_height` int(11) NOT NULL default '0',
  `oi_bits` int(11) NOT NULL default '0',
  `oi_description` tinyblob NOT NULL,
  `oi_user` int(10) unsigned NOT NULL default '0',
  `oi_user_text` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  `oi_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') default NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart') NOT NULL default 'unknown',
  `oi_minor_mime` varbinary(32) NOT NULL default 'unknown',
  `oi_deleted` tinyint(3) unsigned NOT NULL default '0',
  `oi_sha1` varbinary(32) NOT NULL default '',
  KEY `oi_usertext_timestamp` (`oi_user_text`,`oi_timestamp`),
  KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  KEY `oi_sha1` (`oi_sha1`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_oldimage`
--


-- --------------------------------------------------------

--
-- Table structure for table `cp1_page`
--

CREATE TABLE IF NOT EXISTS `cp1_page` (
  `page_id` int(10) unsigned NOT NULL auto_increment,
  `page_namespace` int(11) NOT NULL,
  `page_title` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  `page_restrictions` tinyblob NOT NULL,
  `page_counter` bigint(20) unsigned NOT NULL default '0',
  `page_is_redirect` tinyint(3) unsigned NOT NULL default '0',
  `page_is_new` tinyint(3) unsigned NOT NULL default '0',
  `page_random` double unsigned NOT NULL,
  `page_touched` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `page_latest` int(10) unsigned NOT NULL,
  `page_len` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`page_id`),
  UNIQUE KEY `name_title` (`page_namespace`,`page_title`),
  KEY `page_random` (`page_random`),
  KEY `page_len` (`page_len`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `cp1_page`
--

INSERT INTO `cp1_page` (`page_id`, `page_namespace`, `page_title`, `page_restrictions`, `page_counter`, `page_is_redirect`, `page_is_new`, `page_random`, `page_touched`, `page_latest`, `page_len`) VALUES
(1, 0, 'Main_Page', '', 92, 0, 0, 0.231418665017, '20080126162922', 83, 587),
(2, 0, 'Chinese', '', 37, 0, 0, 0.971302525832, '20080126075230', 35, 250),
(3, 0, 'Dan_Chao_Fan', '', 26, 0, 0, 0.655526496558, '20080126072134', 29, 2290),
(4, 6, 'Friedrice', '', 1, 0, 1, 0.813178490321, '20071117170911', 13, 55),
(5, 0, 'é¦–é¡µ', '', 5, 0, 1, 0.652986436106, '20071117173039', 15, 2),
(6, 4, 'About', '', 9, 0, 1, 0.838876538235, '20080126090054', 60, 280),
(7, 0, 'General/Common', '', 8, 0, 0, 0.929508123341, '20080126071907', 27, 91),
(8, 0, 'Chinese_cuisine', '', 0, 1, 1, 0.316731574553, '20080126075230', 36, 21),
(9, 0, 'Contact_us', '', 11, 0, 0, 0.978927658827, '20080126090001', 58, 178),
(10, 4, 'Privacy_policy', '', 6, 0, 0, 0.596234080316, '20080126090104', 61, 8341),
(11, 4, 'General_disclaimer', '', 6, 0, 0, 0.86050320978, '20080126090035', 59, 1736),
(12, 0, 'English', '', 2, 0, 1, 0.654897483199, '20080126161000', 64, 592),
(13, 0, 'Chinese_-_ä¸­æ–‡', '', 16, 0, 0, 0.270924298818, '20080126162955', 84, 533),
(14, 0, 'English_-_è‹±è¯­', '', 10, 0, 1, 0.147960586543, '20080126162909', 81, 592),
(15, 0, 'English/EN', '', 1, 1, 1, 0.78297888893, '20080126161902', 69, 31),
(16, 0, 'Chinese/CN', '', 0, 1, 1, 0.66404137402, '20080126162129', 73, 32),
(17, 0, 'Chinese_ï½œ_ä¸­æ–‡', '', 1, 1, 1, 0.602010789215, '20080126162512', 76, 20),
(18, 0, 'ä¸­æ–‡', '', 1, 1, 1, 0.056716940146, '20080126162601', 78, 30),
(19, 0, 'ä¸­å›½', '', 8, 0, 0, 0.840511924936, '20080126163556', 87, 222),
(20, 0, 'English_ï½œè‹±è¯­', '', 0, 1, 1, 0.231212671611, '20080126162909', 82, 30);

-- --------------------------------------------------------

--
-- Table structure for table `cp1_pagelinks`
--

CREATE TABLE IF NOT EXISTS `cp1_pagelinks` (
  `pl_from` int(10) unsigned NOT NULL default '0',
  `pl_namespace` int(11) NOT NULL default '0',
  `pl_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  UNIQUE KEY `pl_from` (`pl_from`,`pl_namespace`,`pl_title`),
  KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_pagelinks`
--

INSERT INTO `cp1_pagelinks` (`pl_from`, `pl_namespace`, `pl_title`) VALUES
(1, 0, 'Chinese_-_ä¸­æ–‡'),
(1, 0, 'English_-_è‹±è¯­'),
(2, 0, 'Cantonese'),
(2, 0, 'DongBei'),
(2, 0, 'General/Common'),
(2, 0, 'HangBang'),
(2, 0, 'Hunanese'),
(2, 0, 'Shanghainese'),
(2, 0, 'Sichuanese'),
(2, 0, 'Xinjiang'),
(2, 0, 'Yunnan'),
(7, 0, 'Da_Dou_Tu_Dou'),
(7, 0, 'Dan_Chao_Fan'),
(7, 0, 'Gumbao_Ji_Ding'),
(8, 0, 'Chinese'),
(10, 0, 'M:developers'),
(10, 0, 'Meta:CheckUser'),
(11, 0, 'Contact_us'),
(12, 0, 'American'),
(12, 0, 'Argentina'),
(12, 0, 'Brazil'),
(12, 0, 'Chile'),
(12, 0, 'Chinese'),
(12, 0, 'Contact_us'),
(12, 0, 'French'),
(12, 0, 'German'),
(12, 0, 'Guatemala'),
(12, 0, 'India'),
(12, 0, 'Italian'),
(12, 0, 'Japan'),
(12, 0, 'Korea'),
(12, 0, 'Lebanon'),
(12, 0, 'Mexico'),
(12, 0, 'Salvador'),
(12, 0, 'Spain'),
(12, 0, 'Thailand'),
(13, 0, 'Contact_us'),
(13, 0, 'ä¸­å›½'),
(13, 0, 'ä¹ˆè¥¿ä¸ª'),
(13, 0, 'å°åº¦'),
(13, 0, 'å¾·å›½'),
(13, 0, 'æ„å¤§åˆ©'),
(13, 0, 'æ—¥æœ¬'),
(13, 0, 'æ³•å›½'),
(13, 0, 'æ³°å›½'),
(13, 0, 'ç¾Žå›½'),
(13, 0, 'è¥¿ç­ç‰™'),
(13, 0, 'éŸ©å›½'),
(13, 0, 'é»Žå·´å«©'),
(14, 0, 'American'),
(14, 0, 'Argentina'),
(14, 0, 'Brazil'),
(14, 0, 'Chile'),
(14, 0, 'Chinese'),
(14, 0, 'Contact_us'),
(14, 0, 'French'),
(14, 0, 'German'),
(14, 0, 'Guatemala'),
(14, 0, 'India'),
(14, 0, 'Italian'),
(14, 0, 'Japan'),
(14, 0, 'Korea'),
(14, 0, 'Lebanon'),
(14, 0, 'Mexico'),
(14, 0, 'Salvador'),
(14, 0, 'Spain'),
(14, 0, 'Thailand'),
(15, 0, 'English_ï½œè‹±è¯­'),
(16, 0, 'Chinese_ï½œ_ä¸­æ–‡'),
(17, 0, 'ä¸­æ–‡'),
(18, 0, 'Chinese_-_ä¸­æ–‡'),
(19, 0, 'ä¸Šæµ·'),
(19, 0, 'ä¸œåŒ—'),
(19, 0, 'äº‘å—'),
(19, 0, 'å››å·'),
(19, 0, 'å¤§ä¼—'),
(19, 0, 'å¹¿ä¸œ'),
(19, 0, 'æ–°ç–†'),
(19, 0, 'æ­å¸®'),
(19, 0, 'æ¹–å—'),
(20, 0, 'English_-_è‹±è¯­');

-- --------------------------------------------------------

--
-- Table structure for table `cp1_page_restrictions`
--

CREATE TABLE IF NOT EXISTS `cp1_page_restrictions` (
  `pr_page` int(11) NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_user` int(11) default NULL,
  `pr_expiry` varbinary(14) default NULL,
  `pr_id` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`pr_page`,`pr_type`),
  UNIQUE KEY `pr_id` (`pr_id`),
  KEY `pr_typelevel` (`pr_type`,`pr_level`),
  KEY `pr_level` (`pr_level`),
  KEY `pr_cascade` (`pr_cascade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `cp1_page_restrictions`
--

INSERT INTO `cp1_page_restrictions` (`pr_page`, `pr_type`, `pr_level`, `pr_cascade`, `pr_user`, `pr_expiry`, `pr_id`) VALUES
(1, 'edit', 'sysop', 0, NULL, 'infinity', 1),
(1, 'move', 'sysop', 0, NULL, 'infinity', 2),
(6, 'edit', 'sysop', 0, NULL, 'infinity', 9),
(6, 'move', 'sysop', 0, NULL, 'infinity', 10),
(9, 'edit', 'sysop', 0, NULL, 'infinity', 5),
(9, 'move', 'sysop', 0, NULL, 'infinity', 6),
(10, 'edit', 'sysop', 0, NULL, 'infinity', 11),
(10, 'move', 'sysop', 0, NULL, 'infinity', 12),
(11, 'edit', 'sysop', 0, NULL, 'infinity', 7),
(11, 'move', 'sysop', 0, NULL, 'infinity', 8),
(12, 'edit', 'autoconfirmed', 0, NULL, 'infinity', 13),
(12, 'move', 'autoconfirmed', 0, NULL, 'infinity', 14);

-- --------------------------------------------------------

--
-- Table structure for table `cp1_querycache`
--

CREATE TABLE IF NOT EXISTS `cp1_querycache` (
  `qc_type` varbinary(32) NOT NULL,
  `qc_value` int(10) unsigned NOT NULL default '0',
  `qc_namespace` int(11) NOT NULL default '0',
  `qc_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  KEY `qc_type` (`qc_type`,`qc_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_querycache`
--


-- --------------------------------------------------------

--
-- Table structure for table `cp1_querycachetwo`
--

CREATE TABLE IF NOT EXISTS `cp1_querycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) unsigned NOT NULL default '0',
  `qcc_namespace` int(11) NOT NULL default '0',
  `qcc_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `qcc_namespacetwo` int(11) NOT NULL default '0',
  `qcc_titletwo` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  KEY `qcc_type` (`qcc_type`,`qcc_value`),
  KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_querycachetwo`
--


-- --------------------------------------------------------

--
-- Table structure for table `cp1_querycache_info`
--

CREATE TABLE IF NOT EXISTS `cp1_querycache_info` (
  `qci_type` varbinary(32) NOT NULL default '',
  `qci_timestamp` binary(14) NOT NULL default '19700101000000',
  UNIQUE KEY `qci_type` (`qci_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_querycache_info`
--


-- --------------------------------------------------------

--
-- Table structure for table `cp1_recentchanges`
--

CREATE TABLE IF NOT EXISTS `cp1_recentchanges` (
  `rc_id` int(11) NOT NULL auto_increment,
  `rc_timestamp` varbinary(14) NOT NULL default '',
  `rc_cur_time` varbinary(14) NOT NULL default '',
  `rc_user` int(10) unsigned NOT NULL default '0',
  `rc_user_text` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  `rc_namespace` int(11) NOT NULL default '0',
  `rc_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `rc_comment` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `rc_minor` tinyint(3) unsigned NOT NULL default '0',
  `rc_bot` tinyint(3) unsigned NOT NULL default '0',
  `rc_new` tinyint(3) unsigned NOT NULL default '0',
  `rc_cur_id` int(10) unsigned NOT NULL default '0',
  `rc_this_oldid` int(10) unsigned NOT NULL default '0',
  `rc_last_oldid` int(10) unsigned NOT NULL default '0',
  `rc_type` tinyint(3) unsigned NOT NULL default '0',
  `rc_moved_to_ns` tinyint(3) unsigned NOT NULL default '0',
  `rc_moved_to_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `rc_patrolled` tinyint(3) unsigned NOT NULL default '0',
  `rc_ip` varbinary(40) NOT NULL default '',
  `rc_old_len` int(11) default NULL,
  `rc_new_len` int(11) default NULL,
  `rc_deleted` tinyint(3) unsigned NOT NULL default '0',
  `rc_logid` int(10) unsigned NOT NULL default '0',
  `rc_log_type` varbinary(255) default NULL,
  `rc_log_action` varbinary(255) default NULL,
  `rc_params` blob,
  PRIMARY KEY  (`rc_id`),
  KEY `rc_timestamp` (`rc_timestamp`),
  KEY `rc_namespace_title` (`rc_namespace`,`rc_title`),
  KEY `rc_cur_id` (`rc_cur_id`),
  KEY `new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  KEY `rc_ip` (`rc_ip`),
  KEY `rc_ns_usertext` (`rc_namespace`,`rc_user_text`),
  KEY `rc_user_text` (`rc_user_text`,`rc_timestamp`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=81 ;

--
-- Dumping data for table `cp1_recentchanges`
--

INSERT INTO `cp1_recentchanges` (`rc_id`, `rc_timestamp`, `rc_cur_time`, `rc_user`, `rc_user_text`, `rc_namespace`, `rc_title`, `rc_comment`, `rc_minor`, `rc_bot`, `rc_new`, `rc_cur_id`, `rc_this_oldid`, `rc_last_oldid`, `rc_type`, `rc_moved_to_ns`, `rc_moved_to_title`, `rc_patrolled`, `rc_ip`, `rc_old_len`, `rc_new_len`, `rc_deleted`, `rc_logid`, `rc_log_type`, `rc_log_action`, `rc_params`) VALUES
(1, '20071117152853', '20071117152853', 0, '127.0.0.1', 0, 'Main_Page', '/* Getting started */ ', 0, 0, 0, 1, 2, 1, 0, 0, '', 0, '127.0.0.1', 449, 456, 0, 0, NULL, NULL, NULL),
(2, '20071117164044', '20071117164044', 2, 'Toogreen', 0, 'Main_Page', '', 0, 0, 0, 1, 3, 2, 0, 0, '', 0, '127.0.0.1', 456, 484, 0, 0, NULL, NULL, NULL),
(3, '20071117164133', '20071117164133', 2, 'Toogreen', 0, 'Main_Page', '', 0, 0, 0, 1, 4, 3, 0, 0, '', 0, '127.0.0.1', 484, 525, 0, 0, NULL, NULL, NULL),
(4, '20071117164217', '20071117164217', 2, 'Toogreen', 0, 'Main_Page', '', 0, 0, 0, 1, 5, 4, 0, 0, '', 0, '127.0.0.1', 525, 524, 0, 0, NULL, NULL, NULL),
(5, '20071117164333', '20071117164333', 2, 'Toogreen', 0, 'Main_Page', '', 0, 0, 0, 1, 6, 5, 0, 0, '', 0, '127.0.0.1', 524, 609, 0, 0, NULL, NULL, NULL),
(6, '20071117164417', '20071117164417', 2, 'Toogreen', 0, 'Chinese_cuisine', 'New page: [[Dan Chao Fan]] [[Da dou tu dou]]', 0, 0, 1, 2, 7, 0, 1, 0, '', 0, '127.0.0.1', 0, 34, 0, 0, NULL, NULL, NULL),
(7, '20071117164433', '20071117164433', 2, 'Toogreen', 0, 'Chinese_cuisine', '', 0, 0, 0, 2, 8, 7, 0, 0, '', 0, '127.0.0.1', 34, 42, 0, 0, NULL, NULL, NULL),
(8, '20071117165436', '20071117165436', 1, 'T00gr33n', 0, 'Chinese_cuisine', '', 0, 0, 0, 2, 9, 8, 0, 0, '', 1, '127.0.0.1', 42, 63, 0, 0, NULL, NULL, NULL),
(9, '20071117165500', '20071117165500', 1, 'T00gr33n', -1, 'Log/protect', 'protected "[[Main Page]]": [edit=sysop:move=sysop]', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(10, '20071117170541', '20071117170541', 1, 'T00gr33n', 0, 'Dan_Chao_Fan', 'New page: Unlike white rice which is always served in individual bowls, fried rice with its many ingredients, is considered almost a complete meal and is served on a communal plate. Most Taiwanese t...', 0, 0, 1, 3, 11, 0, 1, 0, '', 1, '127.0.0.1', 0, 2265, 0, 0, NULL, NULL, NULL),
(11, '20071117170750', '20071117170750', 2, 'Toogreen', 0, 'Dan_Chao_Fan', '', 0, 0, 0, 3, 12, 11, 0, 0, '', 0, '127.0.0.1', 2265, 2286, 0, 0, NULL, NULL, NULL),
(12, '20071117170815', '20071117170815', 2, 'Toogreen', 6, 'Friedrice', 'New page: http://www.eatingchina.com/images-recipes/friedrice.jpg', 0, 0, 1, 4, 13, 0, 1, 0, '', 0, '127.0.0.1', 0, 55, 0, 0, NULL, NULL, NULL),
(13, '20071117170911', '20071117170911', 2, 'Toogreen', 0, 'Dan_Chao_Fan', '', 0, 0, 0, 3, 14, 12, 0, 0, '', 0, '127.0.0.1', 2286, 2332, 0, 0, NULL, NULL, NULL),
(14, '20071117173039', '20071117173039', 0, '192.168.0.132', 0, 'é¦–é¡µ', 'æ–°é¡µé¢: sa', 0, 0, 1, 5, 15, 0, 1, 0, '', 0, '192.168.0.132', 0, 2, 0, 0, NULL, NULL, NULL),
(15, '20071119140242', '20071119140242', 2, 'Toogreen', 0, 'Dan_Chao_Fan', '', 0, 0, 0, 3, 16, 14, 0, 0, '', 0, '127.0.0.1', 2332, 2332, 0, 0, NULL, NULL, NULL),
(16, '20080101144353', '20080101144353', 2, 'Toogreen', 0, 'Chinese_cuisine', '', 0, 0, 0, 2, 17, 9, 0, 0, '', 0, '127.0.0.1', 63, 86, 0, 0, NULL, NULL, NULL),
(17, '20080126064457', '20080126064457', 0, '127.0.0.1', 0, 'Chinese_cuisine', '', 0, 0, 0, 2, 18, 17, 0, 0, '', 0, '127.0.0.1', 86, 106, 0, 0, NULL, NULL, NULL),
(18, '20080126064511', '20080126064511', 0, '127.0.0.1', 0, 'Chinese_cuisine', '', 0, 0, 0, 2, 19, 18, 0, 0, '', 0, '127.0.0.1', 106, 109, 0, 0, NULL, NULL, NULL),
(19, '20080126065230', '20080126065230', 0, '127.0.0.1', 0, 'Chinese_cuisine', '', 0, 0, 0, 2, 20, 19, 0, 0, '', 0, '127.0.0.1', 109, 91, 0, 0, NULL, NULL, NULL),
(20, '20080126070204', '20080126070204', 2, 'Toogreen', 4, 'About', 'New page: Caipedia has for goal to become THE biggest cooking book on the Internet.   We count on you, the users, to fill this virtual book by adding your own recipes!   Feel free to include images ...', 0, 0, 1, 6, 21, 0, 1, 0, '', 0, '127.0.0.1', 0, 280, 0, 0, NULL, NULL, NULL),
(21, '20080126071048', '20080126071048', 1, 'T00gr33n', -1, 'Log/protect', 'unprotected "[[Caipedia:About]]"', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(22, '20080126071604', '20080126071604', 1, 'T00gr33n', 0, 'Chinese_cuisine', '', 0, 0, 0, 2, 23, 20, 0, 0, '', 1, '127.0.0.1', 91, 317, 0, 0, NULL, NULL, NULL),
(23, '20080126071757', '20080126071757', 1, 'T00gr33n', 0, 'Chinese_cuisine', '', 0, 0, 0, 2, 24, 23, 0, 0, '', 1, '127.0.0.1', 317, 344, 0, 0, NULL, NULL, NULL),
(24, '20080126071822', '20080126071822', 1, 'T00gr33n', 0, 'General/Common', 'New page: [[Dan Chao Fan]]', 0, 0, 1, 7, 25, 0, 1, 0, '', 1, '127.0.0.1', 0, 16, 0, 0, NULL, NULL, NULL),
(25, '20080126071854', '20080126071854', 1, 'T00gr33n', 0, 'Chinese_cuisine', '', 0, 0, 0, 2, 26, 24, 0, 0, '', 1, '127.0.0.1', 344, 250, 0, 0, NULL, NULL, NULL),
(26, '20080126071907', '20080126071907', 1, 'T00gr33n', 0, 'General/Common', '', 0, 0, 0, 7, 27, 25, 0, 0, '', 1, '127.0.0.1', 16, 91, 0, 0, NULL, NULL, NULL),
(27, '20080126071943', '20080126071943', 1, 'T00gr33n', 0, 'Dan_Chao_Fan', '', 0, 0, 0, 3, 28, 16, 0, 0, '', 1, '127.0.0.1', 2332, 2332, 0, 0, NULL, NULL, NULL),
(28, '20080126072134', '20080126072134', 1, 'T00gr33n', 0, 'Dan_Chao_Fan', '', 0, 0, 0, 3, 29, 28, 0, 0, '', 1, '127.0.0.1', 2332, 2290, 0, 0, NULL, NULL, NULL),
(29, '20080126073143', '20080126073143', 1, 'T00gr33n', 0, 'Main_Page', '', 0, 0, 0, 1, 30, 10, 0, 0, '', 1, '127.0.0.1', 609, 773, 0, 0, NULL, NULL, NULL),
(30, '20080126074136', '20080126074136', 1, 'T00gr33n', 0, 'Main_Page', '', 0, 0, 0, 1, 31, 30, 0, 0, '', 1, '127.0.0.1', 773, 872, 0, 0, NULL, NULL, NULL),
(31, '20080126074720', '20080126074720', 1, 'T00gr33n', 0, 'Main_Page', '', 0, 0, 0, 1, 32, 31, 0, 0, '', 1, '127.0.0.1', 872, 1018, 0, 0, NULL, NULL, NULL),
(32, '20080126074843', '20080126074843', 1, 'T00gr33n', 0, 'Main_Page', '', 0, 0, 0, 1, 33, 32, 0, 0, '', 1, '127.0.0.1', 1018, 1056, 0, 0, NULL, NULL, NULL),
(33, '20080126074926', '20080126074926', 1, 'T00gr33n', 0, 'Main_Page', '', 0, 0, 0, 1, 34, 33, 0, 0, '', 1, '127.0.0.1', 1056, 1115, 0, 0, NULL, NULL, NULL),
(34, '20080126075230', '20080126075230', 1, 'T00gr33n', -1, 'Log/move', '[[Chinese cuisine]] moved to [[Chinese]]', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(35, '20080126075728', '20080126075728', 1, 'T00gr33n', 0, 'Main_Page', '', 0, 0, 0, 1, 37, 34, 0, 0, '', 1, '127.0.0.1', 1115, 1115, 0, 0, NULL, NULL, NULL),
(36, '20080126075757', '20080126075757', 1, 'T00gr33n', 0, 'Main_Page', '', 0, 0, 0, 1, 38, 37, 0, 0, '', 1, '127.0.0.1', 1115, 1115, 0, 0, NULL, NULL, NULL),
(37, '20080126075821', '20080126075821', 1, 'T00gr33n', 0, 'Main_Page', '', 0, 0, 0, 1, 39, 38, 0, 0, '', 1, '127.0.0.1', 1115, 1116, 0, 0, NULL, NULL, NULL),
(38, '20080126075943', '20080126075943', 1, 'T00gr33n', 0, 'Main_Page', '', 0, 0, 0, 1, 40, 39, 0, 0, '', 1, '127.0.0.1', 1116, 1117, 0, 0, NULL, NULL, NULL),
(39, '20080126080554', '20080126080554', 1, 'T00gr33n', 0, 'Main_Page', '', 0, 0, 0, 1, 41, 40, 0, 0, '', 1, '127.0.0.1', 1117, 1121, 0, 0, NULL, NULL, NULL),
(40, '20080126080711', '20080126080711', 1, 'T00gr33n', 0, 'Contact_us', 'New page: To report an incident, add an additional category or correct any information that is not editable, please contact the webmaster at:  [mailto:toogreen@gmail.com]', 0, 0, 1, 9, 42, 0, 1, 0, '', 1, '127.0.0.1', 0, 160, 0, 0, NULL, NULL, NULL),
(41, '20080126080743', '20080126080743', 1, 'T00gr33n', 0, 'Contact_us', '', 0, 0, 0, 9, 43, 42, 0, 0, '', 1, '127.0.0.1', 160, 171, 0, 0, NULL, NULL, NULL),
(42, '20080126080801', '20080126080801', 1, 'T00gr33n', 0, 'Contact_us', '', 0, 0, 0, 9, 44, 43, 0, 0, '', 1, '127.0.0.1', 171, 178, 0, 0, NULL, NULL, NULL),
(43, '20080126081928', '20080126081928', 1, 'T00gr33n', 4, 'Privacy_policy', 'New page: == Summary ==  If you only read the Wikimedia project websites, no more information is collected than is typically collected in server logs by web sites in general.  If you contribute to t...', 0, 0, 1, 10, 45, 0, 1, 0, '', 1, '127.0.0.1', 0, 10791, 0, 0, NULL, NULL, NULL),
(44, '20080126082412', '20080126082412', 1, 'T00gr33n', 4, 'General_disclaimer', 'New page: This is an informational website of the Wikimedia Foundation (hereafter "Wikimedia").  The content of this site is being provided freely, and no kind of agreement or contract is created be...', 0, 0, 1, 11, 46, 0, 1, 0, '', 1, '127.0.0.1', 0, 1897, 0, 0, NULL, NULL, NULL),
(45, '20080126082636', '20080126082636', 1, 'T00gr33n', 4, 'General_disclaimer', '', 0, 0, 0, 11, 47, 46, 0, 0, '', 1, '127.0.0.1', 1897, 1767, 0, 0, NULL, NULL, NULL),
(46, '20080126082703', '20080126082703', 1, 'T00gr33n', 4, 'General_disclaimer', '', 0, 0, 0, 11, 48, 47, 0, 0, '', 1, '127.0.0.1', 1767, 1736, 0, 0, NULL, NULL, NULL),
(47, '20080126082725', '20080126082725', 1, 'T00gr33n', -1, 'Log/protect', 'unprotected "[[Caipedia:General disclaimer]]"', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(48, '20080126082736', '20080126082736', 1, 'T00gr33n', -1, 'Log/protect', 'unprotected "[[Caipedia:About]]"', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(49, '20080126082745', '20080126082745', 1, 'T00gr33n', -1, 'Log/protect', 'unprotected "[[Caipedia:About]]"', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(50, '20080126082756', '20080126082756', 1, 'T00gr33n', -1, 'Log/protect', 'unprotected "[[Caipedia:About]]"', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(51, '20080126082811', '20080126082811', 1, 'T00gr33n', -1, 'Log/protect', 'unprotected "[[Caipedia:Privacy policy]]"', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(52, '20080126083700', '20080126083700', 1, 'T00gr33n', 4, 'Privacy_policy', '', 0, 0, 0, 10, 54, 53, 0, 0, '', 1, '127.0.0.1', 10791, 8341, 0, 0, NULL, NULL, NULL),
(53, '20080126085943', '20080126085943', 1, 'T00gr33n', -1, 'Log/protect', 'protected "[[Contact us]]": [edit=sysop:move=sysop]', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(54, '20080126085951', '20080126085951', 1, 'T00gr33n', -1, 'Log/protect', 'unprotected "[[Contact us]]"', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(55, '20080126085955', '20080126085955', 1, 'T00gr33n', -1, 'Log/protect', 'unprotected "[[Contact us]]"', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(56, '20080126090001', '20080126090001', 1, 'T00gr33n', -1, 'Log/protect', 'protected "[[Contact us]]": [edit=sysop:move=sysop]', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(57, '20080126090035', '20080126090035', 1, 'T00gr33n', -1, 'Log/protect', 'protected "[[Caipedia:General disclaimer]]": [edit=sysop:move=sysop]', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(58, '20080126090054', '20080126090054', 1, 'T00gr33n', -1, 'Log/protect', 'protected "[[Caipedia:About]]": [edit=sysop:move=sysop]', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(59, '20080126090104', '20080126090104', 1, 'T00gr33n', -1, 'Log/protect', 'protected "[[Caipedia:Privacy policy]]": [edit=sysop:move=sysop]', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(60, '20080126160933', '20080126160933', 1, 'T00gr33n', 0, 'Main_Page', '', 0, 0, 0, 1, 62, 41, 0, 0, '', 1, '127.0.0.1', 1121, 569, 0, 0, NULL, NULL, NULL),
(61, '20080126160949', '20080126160949', 1, 'T00gr33n', 0, 'English', 'New page: Click on a category below then click "edit" to add a new recipe. Please [[contact us]] if you''d wish to create another category.  <TABLE width="100%" valign="top">     <TR valign="top">   ...', 0, 0, 1, 12, 63, 0, 1, 0, '', 1, '127.0.0.1', 0, 592, 0, 0, NULL, NULL, NULL),
(62, '20080126161000', '20080126161000', 1, 'T00gr33n', -1, 'Log/protect', 'protected "[[English]]": [edit=autoconfirmed:move=autoconfirmed]', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(63, '20080126161050', '20080126161050', 1, 'T00gr33n', 0, 'Main_Page', '', 0, 0, 0, 1, 65, 62, 0, 0, '', 1, '127.0.0.1', 569, 577, 0, 0, NULL, NULL, NULL),
(64, '20080126161635', '20080126161635', 1, 'T00gr33n', 0, 'Chinese/CN', 'New page: Click on a category below then click "edit" to add a new recipe. Please [[contact us]] if you''d wish to create another category.  <TABLE width="100%" valign="top">     <TR valign="top">   ...', 0, 0, 1, 13, 66, 0, 1, 0, '', 1, '127.0.0.1', 0, 534, 0, 0, NULL, NULL, NULL),
(65, '20080126161746', '20080126161746', 1, 'T00gr33n', 0, 'English/EN', 'New page: Click on a category below then click "edit" to add a new recipe. Please [[contact us]] if you''d wish to create another category.  <TABLE width="100%" valign="top">     <TR valign="top">   ...', 0, 0, 1, 14, 67, 0, 1, 0, '', 1, '127.0.0.1', 0, 592, 0, 0, NULL, NULL, NULL),
(66, '20080126161902', '20080126161902', 1, 'T00gr33n', -1, 'Log/move', '[[English/EN]] moved to [[English ï½œè‹±è¯­]]', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(67, '20080126162000', '20080126162000', 1, 'T00gr33n', 0, 'Main_Page', '', 0, 0, 0, 1, 70, 65, 0, 0, '', 1, '127.0.0.1', 577, 584, 0, 0, NULL, NULL, NULL),
(68, '20080126162100', '20080126162100', 1, 'T00gr33n', 0, 'Main_Page', '', 0, 0, 0, 1, 71, 70, 0, 0, '', 1, '127.0.0.1', 584, 583, 0, 0, NULL, NULL, NULL),
(69, '20080126162129', '20080126162129', 1, 'T00gr33n', -1, 'Log/move', '[[Chinese/CN]] moved to [[Chinese ï½œ ä¸­æ–‡]]', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(70, '20080126162300', '20080126162300', 1, 'T00gr33n', 0, 'Main_Page', '', 0, 0, 0, 1, 74, 71, 0, 0, '', 1, '127.0.0.1', 583, 588, 0, 0, NULL, NULL, NULL),
(71, '20080126162512', '20080126162512', 1, 'T00gr33n', -1, 'Log/move', '[[Chinese ï½œ ä¸­æ–‡]] moved to [[ä¸­æ–‡]]', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(72, '20080126162601', '20080126162601', 1, 'T00gr33n', -1, 'Log/move', '[[ä¸­æ–‡]] moved to [[Chinese - ä¸­æ–‡]]', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(73, '20080126162622', '20080126162622', 1, 'T00gr33n', 0, 'Main_Page', '', 0, 0, 0, 1, 79, 74, 0, 0, '', 1, '127.0.0.1', 588, 588, 0, 0, NULL, NULL, NULL),
(74, '20080126162842', '20080126162842', 1, 'T00gr33n', 0, 'ä¸­å›½', 'New page: ''''''Choose by Province/Style:'''''' <ul> <li>[[General/Common]]</li> <li>[[Sichuanese]]</li> <li>[[Hunanese]]</li> <li>[[Cantonese]]</li> <li>[[Shanghainese]]</li> <li>[[HangBang]]</li> <li>[[...', 0, 0, 1, 19, 80, 0, 1, 0, '', 1, '127.0.0.1', 0, 250, 0, 0, NULL, NULL, NULL),
(75, '20080126162909', '20080126162909', 1, 'T00gr33n', -1, 'Log/move', '[[English ï½œè‹±è¯­]] moved to [[English - è‹±è¯­]]', 0, 0, 0, 0, 0, 0, 3, 0, '', 1, '127.0.0.1', NULL, NULL, 0, 0, NULL, NULL, NULL),
(76, '20080126162922', '20080126162922', 1, 'T00gr33n', 0, 'Main_Page', '', 0, 0, 0, 1, 83, 79, 0, 0, '', 1, '127.0.0.1', 588, 587, 0, 0, NULL, NULL, NULL),
(77, '20080126162955', '20080126162955', 1, 'T00gr33n', 0, 'Chinese_-_ä¸­æ–‡', '', 0, 0, 0, 13, 84, 77, 0, 0, '', 1, '127.0.0.1', 534, 533, 0, 0, NULL, NULL, NULL),
(78, '20080126163235', '20080126163235', 0, '192.168.0.133', 0, 'ä¸­å›½', '', 0, 0, 0, 19, 85, 80, 0, 0, '', 0, '192.168.0.133', 250, 222, 0, 0, NULL, NULL, NULL),
(79, '20080126163520', '20080126163520', 1, 'T00gr33n', 0, 'ä¸­å›½', '', 0, 0, 0, 19, 86, 85, 0, 0, '', 1, '127.0.0.1', 222, 222, 0, 0, NULL, NULL, NULL),
(80, '20080126163556', '20080126163556', 1, 'T00gr33n', 0, 'ä¸­å›½', '', 0, 0, 0, 19, 87, 86, 0, 0, '', 1, '127.0.0.1', 222, 222, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cp1_redirect`
--

CREATE TABLE IF NOT EXISTS `cp1_redirect` (
  `rd_from` int(10) unsigned NOT NULL default '0',
  `rd_namespace` int(11) NOT NULL default '0',
  `rd_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  PRIMARY KEY  (`rd_from`),
  KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_redirect`
--

INSERT INTO `cp1_redirect` (`rd_from`, `rd_namespace`, `rd_title`) VALUES
(8, 0, 'Chinese'),
(18, 0, 'Chinese_-_ä¸­æ–‡'),
(16, 0, 'Chinese_ï½œ_ä¸­æ–‡'),
(20, 0, 'English_-_è‹±è¯­'),
(15, 0, 'English_ï½œè‹±è¯­'),
(17, 0, 'ä¸­æ–‡');

-- --------------------------------------------------------

--
-- Table structure for table `cp1_revision`
--

CREATE TABLE IF NOT EXISTS `cp1_revision` (
  `rev_id` int(10) unsigned NOT NULL auto_increment,
  `rev_page` int(10) unsigned NOT NULL,
  `rev_text_id` int(10) unsigned NOT NULL,
  `rev_comment` tinyblob NOT NULL,
  `rev_user` int(10) unsigned NOT NULL default '0',
  `rev_user_text` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `rev_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `rev_minor_edit` tinyint(3) unsigned NOT NULL default '0',
  `rev_deleted` tinyint(3) unsigned NOT NULL default '0',
  `rev_len` int(10) unsigned default NULL,
  `rev_parent_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`rev_page`,`rev_id`),
  UNIQUE KEY `rev_id` (`rev_id`),
  KEY `rev_timestamp` (`rev_timestamp`),
  KEY `page_timestamp` (`rev_page`,`rev_timestamp`),
  KEY `user_timestamp` (`rev_user`,`rev_timestamp`),
  KEY `usertext_timestamp` (`rev_user_text`,`rev_timestamp`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 MAX_ROWS=10000000 AVG_ROW_LENGTH=1024 AUTO_INCREMENT=88 ;

--
-- Dumping data for table `cp1_revision`
--

INSERT INTO `cp1_revision` (`rev_id`, `rev_page`, `rev_text_id`, `rev_comment`, `rev_user`, `rev_user_text`, `rev_timestamp`, `rev_minor_edit`, `rev_deleted`, `rev_len`, `rev_parent_id`) VALUES
(1, 1, 1, '', 0, 'MediaWiki default', '20071117152728', 0, 0, 449, NULL),
(2, 1, 2, 0x2f2a2047657474696e672073746172746564202a2f, 0, '127.0.0.1', '20071117152853', 0, 0, 456, NULL),
(3, 1, 3, '', 2, 'Toogreen', '20071117164044', 0, 0, 484, NULL),
(4, 1, 4, '', 2, 'Toogreen', '20071117164133', 0, 0, 525, NULL),
(5, 1, 5, '', 2, 'Toogreen', '20071117164217', 0, 0, 524, NULL),
(6, 1, 6, '', 2, 'Toogreen', '20071117164333', 0, 0, 609, NULL),
(10, 1, 6, 0x50726f74656374656420225b5b4d61696e20506167655d5d22205b656469743d7379736f703a6d6f76653d7379736f705d, 1, 'T00gr33n', '20071117165500', 1, 0, NULL, NULL),
(30, 1, 28, '', 1, 'T00gr33n', '20080126073143', 0, 0, 773, NULL),
(31, 1, 29, '', 1, 'T00gr33n', '20080126074136', 0, 0, 872, NULL),
(32, 1, 30, '', 1, 'T00gr33n', '20080126074720', 0, 0, 1018, NULL),
(33, 1, 31, '', 1, 'T00gr33n', '20080126074843', 0, 0, 1056, NULL),
(34, 1, 32, '', 1, 'T00gr33n', '20080126074926', 0, 0, 1115, NULL),
(37, 1, 34, '', 1, 'T00gr33n', '20080126075728', 0, 0, 1115, NULL),
(38, 1, 35, '', 1, 'T00gr33n', '20080126075757', 0, 0, 1115, NULL),
(39, 1, 36, '', 1, 'T00gr33n', '20080126075821', 0, 0, 1116, NULL),
(40, 1, 37, '', 1, 'T00gr33n', '20080126075943', 0, 0, 1117, NULL),
(41, 1, 38, '', 1, 'T00gr33n', '20080126080554', 0, 0, 1121, NULL),
(62, 1, 47, '', 1, 'T00gr33n', '20080126160933', 0, 0, 569, NULL),
(65, 1, 49, '', 1, 'T00gr33n', '20080126161050', 0, 0, 577, NULL),
(70, 1, 53, '', 1, 'T00gr33n', '20080126162000', 0, 0, 584, NULL),
(71, 1, 54, '', 1, 'T00gr33n', '20080126162100', 0, 0, 583, NULL),
(74, 1, 56, '', 1, 'T00gr33n', '20080126162300', 0, 0, 588, NULL),
(79, 1, 59, '', 1, 'T00gr33n', '20080126162622', 0, 0, 588, NULL),
(83, 1, 62, '', 1, 'T00gr33n', '20080126162922', 0, 0, 587, NULL),
(7, 2, 7, 0x4e657720706167653a205b5b44616e204368616f2046616e5d5d205b5b446120646f7520747520646f755d5d, 2, 'Toogreen', '20071117164417', 0, 0, 34, NULL),
(8, 2, 8, '', 2, 'Toogreen', '20071117164433', 0, 0, 42, NULL),
(9, 2, 9, '', 1, 'T00gr33n', '20071117165436', 0, 0, 63, NULL),
(17, 2, 16, '', 2, 'Toogreen', '20080101144353', 0, 0, 86, NULL),
(18, 2, 17, '', 0, '127.0.0.1', '20080126064457', 0, 0, 106, NULL),
(19, 2, 18, '', 0, '127.0.0.1', '20080126064511', 0, 0, 109, NULL),
(20, 2, 19, '', 0, '127.0.0.1', '20080126065230', 0, 0, 91, NULL),
(23, 2, 21, '', 1, 'T00gr33n', '20080126071604', 0, 0, 317, NULL),
(24, 2, 22, '', 1, 'T00gr33n', '20080126071757', 0, 0, 344, NULL),
(26, 2, 24, '', 1, 'T00gr33n', '20080126071854', 0, 0, 250, NULL),
(35, 2, 24, 0x5b5b4368696e6573652063756973696e655d5d206d6f76656420746f205b5b4368696e6573655d5d, 1, 'T00gr33n', '20080126075230', 1, 0, NULL, NULL),
(11, 3, 10, 0x4e657720706167653a20556e6c696b65207768697465207269636520776869636820697320616c776179732073657276656420696e20696e646976696475616c20626f776c732c2066726965642072696365207769746820697473206d616e7920696e6772656469656e74732c20697320636f6e7369646572656420616c6d6f7374206120636f6d706c657465206d65616c20616e6420697320736572766564206f6e206120636f6d6d756e616c20706c6174652e204d6f73742054616977616e65736520742e2e2e, 1, 'T00gr33n', '20071117170541', 0, 0, 2265, NULL),
(12, 3, 11, '', 2, 'Toogreen', '20071117170750', 0, 0, 2286, NULL),
(14, 3, 13, '', 2, 'Toogreen', '20071117170911', 0, 0, 2332, NULL),
(16, 3, 15, '', 2, 'Toogreen', '20071119140242', 0, 0, 2332, NULL),
(28, 3, 26, '', 1, 'T00gr33n', '20080126071943', 0, 0, 2332, NULL),
(29, 3, 27, '', 1, 'T00gr33n', '20080126072134', 0, 0, 2290, NULL),
(13, 4, 12, 0x4e657720706167653a20687474703a2f2f7777772e656174696e676368696e612e636f6d2f696d616765732d726563697065732f6672696564726963652e6a7067, 2, 'Toogreen', '20071117170815', 0, 0, 55, NULL),
(15, 5, 14, 0xe696b0e9a1b5e99da23a207361, 0, '192.168.0.132', '20071117173039', 0, 0, 2, NULL),
(21, 6, 20, 0x4e657720706167653a2043616970656469612068617320666f7220676f616c20746f206265636f6d6520544845206269676765737420636f6f6b696e6720626f6f6b206f6e2074686520496e7465726e65742e202020576520636f756e74206f6e20796f752c207468652075736572732c20746f2066696c6c2074686973207669727475616c20626f6f6b20627920616464696e6720796f7572206f776e2072656369706573212020204665656c206672656520746f20696e636c75646520696d61676573202e2e2e, 2, 'Toogreen', '20080126070204', 0, 0, 280, NULL),
(22, 6, 20, 0x556e70726f74656374656420225b5b43616970656469613a41626f75745d5d22, 1, 'T00gr33n', '20080126071048', 1, 0, NULL, NULL),
(50, 6, 20, 0x556e70726f74656374656420225b5b43616970656469613a41626f75745d5d22, 1, 'T00gr33n', '20080126082736', 1, 0, NULL, NULL),
(51, 6, 20, 0x556e70726f74656374656420225b5b43616970656469613a41626f75745d5d22, 1, 'T00gr33n', '20080126082745', 1, 0, NULL, NULL),
(52, 6, 20, 0x556e70726f74656374656420225b5b43616970656469613a41626f75745d5d22, 1, 'T00gr33n', '20080126082756', 1, 0, NULL, NULL),
(60, 6, 20, 0x50726f74656374656420225b5b43616970656469613a41626f75745d5d22205b656469743d7379736f703a6d6f76653d7379736f705d, 1, 'T00gr33n', '20080126090054', 1, 0, NULL, NULL),
(25, 7, 23, 0x4e657720706167653a205b5b44616e204368616f2046616e5d5d, 1, 'T00gr33n', '20080126071822', 0, 0, 16, NULL),
(27, 7, 25, '', 1, 'T00gr33n', '20080126071907', 0, 0, 91, NULL),
(36, 8, 33, 0x5b5b4368696e6573652063756973696e655d5d206d6f76656420746f205b5b4368696e6573655d5d, 1, 'T00gr33n', '20080126075230', 0, 0, 21, NULL),
(42, 9, 39, 0x4e657720706167653a20546f207265706f727420616e20696e636964656e742c2061646420616e206164646974696f6e616c2063617465676f7279206f7220636f727265637420616e7920696e666f726d6174696f6e2074686174206973206e6f74206564697461626c652c20706c6561736520636f6e7461637420746865207765626d61737465722061743a20205b6d61696c746f3a746f6f677265656e40676d61696c2e636f6d5d, 1, 'T00gr33n', '20080126080711', 0, 0, 160, NULL),
(43, 9, 40, '', 1, 'T00gr33n', '20080126080743', 0, 0, 171, NULL),
(44, 9, 41, '', 1, 'T00gr33n', '20080126080801', 0, 0, 178, NULL),
(55, 9, 41, 0x50726f74656374656420225b5b436f6e746163742075735d5d22205b656469743d7379736f703a6d6f76653d7379736f705d, 1, 'T00gr33n', '20080126085943', 1, 0, NULL, NULL),
(56, 9, 41, 0x556e70726f74656374656420225b5b436f6e746163742075735d5d22, 1, 'T00gr33n', '20080126085951', 1, 0, NULL, NULL),
(57, 9, 41, 0x556e70726f74656374656420225b5b436f6e746163742075735d5d22, 1, 'T00gr33n', '20080126085955', 1, 0, NULL, NULL),
(58, 9, 41, 0x50726f74656374656420225b5b436f6e746163742075735d5d22205b656469743d7379736f703a6d6f76653d7379736f705d, 1, 'T00gr33n', '20080126090001', 1, 0, NULL, NULL),
(45, 10, 42, 0x4e657720706167653a203d3d2053756d6d617279203d3d2020496620796f75206f6e6c792072656164207468652057696b696d656469612070726f6a6563742077656273697465732c206e6f206d6f726520696e666f726d6174696f6e20697320636f6c6c6563746564207468616e206973207479706963616c6c7920636f6c6c656374656420696e20736572766572206c6f67732062792077656220736974657320696e2067656e6572616c2e2020496620796f7520636f6e7472696275746520746f20742e2e2e, 1, 'T00gr33n', '20080126081928', 0, 0, 10791, NULL),
(53, 10, 42, 0x556e70726f74656374656420225b5b43616970656469613a5072697661637920706f6c6963795d5d22, 1, 'T00gr33n', '20080126082811', 1, 0, NULL, NULL),
(54, 10, 46, '', 1, 'T00gr33n', '20080126083700', 0, 0, 8341, NULL),
(61, 10, 46, 0x50726f74656374656420225b5b43616970656469613a5072697661637920706f6c6963795d5d22205b656469743d7379736f703a6d6f76653d7379736f705d, 1, 'T00gr33n', '20080126090104', 1, 0, NULL, NULL),
(46, 11, 43, 0x4e657720706167653a205468697320697320616e20696e666f726d6174696f6e616c2077656273697465206f66207468652057696b696d6564696120466f756e646174696f6e2028686572656166746572202257696b696d6564696122292e202054686520636f6e74656e74206f6620746869732073697465206973206265696e672070726f766964656420667265656c792c20616e64206e6f206b696e64206f662061677265656d656e74206f7220636f6e747261637420697320637265617465642062652e2e2e, 1, 'T00gr33n', '20080126082413', 0, 0, 1897, NULL),
(47, 11, 44, '', 1, 'T00gr33n', '20080126082636', 0, 0, 1767, NULL),
(48, 11, 45, '', 1, 'T00gr33n', '20080126082703', 0, 0, 1736, NULL),
(49, 11, 45, 0x556e70726f74656374656420225b5b43616970656469613a47656e6572616c20646973636c61696d65725d5d22, 1, 'T00gr33n', '20080126082725', 1, 0, NULL, NULL),
(59, 11, 45, 0x50726f74656374656420225b5b43616970656469613a47656e6572616c20646973636c61696d65725d5d22205b656469743d7379736f703a6d6f76653d7379736f705d, 1, 'T00gr33n', '20080126090035', 1, 0, NULL, NULL),
(63, 12, 48, 0x4e657720706167653a20436c69636b206f6e20612063617465676f72792062656c6f77207468656e20636c69636b2022656469742220746f206164642061206e6577207265636970652e20506c65617365205b5b636f6e746163742075735d5d20696620796f752764207769736820746f2063726561746520616e6f746865722063617465676f72792e20203c5441424c452077696474683d2231303025222076616c69676e3d22746f70223e20202020203c54522076616c69676e3d22746f70223e2020202e2e2e, 1, 'T00gr33n', '20080126160949', 0, 0, 592, NULL),
(64, 12, 48, 0x50726f74656374656420225b5b456e676c6973685d5d22205b656469743d6175746f636f6e6669726d65643a6d6f76653d6175746f636f6e6669726d65645d, 1, 'T00gr33n', '20080126161000', 1, 0, NULL, NULL),
(66, 13, 50, 0x4e657720706167653a20436c69636b206f6e20612063617465676f72792062656c6f77207468656e20636c69636b2022656469742220746f206164642061206e6577207265636970652e20506c65617365205b5b636f6e746163742075735d5d20696620796f752764207769736820746f2063726561746520616e6f746865722063617465676f72792e20203c5441424c452077696474683d2231303025222076616c69676e3d22746f70223e20202020203c54522076616c69676e3d22746f70223e2020202e2e2e, 1, 'T00gr33n', '20080126161635', 0, 0, 534, NULL),
(72, 13, 50, 0x5b5b4368696e6573652f434e5d5d206d6f76656420746f205b5b4368696e65736520efbd9c20e4b8ade696875d5d, 1, 'T00gr33n', '20080126162129', 1, 0, NULL, NULL),
(75, 13, 50, 0x5b5b4368696e65736520efbd9c20e4b8ade696875d5d206d6f76656420746f205b5be4b8ade696875d5d, 1, 'T00gr33n', '20080126162512', 1, 0, NULL, NULL),
(77, 13, 50, 0x5b5be4b8ade696875d5d206d6f76656420746f205b5b4368696e657365202d20e4b8ade696875d5d, 1, 'T00gr33n', '20080126162601', 1, 0, NULL, NULL),
(84, 13, 63, '', 1, 'T00gr33n', '20080126162955', 0, 0, 533, NULL),
(67, 14, 51, 0x4e657720706167653a20436c69636b206f6e20612063617465676f72792062656c6f77207468656e20636c69636b2022656469742220746f206164642061206e6577207265636970652e20506c65617365205b5b636f6e746163742075735d5d20696620796f752764207769736820746f2063726561746520616e6f746865722063617465676f72792e20203c5441424c452077696474683d2231303025222076616c69676e3d22746f70223e20202020203c54522076616c69676e3d22746f70223e2020202e2e2e, 1, 'T00gr33n', '20080126161746', 0, 0, 592, NULL),
(68, 14, 51, 0x5b5b456e676c6973682f454e5d5d206d6f76656420746f205b5b456e676c69736820efbd9ce88bb1e8afad5d5d, 1, 'T00gr33n', '20080126161902', 1, 0, NULL, NULL),
(81, 14, 51, 0x5b5b456e676c69736820efbd9ce88bb1e8afad5d5d206d6f76656420746f205b5b456e676c697368202d20e88bb1e8afad5d5d, 1, 'T00gr33n', '20080126162909', 1, 0, NULL, NULL),
(69, 15, 52, 0x5b5b456e676c6973682f454e5d5d206d6f76656420746f205b5b456e676c69736820efbd9ce88bb1e8afad5d5d, 1, 'T00gr33n', '20080126161902', 0, 0, 31, NULL),
(73, 16, 55, 0x5b5b4368696e6573652f434e5d5d206d6f76656420746f205b5b4368696e65736520efbd9c20e4b8ade696875d5d, 1, 'T00gr33n', '20080126162129', 0, 0, 32, NULL),
(76, 17, 57, 0x5b5b4368696e65736520efbd9c20e4b8ade696875d5d206d6f76656420746f205b5be4b8ade696875d5d, 1, 'T00gr33n', '20080126162512', 0, 0, 20, NULL),
(78, 18, 58, 0x5b5be4b8ade696875d5d206d6f76656420746f205b5b4368696e657365202d20e4b8ade696875d5d, 1, 'T00gr33n', '20080126162601', 0, 0, 30, NULL),
(80, 19, 60, 0x4e657720706167653a2027272743686f6f73652062792050726f76696e63652f5374796c653a272727203c756c3e203c6c693e5b5b47656e6572616c2f436f6d6d6f6e5d5d3c2f6c693e203c6c693e5b5b5369636875616e6573655d5d3c2f6c693e203c6c693e5b5b48756e616e6573655d5d3c2f6c693e203c6c693e5b5b43616e746f6e6573655d5d3c2f6c693e203c6c693e5b5b5368616e676861696e6573655d5d3c2f6c693e203c6c693e5b5b48616e6742616e675d5d3c2f6c693e203c6c693e5b5b2e2e2e, 1, 'T00gr33n', '20080126162842', 0, 0, 250, NULL),
(85, 19, 64, '', 0, '192.168.0.133', '20080126163235', 0, 0, 222, NULL),
(86, 19, 65, '', 1, 'T00gr33n', '20080126163520', 0, 0, 222, NULL),
(87, 19, 66, '', 1, 'T00gr33n', '20080126163556', 0, 0, 222, NULL),
(82, 20, 61, 0x5b5b456e676c69736820efbd9ce88bb1e8afad5d5d206d6f76656420746f205b5b456e676c697368202d20e88bb1e8afad5d5d, 1, 'T00gr33n', '20080126162909', 0, 0, 30, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cp1_searchindex`
--

CREATE TABLE IF NOT EXISTS `cp1_searchindex` (
  `si_page` int(10) unsigned NOT NULL,
  `si_title` varchar(255) NOT NULL default '',
  `si_text` mediumtext NOT NULL,
  UNIQUE KEY `si_page` (`si_page`),
  FULLTEXT KEY `si_title` (`si_title`),
  FULLTEXT KEY `si_text` (`si_text`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_searchindex`
--

INSERT INTO `cp1_searchindex` (`si_page`, `si_title`, `si_text`) VALUES
(1, 'main page', '  welcome to caipedia   choose language english - u8e88bb1u8e8afad chinese - u8e4b8adu8e69687 --- hide this part original  mediawiki has been successfully installed   consult the user user''s guide for information on using the wiki software getting started getting started getting started configuration settings list mediawiki faq mediawiki release mailing list hello --- '),
(2, 'chinese', '  choose by province style   general common sichuanese hunanese cantonese shanghainese hangbang dongbei xinjiang yunnan '),
(3, 'dan chao fan', ' friedrice unlike white rice which is always served in individual bowls fried rice with its many ingredients is considered almost a complete meal and is served on a communal plate most taiwanese though prefer to eat it with a soup and at least one vegetable dish serves 4 ingredients 5 cups cooked white rice 2 eggs beaten 4 stalks spring onion scallions cut into 1 cm 3 8 lengths pinch salt pinch pepper 1 tablespoon oil 4 cloves garlic lightly crushed 150 g 5 oz lean pork julienned 2 cups cabbage chopped into small pieces 1 2 cup carrot finely sliced 1 3 cup chicken stock 4 tablespoons soy sauce method notes break the rice into individual grains with your hands and put aside beat eggs add 1 4 of the spring onions the salt and pepper mix well heat a frying pan to a medium heat and smear with oil make an omelette slice into small pieces and set aside heat the rest of the oil in wok at a very low heat add garlic and fry for a minute until oil is fully garlic-flavoured - do not brown the garlic remove garlic but leave as much oil in the wok as possible bring wok to full heat add pork stirring rapidly for 30 seconds one by one add the cabbage carrots and spring onions while stirring add the stock and the soy sauce return the garlic to the wok cook vegetables for no more than a few minutes add rice and stir everything together for a few minutes until rice is hot if the rice starts to stick to the wok reduce heat add the omelette and cook for a minute more before serving on a plate the trick with fried rice is ending up with a dish that is neither to dry or too soggy you should not use freshly cooked rice as it is too gooey to make good fried rice use leftover rice or at a minimum let just-cooked rice cool in the pot for an hour without the lid you can stir it to speed up the cooling drying process then stick it in the fridge for a couple of hours again without the lid if your leftover rice has been in the fridge for a few days it will be pretty dry and you might want to add a little more water to the stock conversely same-day cooked rice might need a bit less stock '),
(4, 'friedrice', ' '),
(5, 'u8e9a696 u8e9a1b5', ' sa '),
(6, 'about', ' caipedia has for goal to become the biggest cooking book on the internet we count on you the users to fill this virtual book by adding your own recipes feel free to include images and other multimedia content such as youtube videos to better enhance your recipes enjoy '),
(8, 'chinese cuisine', ' '),
(7, 'general common', ' dan chao fan da dou tu dou gumbao ji ding '),
(12, 'english', ' click on a category below then click edit to add a new recipe please contact us if you''d wish to create another category -- left column --  asian  japan korea thailand india  western  chinese french italian german american --- right column ---  latina  spain mexico guatemala salvador chile brazil argentina  middle eastern  lebanon '),
(9, 'contact us', ' to report an incident add an additional category or correct any information that is not editable please contact the webmaster at toogreen gmail com '),
(10, 'privacy policy', ' summary if you only read the caipedia project website no more information is collected than is typically collected in server logs by web sites in general if you contribute to the caipedia project you are  publishing  every word you post publicly if you write something assume that it will be retained forever this includes articles user pages and talk pages some limited exceptions are described below publishing on the wiki and public data publishing on the wiki and public data publishing on the wiki and public data simply visiting the web site does not expose your identity publicly but see #private logging private logging below when you edit any page in the wiki  you are publishing a document  this is a public act and you are identified publicly with that edit as its author identification of an author identification of an author identification of an author when you publish a page in the wiki you may be logged in or not if you are logged in you will be identified by your user name this may be your real name if you so choose or you may choose to publish under a pseudonym whatever user name you selected when you created your account if you have not logged in you will be identified by your network ip address this is a series of four numbers which identifies the internet address from which you are contacting the wiki depending on your connection this number may be traceable only to a large internet service provider or specifically to your school place of business or home it may be possible that the origin of this ip address could be used in conjunction with any interests you express implicitly or explicitly by editing articles to identify you even by private individuals it may be either difficult or easy for a motivated individual to connect your network ip address with your real-life identity therefore if you are very concerned about privacy you may wish to log in and publish under a pseudonym when using a pseudonym your ip address will not be available to the public except in cases of abuse including vandalism of a wiki page by you or by another user with the same ip address in all cases your ip address will be stored on the wiki servers and can be seen by caipedia caipedia''s server administrators and by users who have been granted meta checkuser checkuser access your ip address and its connection to any usernames that share it may be released under certain circumstances see below if you use a company mail server from home or telecommute and use a dsl or cable internet connection it is likely to be very easy for your employer to identify your ip address and find all of your ip based caipedia project contributions using a user name is a better way of preserving your privacy in this situation however remember to log out or disconnect yourself after each session using a pseudonym on a shared computer to avoid allowing others to use your identity cookies cookies cookies the wiki will set a temporary session cookie phpsessid whenever you visit the site if you do not intend to ever log in you may deny this cookie but you cannot log in without it it will be deleted when you close your browser session more cookies may be set when you log in to avoid typing in your user name or optionally password on your next visit these last up to 30 days you may clear these cookies after use if you are using a public machine and don''t wish to expose your username to future users of the machine if so clear the browser cache as well passwords passwords passwords many aspects of the caipedia projects commun wikiity interactions depend on the reputation and respect that is built up through a history of valued contributions user passwords are the only guarantee of the integrity of a user user''s edit history all users are encouraged to select strong passwords and to never share them no one shall knowingly expose the password of another user to public release either directly or indirectly private logging private logging private logging every time you visit a web page you send a lot of information to the web server most web servers routinely maintain access logs with a portion of this information which can be used to get an overall picture of what pages are popular what other sites link to this one and what web browsers people are using it is not the intention of the caipedia projects to use this information to keep track of legitimate users the raw log data is not made public and is normally discarded after about two weeks here here''s a sample of what what''s logged for one page view 64 164 82 142 - - 21 oct 2003 02 03 19 0000 get wiki draft_privacy_policy http 1 1 200 18084 mozilla 5 0 macintosh; u; ppc mac os x; en-us applewebkit 85 7 khtml like gecko safari 85 5 log data may be examined by developers in the course of solving technical problems and in tracking down badly-behaved web spiders that overwhelm the site ip addresses of users derived either from those logs or from records in the database are frequently used to correlate usernames and network addresses of edits in investigating abuse of the wiki including the suspected use of malicious sockpuppets duplicate accounts vandalism harassment of other users or disruption of the wiki policy on release of data derived from page logs policy on release of data derived from page logs policy on release of data derived from page logs it is the policy of caipedia that personally identifiable data collected in the server logs or through records in the database via the checkuser feature may be released by the system administrators or users with checkuser access in the following situations # in response to a valid subpoena or other compulsory request from law enforcement # with permission of the affected user # to the chair of caipedia his her legal counsel or his her designee when necessary for investigation of abuse complaints # where the information pertains to page views generated by a spider or bot and its dissemination is necessary to illustrate or resolve technical issues # where the user has been vandalising articles or persistently behaving in a disruptive way data may be released to assist in the targeting of ip blocks or to assist in the formulation of a complaint to relevant internet service providers # where it is reasonably necessary to protect the rights property or safety of the caipedia web site its users or the public -- this line borrowed from google-- caipedia policy does not permit public distribution of such information under any circumstances except as described above sharing information with third parties sharing information with third parties sharing information with third parties except where otherwise specified all text added to caipedia project is available for reuse where the text is available under a creative commons license caipedia will not sell or share private information such as email addresses with third parties unless you agree to release this information or it is required by law to release the information security of information security of information security of information the caipedia web site makes no guarantee against unauthorized access to any information you provide this information may be available to anyone with access to the servers a partial list of those people can be found in the m developers developers list user data user data user data data on users such as the times at which they edited and the number of edits they have made are publicly available via user contributions lists and in aggregated forms published by other users removal of user accounts removal of user accounts removal of user accounts once created user accounts will not be removed it may be possible for a username to be changed depending on the policies of your local wiki the caipedia web site does not guarantee that a name will be changed on request whether specific user information is deleted is dependant on the deletion policies of the project that contains the information deletion of content deletion of content deletion of content removing text from caipedia does not permanently delete it in normal articles anyone can look at a previous version and see what was there if an article is deleted any user with administrator access on the wiki meaning almost anyone trusted not to abuse the deletion capability can see what was deleted information can be permanently deleted by those people with access to the servers but there is no guarantee this will happen except in response to legal action category english category policy __noeditsection__ '),
(13, 'chinese - u8e4b8adu8e69687', ' click on a category below then click edit to add a new recipe please contact us if you''d wish to create another category -- left column --  asian  u8e4b8adu8e59bbd u8e697a5u8e69cac u8e99fa9u8e59bbd u8e6b3b0u8e59bbd u8e58db0u8e5baa6  western  u8e6b395u8e59bbd u8e6848fu8e5a4a7u8e588a9 u8e5beb7u8e59bbd u8e7be8eu8e59bbd --- right column ---  latina  u8e8a5bfu8e78fadu8e78999 u8e4b988u8e8a5bfu8e4b8aa  middle eastern  u8e9bb8eu8e5b7b4u8e5aba9 '),
(14, 'english - u8e88bb1u8e8afad', ' click on a category below then click edit to add a new recipe please contact us if you''d wish to create another category -- left column --  asian  chinese japan korea thailand india  western  french italian german american --- right column ---  latina  spain mexico guatemala salvador chile brazil argentina  middle eastern  lebanon '),
(15, 'english en', ' '),
(17, 'chinese u8efbd9c u8e4b8adu8e69687', ' '),
(16, 'chinese cn', ' '),
(18, 'u8e4b8adu8e69687', ' '),
(19, 'u8e4b8adu8e59bbd', '  choose by province style   u8e5a4a7u8e4bc97 u8e59b9bu8e5b79d u8e6b996u8e58d97 u8e5b9bfu8e4b89c u8e4b88au8e6b5b7 u8e69dadu8e5b8ae u8e4b89cu8e58c97 u8e696b0u8e79686 u8e4ba91u8e58d97 '),
(20, 'english u8efbd9cu8e88bb1u8e8afad', ' '),
(11, 'general disclaimer', ' the content of this site is being provided freely and no kind of agreement or contract is created between you and the owners or users of this site the owners of the servers upon which it is housed individual contributors to these pages or project administrators sysops or anyone else connected with this project subject to your claims against them directly you are granted a limited license to copy anything from this site; it does not create or imply any contractual or extracontractual liability on the part of caipedia or any of its agents members organizers or other users any of the trademarks service marks collective marks design rights personality rights or similar rights that are mentioned used or cited on this site are the property of their respective owners unless otherwise stated caipedia sites are neither endorsed by nor affiliated with any of the holders of such rights nor can caipedia grant rights to use otherwise protected materials  your use of any such incorporeal property is at your own risk   please note that the information found here may be in violation of the laws of the country or jurisdiction from where you are viewing this information  caipedia  does not encourage the violation of any laws but this information is stored on a server in the united states of america and is maintained in reference to the protections afforded to content providers and readers in that jurisdiction the laws in your country may not recognize a similarly broad protection of free speech;  caipedia  cannot be responsible for potential violations of such laws should you link to this domain or reuse any of the information contained herein for further information please contact us ');

-- --------------------------------------------------------

--
-- Table structure for table `cp1_site_stats`
--

CREATE TABLE IF NOT EXISTS `cp1_site_stats` (
  `ss_row_id` int(10) unsigned NOT NULL,
  `ss_total_views` bigint(20) unsigned default '0',
  `ss_total_edits` bigint(20) unsigned default '0',
  `ss_good_articles` bigint(20) unsigned default '0',
  `ss_total_pages` bigint(20) default '-1',
  `ss_users` bigint(20) default '-1',
  `ss_admins` int(11) default '-1',
  `ss_images` int(11) default '0',
  UNIQUE KEY `ss_row_id` (`ss_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_site_stats`
--

INSERT INTO `cp1_site_stats` (`ss_row_id`, `ss_total_views`, `ss_total_edits`, `ss_good_articles`, `ss_total_pages`, `ss_users`, `ss_admins`, `ss_images`) VALUES
(1, 240, 63, 8, 20, 2, -1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cp1_templatelinks`
--

CREATE TABLE IF NOT EXISTS `cp1_templatelinks` (
  `tl_from` int(10) unsigned NOT NULL default '0',
  `tl_namespace` int(11) NOT NULL default '0',
  `tl_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  UNIQUE KEY `tl_from` (`tl_from`,`tl_namespace`,`tl_title`),
  KEY `tl_namespace` (`tl_namespace`,`tl_title`,`tl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_templatelinks`
--


-- --------------------------------------------------------

--
-- Table structure for table `cp1_text`
--

CREATE TABLE IF NOT EXISTS `cp1_text` (
  `old_id` int(10) unsigned NOT NULL auto_increment,
  `old_text` mediumblob NOT NULL,
  `old_flags` tinyblob NOT NULL,
  PRIMARY KEY  (`old_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 MAX_ROWS=10000000 AVG_ROW_LENGTH=10240 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `cp1_text`
--

INSERT INTO `cp1_text` (`old_id`, `old_text`, `old_flags`) VALUES
(1, 0x3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d, 0x7574662d38),
(2, 0x3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f, 0x7574662d38),
(3, 0x3c212d2d2d204849444520544849532050415254200a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(4, 0x0a3d3d200a57656c636f6d6520746f20436169706564696121203d3d0a0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(5, 0x0a27272757656c636f6d6520746f204361697065646961212727270a0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(6, 0x27272757656c636f6d6520746f204361697065646961212727270a0a436c69636b206f6e20612063617465676f72792062656c6f77207468656e20636c69636b2022656469742220746f206164642061206e6577207265636970652e0a0a5b5b4368696e6573652063756973696e655d5d0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(7, 0x5b5b44616e204368616f2046616e5d5d0a5b5b446120646f7520747520646f755d5d, 0x7574662d38),
(8, 0x5b5b44616e204368616f2046616e5d5d3c62723e3c62723e0a5b5b446120646f7520747520646f755d5d, 0x7574662d38),
(9, 0x3c756c3e0a3c6c693e5b5b44616e204368616f2046616e5d5d3c2f6c693e0a3c6c693e5b5b446120446f7520547520446f755d5d3c2f6c693e0a3c2f756c3e, 0x7574662d38),
(10, 0x556e6c696b65207768697465207269636520776869636820697320616c776179732073657276656420696e20696e646976696475616c20626f776c732c2066726965642072696365207769746820697473206d616e7920696e6772656469656e74732c20697320636f6e7369646572656420616c6d6f7374206120636f6d706c657465206d65616c20616e6420697320736572766564206f6e206120636f6d6d756e616c20706c6174652e204d6f73742054616977616e6573652074686f7567682c2070726566657220746f206561742069742077697468206120736f757020616e64206174206c65617374206f6e6520766567657461626c6520646973682e0a0a5365727665733a20340a0a496e6772656469656e74730a35206375707320636f6f6b6564203c6120687265663d22687474703a2f2f7777772e656174696e676368696e612e636f6d2f726563697065732f726963652e68746d223e776869746520726963653c2f613e0a3220656767732c2062656174656e0a34207374616c6b7320737072696e67206f6e696f6e20287363616c6c696f6e73292c2063757420696e746f203120636d2028332f382229206c656e677468730a50696e63682073616c740a50696e6368207065707065720a31207461626c6573706f6f6e206f696c0a3420636c6f766573206761726c69632c206c696768746c7920637275736865640a3135302067202835206f7a29206c65616e20706f726b2c206a756c69656e6e65640a32206375707320636162626167652c2063686f7070656420696e746f20736d616c6c207069656365730a312f322063757020636172726f742c2066696e656c7920736c696365640a312f332063757020636869636b656e2073746f636b0a34207461626c6573706f6f6e7320736f792073617563650a0a4d6574686f640a0a4e6f7465733c6f6c3e0a20203c6c693e427265616b20746865207269636520696e746f20696e646976696475616c20677261696e73207769746820796f75722068616e647320616e640a7075742061736964652e3c2f6c693e0a20203c6c693e4265617420656767732e2041646420312f34206f662074686520737072696e67206f6e696f6e732c207468652073616c7420616e640a7065707065722e204d69782077656c6c2e2048656174206120667279696e672070616e20746f2061206d656469756d206865617420616e6420736d65617220776974680a6f696c2e204d616b6520616e206f6d656c657474652e20536c69636520696e746f20736d616c6c2070696563657320616e64207365742061736964652e3c2f6c693e0a20203c6c693e48656174207468652072657374206f6620746865206f696c20696e20776f6b20617420612076657279206c6f7720686561742e204164640a6761726c696320616e642066727920666f722061206d696e75746520756e74696c206f696c2069732066756c6c79206761726c69632d666c61766f75726564202d20646f0a6e6f742062726f776e20746865206761726c69632e2052656d6f7665206761726c696320627574206c65617665206173206d756368206f696c20696e2074686520776f6b2061730a706f737369626c652e3c2f6c693e0a20203c6c693e4272696e6720776f6b20746f2066756c6c20686561742e2041646420706f726b2c207374697272696e672072617069646c7920666f722033300a7365636f6e64732e204f6e65206279206f6e65206164642074686520636162626167652c20636172726f74732c20616e6420737072696e67206f6e696f6e73207768696c650a7374697272696e672e20416464207468652073746f636b20616e642074686520736f792073617563652e2052657475726e20746865206761726c696320746f207468650a776f6b2e20436f6f6b20766567657461626c657320666f72206e6f206d6f7265207468616e206120666577206d696e757465732e3c2f6c693e0a20203c6c693e416464207269636520616e6420737469722065766572797468696e6720746f67657468657220666f72206120666577206d696e757465730a756e74696c207269636520697320686f742e2049662074686520726963652073746172747320746f20737469636b20746f2074686520776f6b2c2072656475636520686561742e0a41646420746865206f6d656c6574746520616e6420636f6f6b20666f722061206d696e757465206d6f7265206265666f72652073657276696e67206f6e206120706c6174652e3c2f6c693e0a3c2f6f6c3e0a0a54686520747269636b2077697468206672696564207269636520697320656e64696e672075702077697468206120646973682074686174206973206e65697468657220746f20647279206f7220746f6f20736f6767792e20596f752073686f756c64206e6f74207573652066726573686c7920636f6f6b6564207269636520617320697420697320746f6f20676f6f657920746f206d616b6520676f6f6420667269656420726963652e20557365206c6566746f76657220726963652c206f722061742061206d696e696d756d2c206c6574206a7573742d636f6f6b6564207269636520636f6f6c20696e2074686520706f7420666f7220616e20686f757220776974686f757420746865206c69642e20596f752063616e207374697220697420746f2073706565642075702074686520636f6f6c696e672f647279696e672070726f636573732e205468656e20737469636b20697420696e207468652066726964676520666f72206120636f75706c65206f6620686f7572732c20616761696e20776974686f757420746865206c69642e20496620796f7572206c6566746f766572207269636520686173206265656e20696e207468652066726964676520666f7220612066657720646179732c2069742077696c6c206265207072657474792064727920616e6420796f75206d696768742077616e7420746f206164642061206c6974746c65206d6f726520776174657220746f207468652073746f636b2e20436f6e76657273656c792c2073616d652d64617920636f6f6b65642072696365206d69676874206e656564206120626974206c6573732073746f636b2e, 0x7574662d38),
(11, 0x5b5b496d6167653a6672696564726963655d5d0a0a556e6c696b65207768697465207269636520776869636820697320616c776179732073657276656420696e20696e646976696475616c20626f776c732c2066726965642072696365207769746820697473206d616e7920696e6772656469656e74732c20697320636f6e7369646572656420616c6d6f7374206120636f6d706c657465206d65616c20616e6420697320736572766564206f6e206120636f6d6d756e616c20706c6174652e204d6f73742054616977616e6573652074686f7567682c2070726566657220746f206561742069742077697468206120736f757020616e64206174206c65617374206f6e6520766567657461626c6520646973682e0a0a5365727665733a20340a0a496e6772656469656e74730a35206375707320636f6f6b6564203c6120687265663d22687474703a2f2f7777772e656174696e676368696e612e636f6d2f726563697065732f726963652e68746d223e776869746520726963653c2f613e0a3220656767732c2062656174656e0a34207374616c6b7320737072696e67206f6e696f6e20287363616c6c696f6e73292c2063757420696e746f203120636d2028332f382229206c656e677468730a50696e63682073616c740a50696e6368207065707065720a31207461626c6573706f6f6e206f696c0a3420636c6f766573206761726c69632c206c696768746c7920637275736865640a3135302067202835206f7a29206c65616e20706f726b2c206a756c69656e6e65640a32206375707320636162626167652c2063686f7070656420696e746f20736d616c6c207069656365730a312f322063757020636172726f742c2066696e656c7920736c696365640a312f332063757020636869636b656e2073746f636b0a34207461626c6573706f6f6e7320736f792073617563650a0a4d6574686f640a0a4e6f7465733c6f6c3e0a20203c6c693e427265616b20746865207269636520696e746f20696e646976696475616c20677261696e73207769746820796f75722068616e647320616e640a7075742061736964652e3c2f6c693e0a20203c6c693e4265617420656767732e2041646420312f34206f662074686520737072696e67206f6e696f6e732c207468652073616c7420616e640a7065707065722e204d69782077656c6c2e2048656174206120667279696e672070616e20746f2061206d656469756d206865617420616e6420736d65617220776974680a6f696c2e204d616b6520616e206f6d656c657474652e20536c69636520696e746f20736d616c6c2070696563657320616e64207365742061736964652e3c2f6c693e0a20203c6c693e48656174207468652072657374206f6620746865206f696c20696e20776f6b20617420612076657279206c6f7720686561742e204164640a6761726c696320616e642066727920666f722061206d696e75746520756e74696c206f696c2069732066756c6c79206761726c69632d666c61766f75726564202d20646f0a6e6f742062726f776e20746865206761726c69632e2052656d6f7665206761726c696320627574206c65617665206173206d756368206f696c20696e2074686520776f6b2061730a706f737369626c652e3c2f6c693e0a20203c6c693e4272696e6720776f6b20746f2066756c6c20686561742e2041646420706f726b2c207374697272696e672072617069646c7920666f722033300a7365636f6e64732e204f6e65206279206f6e65206164642074686520636162626167652c20636172726f74732c20616e6420737072696e67206f6e696f6e73207768696c650a7374697272696e672e20416464207468652073746f636b20616e642074686520736f792073617563652e2052657475726e20746865206761726c696320746f207468650a776f6b2e20436f6f6b20766567657461626c657320666f72206e6f206d6f7265207468616e206120666577206d696e757465732e3c2f6c693e0a20203c6c693e416464207269636520616e6420737469722065766572797468696e6720746f67657468657220666f72206120666577206d696e757465730a756e74696c207269636520697320686f742e2049662074686520726963652073746172747320746f20737469636b20746f2074686520776f6b2c2072656475636520686561742e0a41646420746865206f6d656c6574746520616e6420636f6f6b20666f722061206d696e757465206d6f7265206265666f72652073657276696e67206f6e206120706c6174652e3c2f6c693e0a3c2f6f6c3e0a0a54686520747269636b2077697468206672696564207269636520697320656e64696e672075702077697468206120646973682074686174206973206e65697468657220746f20647279206f7220746f6f20736f6767792e20596f752073686f756c64206e6f74207573652066726573686c7920636f6f6b6564207269636520617320697420697320746f6f20676f6f657920746f206d616b6520676f6f6420667269656420726963652e20557365206c6566746f76657220726963652c206f722061742061206d696e696d756d2c206c6574206a7573742d636f6f6b6564207269636520636f6f6c20696e2074686520706f7420666f7220616e20686f757220776974686f757420746865206c69642e20596f752063616e207374697220697420746f2073706565642075702074686520636f6f6c696e672f647279696e672070726f636573732e205468656e20737469636b20697420696e207468652066726964676520666f72206120636f75706c65206f6620686f7572732c20616761696e20776974686f757420746865206c69642e20496620796f7572206c6566746f766572207269636520686173206265656e20696e207468652066726964676520666f7220612066657720646179732c2069742077696c6c206265207072657474792064727920616e6420796f75206d696768742077616e7420746f206164642061206c6974746c65206d6f726520776174657220746f207468652073746f636b2e20436f6e76657273656c792c2073616d652d64617920636f6f6b65642072696365206d69676874206e656564206120626974206c6573732073746f636b2e, 0x7574662d38),
(12, 0x687474703a2f2f7777772e656174696e676368696e612e636f6d2f696d616765732d726563697065732f6672696564726963652e6a7067, 0x7574662d38),
(13, 0x5b5b496d6167653a687474703a2f2f7777772e656174696e676368696e612e636f6d2f696d616765732d726563697065732f6672696564726963652e6a70675d5d0a0a556e6c696b65207768697465207269636520776869636820697320616c776179732073657276656420696e20696e646976696475616c20626f776c732c2066726965642072696365207769746820697473206d616e7920696e6772656469656e74732c20697320636f6e7369646572656420616c6d6f7374206120636f6d706c657465206d65616c20616e6420697320736572766564206f6e206120636f6d6d756e616c20706c6174652e204d6f73742054616977616e6573652074686f7567682c2070726566657220746f206561742069742077697468206120736f757020616e64206174206c65617374206f6e6520766567657461626c6520646973682e0a0a5365727665733a20340a0a496e6772656469656e74730a35206375707320636f6f6b6564203c6120687265663d22687474703a2f2f7777772e656174696e676368696e612e636f6d2f726563697065732f726963652e68746d223e776869746520726963653c2f613e0a3220656767732c2062656174656e0a34207374616c6b7320737072696e67206f6e696f6e20287363616c6c696f6e73292c2063757420696e746f203120636d2028332f382229206c656e677468730a50696e63682073616c740a50696e6368207065707065720a31207461626c6573706f6f6e206f696c0a3420636c6f766573206761726c69632c206c696768746c7920637275736865640a3135302067202835206f7a29206c65616e20706f726b2c206a756c69656e6e65640a32206375707320636162626167652c2063686f7070656420696e746f20736d616c6c207069656365730a312f322063757020636172726f742c2066696e656c7920736c696365640a312f332063757020636869636b656e2073746f636b0a34207461626c6573706f6f6e7320736f792073617563650a0a4d6574686f640a0a4e6f7465733c6f6c3e0a20203c6c693e427265616b20746865207269636520696e746f20696e646976696475616c20677261696e73207769746820796f75722068616e647320616e640a7075742061736964652e3c2f6c693e0a20203c6c693e4265617420656767732e2041646420312f34206f662074686520737072696e67206f6e696f6e732c207468652073616c7420616e640a7065707065722e204d69782077656c6c2e2048656174206120667279696e672070616e20746f2061206d656469756d206865617420616e6420736d65617220776974680a6f696c2e204d616b6520616e206f6d656c657474652e20536c69636520696e746f20736d616c6c2070696563657320616e64207365742061736964652e3c2f6c693e0a20203c6c693e48656174207468652072657374206f6620746865206f696c20696e20776f6b20617420612076657279206c6f7720686561742e204164640a6761726c696320616e642066727920666f722061206d696e75746520756e74696c206f696c2069732066756c6c79206761726c69632d666c61766f75726564202d20646f0a6e6f742062726f776e20746865206761726c69632e2052656d6f7665206761726c696320627574206c65617665206173206d756368206f696c20696e2074686520776f6b2061730a706f737369626c652e3c2f6c693e0a20203c6c693e4272696e6720776f6b20746f2066756c6c20686561742e2041646420706f726b2c207374697272696e672072617069646c7920666f722033300a7365636f6e64732e204f6e65206279206f6e65206164642074686520636162626167652c20636172726f74732c20616e6420737072696e67206f6e696f6e73207768696c650a7374697272696e672e20416464207468652073746f636b20616e642074686520736f792073617563652e2052657475726e20746865206761726c696320746f207468650a776f6b2e20436f6f6b20766567657461626c657320666f72206e6f206d6f7265207468616e206120666577206d696e757465732e3c2f6c693e0a20203c6c693e416464207269636520616e6420737469722065766572797468696e6720746f67657468657220666f72206120666577206d696e757465730a756e74696c207269636520697320686f742e2049662074686520726963652073746172747320746f20737469636b20746f2074686520776f6b2c2072656475636520686561742e0a41646420746865206f6d656c6574746520616e6420636f6f6b20666f722061206d696e757465206d6f7265206265666f72652073657276696e67206f6e206120706c6174652e3c2f6c693e0a3c2f6f6c3e0a0a54686520747269636b2077697468206672696564207269636520697320656e64696e672075702077697468206120646973682074686174206973206e65697468657220746f20647279206f7220746f6f20736f6767792e20596f752073686f756c64206e6f74207573652066726573686c7920636f6f6b6564207269636520617320697420697320746f6f20676f6f657920746f206d616b6520676f6f6420667269656420726963652e20557365206c6566746f76657220726963652c206f722061742061206d696e696d756d2c206c6574206a7573742d636f6f6b6564207269636520636f6f6c20696e2074686520706f7420666f7220616e20686f757220776974686f757420746865206c69642e20596f752063616e207374697220697420746f2073706565642075702074686520636f6f6c696e672f647279696e672070726f636573732e205468656e20737469636b20697420696e207468652066726964676520666f72206120636f75706c65206f6620686f7572732c20616761696e20776974686f757420746865206c69642e20496620796f7572206c6566746f766572207269636520686173206265656e20696e207468652066726964676520666f7220612066657720646179732c2069742077696c6c206265207072657474792064727920616e6420796f75206d696768742077616e7420746f206164642061206c6974746c65206d6f726520776174657220746f207468652073746f636b2e20436f6e76657273656c792c2073616d652d64617920636f6f6b65642072696365206d69676874206e656564206120626974206c6573732073746f636b2e, 0x7574662d38),
(14, 0x7361, 0x7574662d38),
(15, 0x5b5b4d656469613a687474703a2f2f7777772e656174696e676368696e612e636f6d2f696d616765732d726563697065732f6672696564726963652e6a70675d5d0a0a556e6c696b65207768697465207269636520776869636820697320616c776179732073657276656420696e20696e646976696475616c20626f776c732c2066726965642072696365207769746820697473206d616e7920696e6772656469656e74732c20697320636f6e7369646572656420616c6d6f7374206120636f6d706c657465206d65616c20616e6420697320736572766564206f6e206120636f6d6d756e616c20706c6174652e204d6f73742054616977616e6573652074686f7567682c2070726566657220746f206561742069742077697468206120736f757020616e64206174206c65617374206f6e6520766567657461626c6520646973682e0a0a5365727665733a20340a0a496e6772656469656e74730a35206375707320636f6f6b6564203c6120687265663d22687474703a2f2f7777772e656174696e676368696e612e636f6d2f726563697065732f726963652e68746d223e776869746520726963653c2f613e0a3220656767732c2062656174656e0a34207374616c6b7320737072696e67206f6e696f6e20287363616c6c696f6e73292c2063757420696e746f203120636d2028332f382229206c656e677468730a50696e63682073616c740a50696e6368207065707065720a31207461626c6573706f6f6e206f696c0a3420636c6f766573206761726c69632c206c696768746c7920637275736865640a3135302067202835206f7a29206c65616e20706f726b2c206a756c69656e6e65640a32206375707320636162626167652c2063686f7070656420696e746f20736d616c6c207069656365730a312f322063757020636172726f742c2066696e656c7920736c696365640a312f332063757020636869636b656e2073746f636b0a34207461626c6573706f6f6e7320736f792073617563650a0a4d6574686f640a0a4e6f7465733c6f6c3e0a20203c6c693e427265616b20746865207269636520696e746f20696e646976696475616c20677261696e73207769746820796f75722068616e647320616e640a7075742061736964652e3c2f6c693e0a20203c6c693e4265617420656767732e2041646420312f34206f662074686520737072696e67206f6e696f6e732c207468652073616c7420616e640a7065707065722e204d69782077656c6c2e2048656174206120667279696e672070616e20746f2061206d656469756d206865617420616e6420736d65617220776974680a6f696c2e204d616b6520616e206f6d656c657474652e20536c69636520696e746f20736d616c6c2070696563657320616e64207365742061736964652e3c2f6c693e0a20203c6c693e48656174207468652072657374206f6620746865206f696c20696e20776f6b20617420612076657279206c6f7720686561742e204164640a6761726c696320616e642066727920666f722061206d696e75746520756e74696c206f696c2069732066756c6c79206761726c69632d666c61766f75726564202d20646f0a6e6f742062726f776e20746865206761726c69632e2052656d6f7665206761726c696320627574206c65617665206173206d756368206f696c20696e2074686520776f6b2061730a706f737369626c652e3c2f6c693e0a20203c6c693e4272696e6720776f6b20746f2066756c6c20686561742e2041646420706f726b2c207374697272696e672072617069646c7920666f722033300a7365636f6e64732e204f6e65206279206f6e65206164642074686520636162626167652c20636172726f74732c20616e6420737072696e67206f6e696f6e73207768696c650a7374697272696e672e20416464207468652073746f636b20616e642074686520736f792073617563652e2052657475726e20746865206761726c696320746f207468650a776f6b2e20436f6f6b20766567657461626c657320666f72206e6f206d6f7265207468616e206120666577206d696e757465732e3c2f6c693e0a20203c6c693e416464207269636520616e6420737469722065766572797468696e6720746f67657468657220666f72206120666577206d696e757465730a756e74696c207269636520697320686f742e2049662074686520726963652073746172747320746f20737469636b20746f2074686520776f6b2c2072656475636520686561742e0a41646420746865206f6d656c6574746520616e6420636f6f6b20666f722061206d696e757465206d6f7265206265666f72652073657276696e67206f6e206120706c6174652e3c2f6c693e0a3c2f6f6c3e0a0a54686520747269636b2077697468206672696564207269636520697320656e64696e672075702077697468206120646973682074686174206973206e65697468657220746f20647279206f7220746f6f20736f6767792e20596f752073686f756c64206e6f74207573652066726573686c7920636f6f6b6564207269636520617320697420697320746f6f20676f6f657920746f206d616b6520676f6f6420667269656420726963652e20557365206c6566746f76657220726963652c206f722061742061206d696e696d756d2c206c6574206a7573742d636f6f6b6564207269636520636f6f6c20696e2074686520706f7420666f7220616e20686f757220776974686f757420746865206c69642e20596f752063616e207374697220697420746f2073706565642075702074686520636f6f6c696e672f647279696e672070726f636573732e205468656e20737469636b20697420696e207468652066726964676520666f72206120636f75706c65206f6620686f7572732c20616761696e20776974686f757420746865206c69642e20496620796f7572206c6566746f766572207269636520686173206265656e20696e207468652066726964676520666f7220612066657720646179732c2069742077696c6c206265207072657474792064727920616e6420796f75206d696768742077616e7420746f206164642061206c6974746c65206d6f726520776174657220746f207468652073746f636b2e20436f6e76657273656c792c2073616d652d64617920636f6f6b65642072696365206d69676874206e656564206120626974206c6573732073746f636b2e, 0x7574662d38),
(16, 0x3c756c3e0a3c6c693e5b5b44616e204368616f2046616e5d5d3c2f6c693e0a3c6c693e5b5b446120446f7520547520446f755d5d3c2f6c693e0a3c6c693e5b5b47756d62616f204a692044696e675d5d0a3c2f756c3e, 0x7574662d38),
(17, 0x3c756c3e0a3c6c693e5b5b44616e204368616f2046616e5d5d3c2f6c693e0a3c6c693e5b5b446120446f7520547520446f755d5d3c2f6c693e0a3c6c693e5b5b47756d62616f204a692044696e675d5d3c2f6c693e0a3c5b5b546573745d5d3c2f6c693e0a3c2f756c3e, 0x7574662d38),
(18, 0x3c756c3e0a3c6c693e5b5b44616e204368616f2046616e5d5d3c2f6c693e0a3c6c693e5b5b446120446f7520547520446f755d5d3c2f6c693e0a3c6c693e5b5b47756d62616f204a692044696e675d5d3c2f6c693e0a3c6c693e5b5b546573745d5d3c2f6c693e0a3c2f756c3e, 0x7574662d38),
(19, 0x3c756c3e0a3c6c693e5b5b44616e204368616f2046616e5d5d3c2f6c693e0a3c6c693e5b5b446120446f7520547520446f755d5d3c2f6c693e0a3c6c693e5b5b47756d62616f204a692044696e675d5d3c2f6c693e0a3c2f756c3e, 0x7574662d38),
(20, 0x43616970656469612068617320666f7220676f616c20746f206265636f6d6520544845206269676765737420636f6f6b696e6720626f6f6b206f6e2074686520496e7465726e65742e200a0a576520636f756e74206f6e20796f752c207468652075736572732c20746f2066696c6c2074686973207669727475616c20626f6f6b20627920616464696e6720796f7572206f776e207265636970657321200a0a4665656c206672656520746f20696e636c75646520696d6167657320616e64206f74686572206d756c74696d6564696120636f6e74656e74207375636820617320796f757475626520766964656f732c20746f2062657474657220656e68616e636520796f757220726563697065732e0a0a456e6a6f7921, 0x7574662d38),
(21, 0x0a27272743686f6f73652062792050726f76696e63652f5374796c653a2727270a3c756c3e0a3c6c693e5b5b5369636875616e6573655d5d3c2f6c693e0a3c6c693e5b5b48756e616e6573655d5d3c2f6c693e0a3c6c693e5b5b43616e746f6e6573655d5d3c2f6c693e0a3c6c693e5b5b5368616e676861696e6573655d5d3c2f6c693e0a3c6c693e5b5b48616e6742616e675d5d3c2f6c693e0a3c6c693e5b5b446f6e674265695d5d3c2f6c693e0a3c6c693e5b5b58696e6a69616e675d5d3c2f6c693e0a3c6c693e5b5b59756e6e616e5d5d3c2f6c693e0a3c2f756c3e0a0a0a3c756c3e0a3c6c693e5b5b44616e204368616f2046616e5d5d3c2f6c693e0a3c6c693e5b5b446120446f7520547520446f755d5d3c2f6c693e0a3c6c693e5b5b47756d62616f204a692044696e675d5d3c2f6c693e0a3c2f756c3e, 0x7574662d38),
(22, 0x27272743686f6f73652062792050726f76696e63652f5374796c653a2727270a3c756c3e0a3c6c693e5b5b47656e6572616c2f436f6d6d6f6e5d5d3c2f6c693e0a3c6c693e5b5b5369636875616e6573655d5d3c2f6c693e0a3c6c693e5b5b48756e616e6573655d5d3c2f6c693e0a3c6c693e5b5b43616e746f6e6573655d5d3c2f6c693e0a3c6c693e5b5b5368616e676861696e6573655d5d3c2f6c693e0a3c6c693e5b5b48616e6742616e675d5d3c2f6c693e0a3c6c693e5b5b446f6e674265695d5d3c2f6c693e0a3c6c693e5b5b58696e6a69616e675d5d3c2f6c693e0a3c6c693e5b5b59756e6e616e5d5d3c2f6c693e0a3c2f756c3e0a0a0a3c756c3e0a3c6c693e5b5b44616e204368616f2046616e5d5d3c2f6c693e0a3c6c693e5b5b446120446f7520547520446f755d5d3c2f6c693e0a3c6c693e5b5b47756d62616f204a692044696e675d5d3c2f6c693e0a3c2f756c3e, 0x7574662d38),
(23, 0x5b5b44616e204368616f2046616e5d5d, 0x7574662d38),
(24, 0x27272743686f6f73652062792050726f76696e63652f5374796c653a2727270a3c756c3e0a3c6c693e5b5b47656e6572616c2f436f6d6d6f6e5d5d3c2f6c693e0a3c6c693e5b5b5369636875616e6573655d5d3c2f6c693e0a3c6c693e5b5b48756e616e6573655d5d3c2f6c693e0a3c6c693e5b5b43616e746f6e6573655d5d3c2f6c693e0a3c6c693e5b5b5368616e676861696e6573655d5d3c2f6c693e0a3c6c693e5b5b48616e6742616e675d5d3c2f6c693e0a3c6c693e5b5b446f6e674265695d5d3c2f6c693e0a3c6c693e5b5b58696e6a69616e675d5d3c2f6c693e0a3c6c693e5b5b59756e6e616e5d5d3c2f6c693e0a3c2f756c3e, 0x7574662d38),
(25, 0x3c756c3e0a3c6c693e5b5b44616e204368616f2046616e5d5d3c2f6c693e0a3c6c693e5b5b446120446f7520547520446f755d5d3c2f6c693e0a3c6c693e5b5b47756d62616f204a692044696e675d5d3c2f6c693e0a3c2f756c3e, 0x7574662d38),
(26, 0x5b5b496d6167653a687474703a2f2f7777772e656174696e676368696e612e636f6d2f696d616765732d726563697065732f6672696564726963652e6a70675d5d0a0a556e6c696b65207768697465207269636520776869636820697320616c776179732073657276656420696e20696e646976696475616c20626f776c732c2066726965642072696365207769746820697473206d616e7920696e6772656469656e74732c20697320636f6e7369646572656420616c6d6f7374206120636f6d706c657465206d65616c20616e6420697320736572766564206f6e206120636f6d6d756e616c20706c6174652e204d6f73742054616977616e6573652074686f7567682c2070726566657220746f206561742069742077697468206120736f757020616e64206174206c65617374206f6e6520766567657461626c6520646973682e0a0a5365727665733a20340a0a496e6772656469656e74730a35206375707320636f6f6b6564203c6120687265663d22687474703a2f2f7777772e656174696e676368696e612e636f6d2f726563697065732f726963652e68746d223e776869746520726963653c2f613e0a3220656767732c2062656174656e0a34207374616c6b7320737072696e67206f6e696f6e20287363616c6c696f6e73292c2063757420696e746f203120636d2028332f382229206c656e677468730a50696e63682073616c740a50696e6368207065707065720a31207461626c6573706f6f6e206f696c0a3420636c6f766573206761726c69632c206c696768746c7920637275736865640a3135302067202835206f7a29206c65616e20706f726b2c206a756c69656e6e65640a32206375707320636162626167652c2063686f7070656420696e746f20736d616c6c207069656365730a312f322063757020636172726f742c2066696e656c7920736c696365640a312f332063757020636869636b656e2073746f636b0a34207461626c6573706f6f6e7320736f792073617563650a0a4d6574686f640a0a4e6f7465733c6f6c3e0a20203c6c693e427265616b20746865207269636520696e746f20696e646976696475616c20677261696e73207769746820796f75722068616e647320616e640a7075742061736964652e3c2f6c693e0a20203c6c693e4265617420656767732e2041646420312f34206f662074686520737072696e67206f6e696f6e732c207468652073616c7420616e640a7065707065722e204d69782077656c6c2e2048656174206120667279696e672070616e20746f2061206d656469756d206865617420616e6420736d65617220776974680a6f696c2e204d616b6520616e206f6d656c657474652e20536c69636520696e746f20736d616c6c2070696563657320616e64207365742061736964652e3c2f6c693e0a20203c6c693e48656174207468652072657374206f6620746865206f696c20696e20776f6b20617420612076657279206c6f7720686561742e204164640a6761726c696320616e642066727920666f722061206d696e75746520756e74696c206f696c2069732066756c6c79206761726c69632d666c61766f75726564202d20646f0a6e6f742062726f776e20746865206761726c69632e2052656d6f7665206761726c696320627574206c65617665206173206d756368206f696c20696e2074686520776f6b2061730a706f737369626c652e3c2f6c693e0a20203c6c693e4272696e6720776f6b20746f2066756c6c20686561742e2041646420706f726b2c207374697272696e672072617069646c7920666f722033300a7365636f6e64732e204f6e65206279206f6e65206164642074686520636162626167652c20636172726f74732c20616e6420737072696e67206f6e696f6e73207768696c650a7374697272696e672e20416464207468652073746f636b20616e642074686520736f792073617563652e2052657475726e20746865206761726c696320746f207468650a776f6b2e20436f6f6b20766567657461626c657320666f72206e6f206d6f7265207468616e206120666577206d696e757465732e3c2f6c693e0a20203c6c693e416464207269636520616e6420737469722065766572797468696e6720746f67657468657220666f72206120666577206d696e757465730a756e74696c207269636520697320686f742e2049662074686520726963652073746172747320746f20737469636b20746f2074686520776f6b2c2072656475636520686561742e0a41646420746865206f6d656c6574746520616e6420636f6f6b20666f722061206d696e757465206d6f7265206265666f72652073657276696e67206f6e206120706c6174652e3c2f6c693e0a3c2f6f6c3e0a0a54686520747269636b2077697468206672696564207269636520697320656e64696e672075702077697468206120646973682074686174206973206e65697468657220746f20647279206f7220746f6f20736f6767792e20596f752073686f756c64206e6f74207573652066726573686c7920636f6f6b6564207269636520617320697420697320746f6f20676f6f657920746f206d616b6520676f6f6420667269656420726963652e20557365206c6566746f76657220726963652c206f722061742061206d696e696d756d2c206c6574206a7573742d636f6f6b6564207269636520636f6f6c20696e2074686520706f7420666f7220616e20686f757220776974686f757420746865206c69642e20596f752063616e207374697220697420746f2073706565642075702074686520636f6f6c696e672f647279696e672070726f636573732e205468656e20737469636b20697420696e207468652066726964676520666f72206120636f75706c65206f6620686f7572732c20616761696e20776974686f757420746865206c69642e20496620796f7572206c6566746f766572207269636520686173206265656e20696e207468652066726964676520666f7220612066657720646179732c2069742077696c6c206265207072657474792064727920616e6420796f75206d696768742077616e7420746f206164642061206c6974746c65206d6f726520776174657220746f207468652073746f636b2e20436f6e76657273656c792c2073616d652d64617920636f6f6b65642072696365206d69676874206e656564206120626974206c6573732073746f636b2e, 0x7574662d38),
(27, 0x5b5b496d6167653a6672696564726963652e6a70675d5d0a0a556e6c696b65207768697465207269636520776869636820697320616c776179732073657276656420696e20696e646976696475616c20626f776c732c2066726965642072696365207769746820697473206d616e7920696e6772656469656e74732c20697320636f6e7369646572656420616c6d6f7374206120636f6d706c657465206d65616c20616e6420697320736572766564206f6e206120636f6d6d756e616c20706c6174652e204d6f73742054616977616e6573652074686f7567682c2070726566657220746f206561742069742077697468206120736f757020616e64206174206c65617374206f6e6520766567657461626c6520646973682e0a0a5365727665733a20340a0a496e6772656469656e74730a35206375707320636f6f6b6564203c6120687265663d22687474703a2f2f7777772e656174696e676368696e612e636f6d2f726563697065732f726963652e68746d223e776869746520726963653c2f613e0a3220656767732c2062656174656e0a34207374616c6b7320737072696e67206f6e696f6e20287363616c6c696f6e73292c2063757420696e746f203120636d2028332f382229206c656e677468730a50696e63682073616c740a50696e6368207065707065720a31207461626c6573706f6f6e206f696c0a3420636c6f766573206761726c69632c206c696768746c7920637275736865640a3135302067202835206f7a29206c65616e20706f726b2c206a756c69656e6e65640a32206375707320636162626167652c2063686f7070656420696e746f20736d616c6c207069656365730a312f322063757020636172726f742c2066696e656c7920736c696365640a312f332063757020636869636b656e2073746f636b0a34207461626c6573706f6f6e7320736f792073617563650a0a4d6574686f640a0a4e6f7465733c6f6c3e0a20203c6c693e427265616b20746865207269636520696e746f20696e646976696475616c20677261696e73207769746820796f75722068616e647320616e640a7075742061736964652e3c2f6c693e0a20203c6c693e4265617420656767732e2041646420312f34206f662074686520737072696e67206f6e696f6e732c207468652073616c7420616e640a7065707065722e204d69782077656c6c2e2048656174206120667279696e672070616e20746f2061206d656469756d206865617420616e6420736d65617220776974680a6f696c2e204d616b6520616e206f6d656c657474652e20536c69636520696e746f20736d616c6c2070696563657320616e64207365742061736964652e3c2f6c693e0a20203c6c693e48656174207468652072657374206f6620746865206f696c20696e20776f6b20617420612076657279206c6f7720686561742e204164640a6761726c696320616e642066727920666f722061206d696e75746520756e74696c206f696c2069732066756c6c79206761726c69632d666c61766f75726564202d20646f0a6e6f742062726f776e20746865206761726c69632e2052656d6f7665206761726c696320627574206c65617665206173206d756368206f696c20696e2074686520776f6b2061730a706f737369626c652e3c2f6c693e0a20203c6c693e4272696e6720776f6b20746f2066756c6c20686561742e2041646420706f726b2c207374697272696e672072617069646c7920666f722033300a7365636f6e64732e204f6e65206279206f6e65206164642074686520636162626167652c20636172726f74732c20616e6420737072696e67206f6e696f6e73207768696c650a7374697272696e672e20416464207468652073746f636b20616e642074686520736f792073617563652e2052657475726e20746865206761726c696320746f207468650a776f6b2e20436f6f6b20766567657461626c657320666f72206e6f206d6f7265207468616e206120666577206d696e757465732e3c2f6c693e0a20203c6c693e416464207269636520616e6420737469722065766572797468696e6720746f67657468657220666f72206120666577206d696e757465730a756e74696c207269636520697320686f742e2049662074686520726963652073746172747320746f20737469636b20746f2074686520776f6b2c2072656475636520686561742e0a41646420746865206f6d656c6574746520616e6420636f6f6b20666f722061206d696e757465206d6f7265206265666f72652073657276696e67206f6e206120706c6174652e3c2f6c693e0a3c2f6f6c3e0a0a54686520747269636b2077697468206672696564207269636520697320656e64696e672075702077697468206120646973682074686174206973206e65697468657220746f20647279206f7220746f6f20736f6767792e20596f752073686f756c64206e6f74207573652066726573686c7920636f6f6b6564207269636520617320697420697320746f6f20676f6f657920746f206d616b6520676f6f6420667269656420726963652e20557365206c6566746f76657220726963652c206f722061742061206d696e696d756d2c206c6574206a7573742d636f6f6b6564207269636520636f6f6c20696e2074686520706f7420666f7220616e20686f757220776974686f757420746865206c69642e20596f752063616e207374697220697420746f2073706565642075702074686520636f6f6c696e672f647279696e672070726f636573732e205468656e20737469636b20697420696e207468652066726964676520666f72206120636f75706c65206f6620686f7572732c20616761696e20776974686f757420746865206c69642e20496620796f7572206c6566746f766572207269636520686173206265656e20696e207468652066726964676520666f7220612066657720646179732c2069742077696c6c206265207072657474792064727920616e6420796f75206d696768742077616e7420746f206164642061206c6974746c65206d6f726520776174657220746f207468652073746f636b2e20436f6e76657273656c792c2073616d652d64617920636f6f6b65642072696365206d69676874206e656564206120626974206c6573732073746f636b2e, 0x7574662d38),
(28, 0x27272757656c636f6d6520746f204361697065646961212727270a0a436c69636b206f6e20612063617465676f72792062656c6f77207468656e20636c69636b2022656469742220746f206164642061206e6577207265636970652e0a0a5b5b4368696e6573652063756973696e655d5d0a0a5b5b4672656e63682063756973696e655d5d0a0a5b5b4974616c69616e2063756973696e655d5d0a0a5b5b4765726d616e2063756973696e655d5d0a0a5b5b5370616e6973682063756973696e655d5d0a0a5b5b416d65726963616e2063756973696e655d5d0a0a5b5b4a6170616e6573652063756973696e655d5d0a0a5b5b4b6f7265616e2063756973696e655d5d0a0a5b5b546861692063756973696e655d5d0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(29, 0x27272757656c636f6d6520746f204361697065646961212727270a0a436c69636b206f6e20612063617465676f72792062656c6f77207468656e20636c69636b2022656469742220746f206164642061206e6577207265636970652e0a0a272727417369616e272727200a0a5b5b4a6170616e5d5d0a0a5b5b4b6f7265615d5d0a0a5b5b546861696c616e645d5d0a0a5b5b496e6469615d5d0a0a2727275765737465726e2727270a0a5b5b4368696e6573655d5d0a0a5b5b4672656e63685d5d0a0a5b5b4974616c69616e5d5d0a0a5b5b4765726d616e5d5d0a0a5b5b416d65726963616e5d5d0a0a0a2727274c6174696e612727270a0a5b5b537061696e5d5d0a0a5b5b4d657869636f5d5d0a0a5b5b47756174656d616c615d5d0a0a5b5b53616c7661646f725d5d0a0a5b5b4368696c655d5d0a0a5b5b4272617a696c5d5d0a0a5b5b417267656e74696e615d5d0a0a0a0a2727274d6964646c65204561737465726e2727270a0a5b5b4c6562616e6f6e5d5d0a0a0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(30, 0x27272757656c636f6d6520746f204361697065646961212727270a0a436c69636b206f6e20612063617465676f72792062656c6f77207468656e20636c69636b2022656469742220746f206164642061206e6577207265636970652e0a0a0a3c5441424c453e0a202020203c54523e0a2020202020202020203c54443e0a3c212d2d204c45465420434f4c554d4e202d2d3e0a272727417369616e272727200a0a5b5b4a6170616e5d5d0a0a5b5b4b6f7265615d5d0a0a5b5b546861696c616e645d5d0a0a5b5b496e6469615d5d0a0a2727275765737465726e2727270a0a5b5b4368696e6573655d5d0a0a5b5b4672656e63685d5d0a0a5b5b4974616c69616e5d5d0a0a5b5b4765726d616e5d5d0a0a5b5b416d65726963616e5d5d0a0a2020202020202020203c2f54443e0a0a2020202020202020203c54443e0a3c212d2d2d20524947485420434f4c554d4e202d2d2d3e0a0a2727274c6174696e612727270a0a5b5b537061696e5d5d0a0a5b5b4d657869636f5d5d0a0a5b5b47756174656d616c615d5d0a0a5b5b53616c7661646f725d5d0a0a5b5b4368696c655d5d0a0a5b5b4272617a696c5d5d0a0a5b5b417267656e74696e615d5d0a0a0a0a2727274d6964646c65204561737465726e2727270a0a5b5b4c6562616e6f6e5d5d0a0a0a2020202020202020203c2f54443e0a202020203c2f54523e0a3c2f5441424c453e0a0a0a0a0a0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(31, 0x27272757656c636f6d6520746f204361697065646961212727270a0a436c69636b206f6e20612063617465676f72792062656c6f77207468656e20636c69636b2022656469742220746f206164642061206e6577207265636970652e0a0a0a3c5441424c452077696474683d22373025222076616c69676e3d22746f70223e0a202020203c54522076616c69676e3d22746f70223e0a2020202020202020203c54443e0a3c212d2d204c45465420434f4c554d4e202d2d3e0a272727417369616e272727200a0a5b5b4a6170616e5d5d0a0a5b5b4b6f7265615d5d0a0a5b5b546861696c616e645d5d0a0a5b5b496e6469615d5d0a0a2727275765737465726e2727270a0a5b5b4368696e6573655d5d0a0a5b5b4672656e63685d5d0a0a5b5b4974616c69616e5d5d0a0a5b5b4765726d616e5d5d0a0a5b5b416d65726963616e5d5d0a0a2020202020202020203c2f54443e0a0a2020202020202020203c54443e0a3c212d2d2d20524947485420434f4c554d4e202d2d2d3e0a0a2727274c6174696e612727270a0a5b5b537061696e5d5d0a0a5b5b4d657869636f5d5d0a0a5b5b47756174656d616c615d5d0a0a5b5b53616c7661646f725d5d0a0a5b5b4368696c655d5d0a0a5b5b4272617a696c5d5d0a0a5b5b417267656e74696e615d5d0a0a0a0a2727274d6964646c65204561737465726e2727270a0a5b5b4c6562616e6f6e5d5d0a0a0a2020202020202020203c2f54443e0a202020203c2f54523e0a3c2f5441424c453e0a0a0a0a0a0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(32, 0x27272757656c636f6d6520746f204361697065646961212727270a0a436c69636b206f6e20612063617465676f72792062656c6f77207468656e20636c69636b2022656469742220746f206164642061206e6577207265636970652e20506c6561736520636f6e7461637420757320696620796f752764207769736820746f2063726561746520616e6f746865722063617465676f72792e0a0a3c5441424c452077696474683d22373025222076616c69676e3d22746f70223e0a202020203c54522076616c69676e3d22746f70223e0a2020202020202020203c54443e0a3c212d2d204c45465420434f4c554d4e202d2d3e0a272727417369616e272727200a0a5b5b4a6170616e5d5d0a0a5b5b4b6f7265615d5d0a0a5b5b546861696c616e645d5d0a0a5b5b496e6469615d5d0a0a2727275765737465726e2727270a0a5b5b4368696e6573655d5d0a0a5b5b4672656e63685d5d0a0a5b5b4974616c69616e5d5d0a0a5b5b4765726d616e5d5d0a0a5b5b416d65726963616e5d5d0a0a2020202020202020203c2f54443e0a0a2020202020202020203c54443e0a3c212d2d2d20524947485420434f4c554d4e202d2d2d3e0a0a2727274c6174696e612727270a0a5b5b537061696e5d5d0a0a5b5b4d657869636f5d5d0a0a5b5b47756174656d616c615d5d0a0a5b5b53616c7661646f725d5d0a0a5b5b4368696c655d5d0a0a5b5b4272617a696c5d5d0a0a5b5b417267656e74696e615d5d0a0a0a0a2727274d6964646c65204561737465726e2727270a0a5b5b4c6562616e6f6e5d5d0a0a0a2020202020202020203c2f54443e0a202020203c2f54523e0a3c2f5441424c453e0a0a0a0a0a0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(33, 0x235245444952454354205b5b4368696e6573655d5d, 0x7574662d38);
INSERT INTO `cp1_text` (`old_id`, `old_text`, `old_flags`) VALUES
(34, 0x27272757656c636f6d6520746f204361697065646961212727270a0a436c69636b206f6e20612063617465676f72792062656c6f77207468656e20636c69636b2022656469742220746f206164642061206e6577207265636970652e20506c6561736520636f6e7461637420757320696620796f752764207769736820746f2063726561746520616e6f746865722063617465676f72792e0a0a3c5441424c452077696474683d22383025222076616c69676e3d22746f70223e0a202020203c54522076616c69676e3d22746f70223e0a2020202020202020203c54443e0a3c212d2d204c45465420434f4c554d4e202d2d3e0a272727417369616e272727200a0a5b5b4a6170616e5d5d0a0a5b5b4b6f7265615d5d0a0a5b5b546861696c616e645d5d0a0a5b5b496e6469615d5d0a0a2727275765737465726e2727270a0a5b5b4368696e6573655d5d0a0a5b5b4672656e63685d5d0a0a5b5b4974616c69616e5d5d0a0a5b5b4765726d616e5d5d0a0a5b5b416d65726963616e5d5d0a0a2020202020202020203c2f54443e0a0a2020202020202020203c54443e0a3c212d2d2d20524947485420434f4c554d4e202d2d2d3e0a0a2727274c6174696e612727270a0a5b5b537061696e5d5d0a0a5b5b4d657869636f5d5d0a0a5b5b47756174656d616c615d5d0a0a5b5b53616c7661646f725d5d0a0a5b5b4368696c655d5d0a0a5b5b4272617a696c5d5d0a0a5b5b417267656e74696e615d5d0a0a0a0a2727274d6964646c65204561737465726e2727270a0a5b5b4c6562616e6f6e5d5d0a0a0a2020202020202020203c2f54443e0a202020203c2f54523e0a3c2f5441424c453e0a0a0a0a0a0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(35, 0x27272757656c636f6d6520746f204361697065646961212727270a0a436c69636b206f6e20612063617465676f72792062656c6f77207468656e20636c69636b2022656469742220746f206164642061206e6577207265636970652e20506c6561736520636f6e7461637420757320696620796f752764207769736820746f2063726561746520616e6f746865722063617465676f72792e0a0a3c5441424c452077696474683d22393025222076616c69676e3d22746f70223e0a202020203c54522076616c69676e3d22746f70223e0a2020202020202020203c54443e0a3c212d2d204c45465420434f4c554d4e202d2d3e0a272727417369616e272727200a0a5b5b4a6170616e5d5d0a0a5b5b4b6f7265615d5d0a0a5b5b546861696c616e645d5d0a0a5b5b496e6469615d5d0a0a2727275765737465726e2727270a0a5b5b4368696e6573655d5d0a0a5b5b4672656e63685d5d0a0a5b5b4974616c69616e5d5d0a0a5b5b4765726d616e5d5d0a0a5b5b416d65726963616e5d5d0a0a2020202020202020203c2f54443e0a0a2020202020202020203c54443e0a3c212d2d2d20524947485420434f4c554d4e202d2d2d3e0a0a2727274c6174696e612727270a0a5b5b537061696e5d5d0a0a5b5b4d657869636f5d5d0a0a5b5b47756174656d616c615d5d0a0a5b5b53616c7661646f725d5d0a0a5b5b4368696c655d5d0a0a5b5b4272617a696c5d5d0a0a5b5b417267656e74696e615d5d0a0a0a0a2727274d6964646c65204561737465726e2727270a0a5b5b4c6562616e6f6e5d5d0a0a0a2020202020202020203c2f54443e0a202020203c2f54523e0a3c2f5441424c453e0a0a0a0a0a0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(36, 0x27272757656c636f6d6520746f204361697065646961212727270a0a436c69636b206f6e20612063617465676f72792062656c6f77207468656e20636c69636b2022656469742220746f206164642061206e6577207265636970652e20506c6561736520636f6e7461637420757320696620796f752764207769736820746f2063726561746520616e6f746865722063617465676f72792e0a0a3c5441424c452077696474683d2231303025222076616c69676e3d22746f70223e0a202020203c54522076616c69676e3d22746f70223e0a2020202020202020203c54443e0a3c212d2d204c45465420434f4c554d4e202d2d3e0a272727417369616e272727200a0a5b5b4a6170616e5d5d0a0a5b5b4b6f7265615d5d0a0a5b5b546861696c616e645d5d0a0a5b5b496e6469615d5d0a0a2727275765737465726e2727270a0a5b5b4368696e6573655d5d0a0a5b5b4672656e63685d5d0a0a5b5b4974616c69616e5d5d0a0a5b5b4765726d616e5d5d0a0a5b5b416d65726963616e5d5d0a0a2020202020202020203c2f54443e0a0a2020202020202020203c54443e0a3c212d2d2d20524947485420434f4c554d4e202d2d2d3e0a0a2727274c6174696e612727270a0a5b5b537061696e5d5d0a0a5b5b4d657869636f5d5d0a0a5b5b47756174656d616c615d5d0a0a5b5b53616c7661646f725d5d0a0a5b5b4368696c655d5d0a0a5b5b4272617a696c5d5d0a0a5b5b417267656e74696e615d5d0a0a0a0a2727274d6964646c65204561737465726e2727270a0a5b5b4c6562616e6f6e5d5d0a0a0a2020202020202020203c2f54443e0a202020203c2f54523e0a3c2f5441424c453e0a0a0a0a0a0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(37, 0x27272757656c636f6d6520746f204361697065646961212727270a0a436c69636b206f6e20612063617465676f72792062656c6f77207468656e20636c69636b2022656469742220746f206164642061206e6577207265636970652e20506c6561736520636f6e7461637420757320696620796f752764207769736820746f2063726561746520616e6f746865722063617465676f72792e0a0a3c5441424c452077696474683d2231303025222076616c69676e3d22746f70223e0a202020203c54522076616c69676e3d22746f70223e0a2020202020202020203c54443e0a3c212d2d204c45465420434f4c554d4e202d2d3e0a272727417369616e272727200a0a5b5b4a6170616e5d5d0a0a5b5b4b6f7265615d5d0a0a5b5b546861696c616e645d5d0a0a5b5b496e6469615d5d0a0a0a2727275765737465726e2727270a0a5b5b4368696e6573655d5d0a0a5b5b4672656e63685d5d0a0a5b5b4974616c69616e5d5d0a0a5b5b4765726d616e5d5d0a0a5b5b416d65726963616e5d5d0a0a2020202020202020203c2f54443e0a0a2020202020202020203c54443e0a3c212d2d2d20524947485420434f4c554d4e202d2d2d3e0a0a2727274c6174696e612727270a0a5b5b537061696e5d5d0a0a5b5b4d657869636f5d5d0a0a5b5b47756174656d616c615d5d0a0a5b5b53616c7661646f725d5d0a0a5b5b4368696c655d5d0a0a5b5b4272617a696c5d5d0a0a5b5b417267656e74696e615d5d0a0a0a0a2727274d6964646c65204561737465726e2727270a0a5b5b4c6562616e6f6e5d5d0a0a0a2020202020202020203c2f54443e0a202020203c2f54523e0a3c2f5441424c453e0a0a0a0a0a0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(38, 0x27272757656c636f6d6520746f204361697065646961212727270a0a436c69636b206f6e20612063617465676f72792062656c6f77207468656e20636c69636b2022656469742220746f206164642061206e6577207265636970652e20506c65617365205b5b636f6e746163742075735d5d20696620796f752764207769736820746f2063726561746520616e6f746865722063617465676f72792e0a0a3c5441424c452077696474683d2231303025222076616c69676e3d22746f70223e0a202020203c54522076616c69676e3d22746f70223e0a2020202020202020203c54443e0a3c212d2d204c45465420434f4c554d4e202d2d3e0a272727417369616e272727200a0a5b5b4a6170616e5d5d0a0a5b5b4b6f7265615d5d0a0a5b5b546861696c616e645d5d0a0a5b5b496e6469615d5d0a0a0a2727275765737465726e2727270a0a5b5b4368696e6573655d5d0a0a5b5b4672656e63685d5d0a0a5b5b4974616c69616e5d5d0a0a5b5b4765726d616e5d5d0a0a5b5b416d65726963616e5d5d0a0a2020202020202020203c2f54443e0a0a2020202020202020203c54443e0a3c212d2d2d20524947485420434f4c554d4e202d2d2d3e0a0a2727274c6174696e612727270a0a5b5b537061696e5d5d0a0a5b5b4d657869636f5d5d0a0a5b5b47756174656d616c615d5d0a0a5b5b53616c7661646f725d5d0a0a5b5b4368696c655d5d0a0a5b5b4272617a696c5d5d0a0a5b5b417267656e74696e615d5d0a0a0a0a2727274d6964646c65204561737465726e2727270a0a5b5b4c6562616e6f6e5d5d0a0a0a2020202020202020203c2f54443e0a202020203c2f54523e0a3c2f5441424c453e0a0a0a0a0a0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(39, 0x546f207265706f727420616e20696e636964656e742c2061646420616e206164646974696f6e616c2063617465676f7279206f7220636f727265637420616e7920696e666f726d6174696f6e2074686174206973206e6f74206564697461626c652c20706c6561736520636f6e7461637420746865207765626d61737465722061743a0a0a5b6d61696c746f3a746f6f677265656e40676d61696c2e636f6d5d, 0x7574662d38),
(40, 0x546f207265706f727420616e20696e636964656e742c2061646420616e206164646974696f6e616c2063617465676f7279206f7220636f727265637420616e7920696e666f726d6174696f6e2074686174206973206e6f74206564697461626c652c20706c6561736520636f6e7461637420746865207765626d61737465722061743a0a0a746f6f677265656e40676d61696c2e636f6d5b746f6f677265656e40676d61696c2e636f6d5d, 0x7574662d38),
(41, 0x546f207265706f727420616e20696e636964656e742c2061646420616e206164646974696f6e616c2063617465676f7279206f7220636f727265637420616e7920696e666f726d6174696f6e2074686174206973206e6f74206564697461626c652c20706c6561736520636f6e7461637420746865207765626d61737465722061743a0a0a746f6f677265656e40676d61696c2e636f6d5b6d61696c746f3a746f6f677265656e40676d61696c2e636f6d5d, 0x7574662d38),
(42, 0x3d3d2053756d6d617279203d3d0a0a496620796f75206f6e6c792072656164207468652057696b696d656469612070726f6a6563742077656273697465732c206e6f206d6f726520696e666f726d6174696f6e20697320636f6c6c6563746564207468616e206973207479706963616c6c7920636f6c6c656374656420696e20736572766572206c6f67732062792077656220736974657320696e2067656e6572616c2e0a0a496620796f7520636f6e7472696275746520746f207468652057696b696d656469612070726f6a656374732c20796f7520617265202727277075626c697368696e6727272720657665727920776f726420796f7520706f7374207075626c69636c792e20496620796f7520777269746520736f6d657468696e672c20617373756d6520746861742069742077696c6c2062652072657461696e656420666f72657665722e205468697320696e636c756465732061727469636c65732c207573657220706167657320616e642074616c6b2070616765732e20536f6d65206c696d6974656420657863657074696f6e7320617265206465736372696265642062656c6f772e0a0a3d3d5075626c697368696e67206f6e207468652077696b6920616e64207075626c69632064617461203d3d0a0a53696d706c79207669736974696e672074686520776562207369746520646f6573206e6f74206578706f736520796f7572206964656e74697479207075626c69636c79202862757420736565205b5b2350726976617465206c6f6767696e677c70726976617465206c6f6767696e675d5d2062656c6f77292e0a0a5768656e20796f75206564697420616e79207061676520696e207468652077696b692c20272727796f7520617265207075626c697368696e67206120646f63756d656e742727272e20546869732069732061207075626c6963206163742c20616e6420796f7520617265206964656e746966696564207075626c69636c792077697468207468617420656469742061732069747320617574686f722e0a0a3d3d3d204964656e74696669636174696f6e206f6620616e20617574686f72203d3d3d0a0a5768656e20796f75207075626c6973682061207061676520696e207468652077696b692c20796f75206d6179206265206c6f6767656420696e206f72206e6f742e0a0a496620796f7520617265206c6f6767656420696e2c20796f752077696c6c206265206964656e74696669656420627920796f75722075736572206e616d652e2054686973206d617920626520796f7572207265616c206e616d6520696620796f7520736f2063686f6f73652c206f7220796f75206d61792063686f6f736520746f207075626c69736820756e64657220612070736575646f6e796d2c2077686174657665722075736572206e616d6520796f752073656c6563746564207768656e20796f75206372656174656420796f7572206163636f756e742e0a0a496620796f752068617665206e6f74206c6f6767656420696e2c20796f752077696c6c206265206964656e74696669656420627920796f7572206e6574776f726b20495020616464726573732e2054686973206973206120736572696573206f6620666f7572206e756d62657273207768696368206964656e7469666965732074686520496e7465726e657420616464726573732066726f6d20776869636820796f752061726520636f6e74616374696e67207468652077696b692e20446570656e64696e67206f6e20796f757220636f6e6e656374696f6e2c2074686973206e756d626572206d617920626520747261636561626c65206f6e6c7920746f2061206c6172676520496e7465726e657420736572766963652070726f76696465722c206f72207370656369666963616c6c7920746f20796f7572207363686f6f6c2c20706c616365206f6620627573696e6573732c206f7220686f6d652e204974206d617920626520706f737369626c65207468617420746865206f726967696e206f662074686973204950206164647265737320636f756c64206265207573656420696e20636f6e6a756e6374696f6e207769746820616e7920696e7465726573747320796f75206578707265737320696d706c696369746c79206f72206578706c696369746c792062792065646974696e672061727469636c657320746f206964656e7469667920796f75206576656e206279207072697661746520696e646976696475616c732e200a0a4974206d61792062652065697468657220646966666963756c74206f72206561737920666f722061206d6f7469766174656420696e646976696475616c20746f20636f6e6e65637420796f7572206e6574776f726b2049502061646472657373207769746820796f7572207265616c2d6c696665206964656e746974792e205468657265666f726520696620796f7520617265207665727920636f6e6365726e65642061626f757420707269766163792c20796f75206d6179207769736820746f206c6f6720696e20616e64207075626c69736820756e64657220612070736575646f6e796d2e200a0a5768656e207573696e6720612070736575646f6e796d2c20796f757220495020616464726573732077696c6c206e6f7420626520617661696c61626c6520746f20746865207075626c69632065786365707420696e206361736573206f662061627573652c20696e636c7564696e672076616e64616c69736d206f6620612077696b69207061676520627920796f75206f7220627920616e6f7468657220757365722077697468207468652073616d6520495020616464726573732e20496e20616c6c2063617365732c20796f757220495020616464726573732077696c6c2062652073746f726564206f6e207468652077696b69207365727665727320616e642063616e206265207365656e2062792057696b696d656469612773207365727665722061646d696e6973747261746f727320616e642062792075736572732077686f2068617665206265656e206772616e74656420225b5b6d6574613a436865636b557365727c436865636b557365725d5d22206163636573732e20596f757220495020616464726573732c20616e642069747320636f6e6e656374696f6e20746f20616e7920757365726e616d65732074686174207368617265206974206d61792062652072656c656173656420756e646572206365727461696e2063697263756d7374616e63657320287365652062656c6f77292e0a0a496620796f7520757365206120636f6d70616e79206d61696c207365727665722066726f6d20686f6d65206f722074656c65636f6d6d75746520616e642075736520612044534c206f72206361626c6520496e7465726e657420636f6e6e656374696f6e2c206974206973206c696b656c7920746f2062652076657279206561737920666f7220796f757220656d706c6f79657220746f206964656e7469667920796f7572204950206164647265737320616e642066696e6420616c6c206f6620796f75722049502062617365642057696b696d656469612070726f6a65637420636f6e747269627574696f6e732e205573696e6720612075736572206e616d6520697320612062657474657220776179206f662070726573657276696e6720796f7572207072697661637920696e207468697320736974756174696f6e2e20486f77657665722c2072656d656d62657220746f206c6f67206f7574206f7220646973636f6e6e65637420796f757273656c6620616674657220656163682073657373696f6e207573696e6720612070736575646f6e796d206f6e20612073686172656420636f6d70757465722c20746f2061766f696420616c6c6f77696e67206f746865727320746f2075736520796f7572206964656e746974792e0a0a3d3d3d20436f6f6b696573203d3d3d0a0a5468652077696b692077696c6c2073657420612074656d706f726172792073657373696f6e20636f6f6b6965202850485053455353494429207768656e6576657220796f752076697369742074686520736974652e20496620796f7520646f206e6f7420696e74656e6420746f2065766572206c6f6720696e2c20796f75206d61792064656e79207468697320636f6f6b69652c2062757420796f752063616e6e6f74206c6f6720696e20776974686f75742069742e2049742077696c6c2062652064656c65746564207768656e20796f7520636c6f736520796f75722062726f777365722073657373696f6e2e0a0a4d6f726520636f6f6b696573206d617920626520736574207768656e20796f75206c6f6720696e2c20746f2061766f696420747970696e6720696e20796f75722075736572206e616d6520286f72206f7074696f6e616c6c792070617373776f726429206f6e20796f7572206e6578742076697369742e205468657365206c61737420757020746f20333020646179732e20596f75206d617920636c65617220746865736520636f6f6b6965732061667465722075736520696620796f7520617265207573696e672061207075626c6963206d616368696e6520616e6420646f6e2774207769736820746f206578706f736520796f757220757365726e616d6520746f20667574757265207573657273206f6620746865206d616368696e652e2028496620736f2c20636c656172207468652062726f777365722063616368652061732077656c6c2e290a0a3d3d3d2050617373776f726473203d3d3d0a0a4d616e792061737065637473206f66207468652057696b696d656469612070726f6a656374732720636f6d6d756e69747920696e746572616374696f6e7320646570656e64206f6e207468652072657075746174696f6e20616e6420726573706563742074686174206973206275696c74207570207468726f756768206120686973746f7279206f662076616c75656420636f6e747269627574696f6e732e20557365722070617373776f7264732061726520746865206f6e6c792067756172616e746565206f662074686520696e74656772697479206f66206120757365722773206564697420686973746f72792e20416c6c2075736572732061726520656e636f75726167656420746f2073656c656374207374726f6e672070617373776f72647320616e6420746f206e65766572207368617265207468656d2e204e6f206f6e65207368616c6c206b6e6f77696e676c79206578706f7365207468652070617373776f7264206f6620616e6f74686572207573657220746f207075626c69632072656c6561736520656974686572206469726563746c79206f7220696e6469726563746c792e0a0a3d3d2050726976617465206c6f6767696e67203d3d0a0a45766572792074696d6520796f7520766973697420612077656220706167652c20796f752073656e642061206c6f74206f6620696e666f726d6174696f6e20746f2074686520776562207365727665722e204d6f737420776562207365727665727320726f7574696e656c79206d61696e7461696e20616363657373206c6f67732077697468206120706f7274696f6e206f66207468697320696e666f726d6174696f6e2c2077686963682063616e206265207573656420746f2067657420616e206f766572616c6c2070696374757265206f6620776861742070616765732061726520706f70756c61722c2077686174206f74686572207369746573206c696e6b20746f2074686973206f6e652c20616e642077686174207765622062726f77736572732070656f706c6520617265207573696e672e204974206973206e6f742074686520696e74656e74696f6e206f66207468652057696b696d656469612070726f6a6563747320746f20757365207468697320696e666f726d6174696f6e20746f206b65657020747261636b206f66206c65676974696d6174652075736572732e0a0a5468657365206c6f677320617265207573656420746f2070726f6475636520746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f53746174697374696373207369746520737461746973746963732070616765735d3b2074686520726177206c6f672064617461206973206e6f74206d616465207075626c69632c20616e64206973206e6f726d616c6c79206469736361726465642061667465722061626f75742074776f207765656b732e0a0a48657265277320612073616d706c65206f6620776861742773206c6f6767656420666f72206f6e65207061676520766965773a0a0a2036342e3136342e38322e313432202d202d205b32312f4f63742f323030333a30323a30333a3139202b303030305d0a2022474554202f77696b692f64726166745f707269766163795f706f6c69637920485454502f312e3122203230302031383038340a2022687474703a2f2f656e2e77696b6970656469612e6f72672f77696b692f57696b696d656469615f70726f6a656374733a56696c6c6167655f70756d70220a20224d6f7a696c6c612f352e3020284d6163696e746f73683b20553b20505043204d6163204f5320583b20656e2d757329204170706c655765624b69742f38352e3720284b48544d4c2c206c696b65204765636b6f29205361666172692f38352e35220a0a4c6f672064617461206d6179206265206578616d696e656420627920646576656c6f7065727320696e2074686520636f75727365206f6620736f6c76696e6720746563686e6963616c2070726f626c656d7320616e6420696e20747261636b696e6720646f776e206261646c792d626568617665642077656220737069646572732074686174206f7665727768656c6d2074686520736974652e20495020616464726573736573206f662075736572732c2064657269766564206569746865722066726f6d2074686f7365206c6f6773206f722066726f6d207265636f72647320696e2074686520646174616261736520617265206672657175656e746c79207573656420746f20636f7272656c61746520757365726e616d657320616e64206e6574776f726b20616464726573736573206f6620656469747320696e20696e7665737469676174696e67206162757365206f66207468652077696b692c20696e636c7564696e67207468652073757370656374656420757365206f66206d616c6963696f75732022736f636b707570706574732220286475706c6963617465206163636f756e7473292c2076616e64616c69736d2c206861726173736d656e74206f66206f746865722075736572732c206f722064697372757074696f6e206f66207468652077696b692e0a0a3d3d3d20506f6c696379206f6e2072656c65617365206f66206461746120646572697665642066726f6d2070616765206c6f6773203d3d3d0a0a49742069732074686520706f6c696379206f662057696b696d65646961207468617420706572736f6e616c6c79206964656e7469666961626c65206461746120636f6c6c656374656420696e2074686520736572766572206c6f67732c206f72207468726f756768207265636f72647320696e20746865206461746162617365207669612074686520436865636b5573657220666561747572652c206d61792062652072656c6561736564206279207468652073797374656d2061646d696e6973747261746f7273206f72207573657273207769746820436865636b55736572206163636573732c20696e2074686520666f6c6c6f77696e6720736974756174696f6e733a0a0a2320496e20726573706f6e736520746f20612076616c696420737562706f656e61206f72206f7468657220636f6d70756c736f727920726571756573742066726f6d206c617720656e666f7263656d656e740a232057697468207065726d697373696f6e206f662074686520616666656374656420757365720a2320546f20746865206368616972206f662057696b696d6564696120466f756e646174696f6e2c206869732f686572206c6567616c20636f756e73656c2c206f72206869732f6865722064657369676e65652c207768656e206e656365737361727920666f7220696e7665737469676174696f6e206f6620616275736520636f6d706c61696e74732e0a232057686572652074686520696e666f726d6174696f6e207065727461696e7320746f20706167652076696577732067656e657261746564206279206120737069646572206f7220626f7420616e64206974732064697373656d696e6174696f6e206973206e656365737361727920746f20696c6c75737472617465206f72207265736f6c766520746563686e6963616c206973737565732e0a2320576865726520746865207573657220686173206265656e2076616e64616c6973696e672061727469636c6573206f722070657273697374656e746c79206265686176696e6720696e20612064697372757074697665207761792c2064617461206d61792062652072656c656173656420746f2061737369737420696e2074686520746172676574696e67206f6620495020626c6f636b732c206f7220746f2061737369737420696e2074686520666f726d756c6174696f6e206f66206120636f6d706c61696e7420746f2072656c6576616e7420496e7465726e657420536572766963652050726f7669646572730a2320576865726520697420697320726561736f6e61626c79206e656365737361727920746f2070726f7465637420746865207269676874732c2070726f7065727479206f7220736166657479206f66207468652057696b696d6564696120466f756e646174696f6e2c20697473207573657273206f7220746865207075626c69632e3c212d2d2074686973206c696e6520626f72726f7765642066726f6d20476f6f676c652d2d3e0a0a57696b696d6564696120706f6c69637920646f6573206e6f74207065726d6974207075626c696320646973747269627574696f6e206f66207375636820696e666f726d6174696f6e20756e64657220616e792063697263756d7374616e6365732c20657863657074206173206465736372696265642061626f76652e0a0a3d3d2053686172696e6720696e666f726d6174696f6e20776974682074686972642070617274696573203d3d0a0a457863657074207768657265206f7468657277697365207370656369666965642c20616c6c207465787420616464656420746f2057696b696d656469612070726f6a6563747320697320617661696c61626c6520666f7220726575736520756e64657220746865207465726d73206f6620746865204746444c2c2065786365707420666f722057696b696e6577732c20776865726520746865207465787420697320617661696c61626c6520756e646572206120437265617469766520436f6d6d6f6e73204c6963656e73652e0a0a57696b696d656469612077696c6c206e6f742073656c6c206f72207368617265207072697661746520696e666f726d6174696f6e2c207375636820617320656d61696c206164647265737365732c207769746820746869726420706172746965732c20756e6c65737320796f7520616772656520746f2072656c65617365207468697320696e666f726d6174696f6e2c206f72206974206973207265717569726564206279206c617720746f2072656c656173652074686520696e666f726d6174696f6e2e0a0a3d3d5365637572697479206f6620696e666f726d6174696f6e3d3d0a0a5468652057696b696d6564696120466f756e646174696f6e206d616b6573206e6f2067756172616e74656520616761696e737420756e617574686f72697a65642061636365737320746f20616e7920696e666f726d6174696f6e20796f752070726f766964652e205468697320696e666f726d6174696f6e206d617920626520617661696c61626c6520746f20616e796f6e6520776974682061636365737320746f2074686520736572766572732e2041207061727469616c206c697374206f662074686f73652070656f706c652063616e20626520666f756e6420696e20746865205b5b6d3a646576656c6f706572737c646576656c6f706572735d5d206c6973742e0a0a3d3d20452d6d61696c2c206d61696c696e67206c6973747320616e64204952433d3d0a0a3d3d3d20452d6d61696c203d3d3d0a0a596f75206d61792070726f7669646520796f757220652d6d61696c206164647265737320696e20796f757220507265666572656e63657320616e6420656e61626c65206f74686572206c6f676765642d696e20757365727320746f2073656e6420656d61696c20746f20796f75207468726f756768207468652077696b692e20596f757220616464726573732077696c6c206e6f742062652072657665616c656420746f207468656d20756e6c65737320796f7520726573706f6e642c206f7220706f737369626c792069662074686520656d61696c20626f756e6365732e2054686520656d61696c2061646472657373206d61792062652075736564206279207468652057696b696d6564696120466f756e646174696f6e20746f20636f6d6d756e69636174652077697468207573657273206f6e2061207769646572207363616c652e0a0a496620796f7520646f206e6f742070726f7669646520616e20656d61696c20616464726573732c20796f752077696c6c206e6f742062652061626c6520746f20726573657420796f75722070617373776f726420696620796f7520666f726765742069742e20486f77657665722c20796f75206d617920636f6e74616374206f6e65206f66207468652057696b696d65646961207365727665722061646d696e6973747261746f727320746f20656e7465722061206e6577206d61696c206164647265737320696e20796f757220707265666572656e6365732e0a0a596f752063616e2072656d6f766520796f757220656d61696c20616464726573732066726f6d20796f757220707265666572656e63657320617420616e792074696d6520746f2070726576656e74206974206265696e6720757365642e0a0a3d3d3d204d61696c696e67206c697374733d3d3d0a0a496620796f752073756273637269626520746f206f6e65206f66207468652070726f6a656374205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f206d61696c696e67206c697374735d2c20796f757220616464726573732077696c6c206265206578706f73656420746f20616e79206f7468657220737562736372696265722e20546865206c697374206172636869766573206f66206d6f7374206f662057696b696d656469612773206d61696c696e67206c6973747320617265207075626c69632c20616e6420796f75722061646472657373206d61792066696e6420697473656c662071756f74656420696e206d657373616765732e20546865206c6973742061726368697665732061726520616c736f20617263686976656420627920476d616e6520616e64206f746865722073657276696365732e204d61696c732061726520757375616c6c79206e6f742064656c65746564206f72206d6f6469666965642c20627574206974206d617920626520646f6e6520696e2065787472656d652063617365732e0a0a3d3d3d20496e666f726d6174696f6e20656d61696c20616464726573736573203d3d3d0a0a536f6d6520656d61696c2061646472657373657320287365652062656c6f7729206d617920666f7277617264206d61696c20746f2061207465616d206f6620766f6c756e746565727320747275737465642062792074686520466f756e646174696f6e20746f207573652061207469636b65742073797374656d2073756368206173204f54525320746f2076696577207468656d20616e6420616e73776572207468656d2e20204d61696c2073656e7420746f207468652073797374656d206973206e6f74207075626c69636c792076697369626c652c206275742069732076697369626c6520746f20746869732067726f7570206f662057696b696d6564696120766f6c756e74656572732e2042792073656e64696e672061206d61696c20746f206f6e65206f66207468657365206164647265737365732c20796f75722061646472657373206d6179206265636f6d65207075626c69632077697468696e20746869732067726f75702e2020546865207469636b65742073797374656d207465616d206d617920646973637573732074686520636f6e74656e7473206f6620796f7572206d61696c2077697468206f7468657220636f6e7472696275746f727320696e206f7264657220746f206265737420616e7377657220796f75722071756572792e0a0a41646472657373657320746861742064697265637420746f20746865207469636b65742073797374656d2073797374656d20696e636c7564653a0a2a696e666f2d64652041542077696b69706564696120444f54206f72670a2a696e666f2d656e2041542077696b69706564696120444f54206f72670a2a696e666f2d65732041542077696b69706564696120444f54206f72670a2a696e666f2d66722041542077696b69706564696120444f54206f72670a2a696e666f2d69742041542077696b69706564696120444f54206f72670a2a696e666f2d6e6c2041542077696b69706564696120444f54206f72670a2a696e666f2d706c2041542077696b69706564696120444f54206f72670a0a4d61696c20746f20626f617264206d656d6265727327207072697661746520616464726573736573206d617920616c736f20626520666f7277617264656420746f20746865204f545253207465616d2e0a0a3d3d3d20495243203d3d3d0a0a5b5b6d3a495243206368616e6e656c737c495243206368616e6e656c735d5d20617265206e6f74206f6666696369616c6c792070617274206f662057696b696d656469612070726f7065722e2042792070617274696369706174696e6720696e20616e20495243206368616e6e656c2c20796f75722049502061646472657373206d6179206265206578706f73656420746f206f74686572207061727469636970616e74732e20446966666572656e74206368616e6e656c73206861766520646966666572656e7420706f6c6963696573206f6e2077686574686572206c6f6773206d6179206265207075626c69736865642e200a0a3d3d20557365722064617461203d3d0a44617461206f6e2075736572732c2073756368206173207468652074696d657320617420776869636820746865792065646974656420616e6420746865206e756d626572206f6620656469747320746865792068617665206d61646520617265207075626c69636c7920617661696c61626c652076696120227573657220636f6e747269627574696f6e7322206c697374732c20616e6420696e206167677265676174656420666f726d73207075626c6973686564206279206f746865722075736572732e0a0a3d3d3d2052656d6f76616c206f662075736572206163636f756e7473203d3d3d0a0a4f6e636520637265617465642c2075736572206163636f756e74732077696c6c206e6f742062652072656d6f7665642e204974206d617920626520706f737369626c6520666f72206120757365726e616d6520746f206265206368616e6765642028646570656e64696e67206f6e2074686520706f6c6963696573206f6620796f7572206c6f63616c2077696b69292e205468652057696b696d6564696120466f756e646174696f6e20646f6573206e6f742067756172616e74656520746861742061206e616d652077696c6c206265206368616e676564206f6e20726571756573742e200a0a57686574686572207370656369666963207573657220696e666f726d6174696f6e2069732064656c6574656420697320646570656e64616e74206f6e207468652064656c6574696f6e20706f6c6963696573206f66207468652070726f6a656374207468617420636f6e7461696e732074686520696e666f726d6174696f6e2e0a0a3d3d2044656c6574696f6e206f6620636f6e74656e74203d3d0a0a52656d6f76696e6720746578742066726f6d2057696b696d656469612070726f6a6563747320646f6573206e6f74207065726d616e656e746c792064656c6574652069742e20496e206e6f726d616c2061727469636c65732c20616e796f6e652063616e206c6f6f6b20617420612070726576696f75732076657273696f6e20616e64207365652077686174207761732074686572652e20496620616e2061727469636c65206973202264656c65746564222c20616e7920757365722077697468202261646d696e6973747261746f722220616363657373206f6e207468652077696b692c206d65616e696e6720616c6d6f737420616e796f6e652074727573746564206e6f7420746f206162757365207468652064656c6574696f6e206361706162696c6974792c2063616e207365652077686174207761732064656c657465642e20496e666f726d6174696f6e2063616e206265207065726d616e656e746c792064656c657465642062792074686f73652070656f706c6520776974682061636365737320746f2074686520736572766572732c20627574207468657265206973206e6f2067756172616e74656520746869732077696c6c2068617070656e2065786365707420696e20726573706f6e736520746f206c6567616c20616374696f6e2e0a0a5b5b43617465676f72793a456e676c6973685d5d0a5b5b43617465676f72793a506f6c6963795d5d0a0a5f5f4e4f4544495453454354494f4e5f5f, 0x7574662d38),
(43, 0x5468697320697320616e20696e666f726d6174696f6e616c2077656273697465206f66207468652057696b696d6564696120466f756e646174696f6e2028686572656166746572202257696b696d6564696122292e202054686520636f6e74656e74206f6620746869732073697465206973206265696e672070726f766964656420667265656c792c20616e64206e6f206b696e64206f662061677265656d656e74206f7220636f6e74726163742069732063726561746564206265747765656e20796f7520616e6420746865206f776e657273206f72207573657273206f66207468697320736974652c20746865206f776e657273206f662074686520736572766572732075706f6e20776869636820697420697320686f757365642c20696e646976696475616c20636f6e7472696275746f727320746f2074686573652070616765732c206f722070726f6a6563742061646d696e6973747261746f72732c207379736f7073206f7220616e796f6e6520656c736520636f6e6e6563746564207769746820746869732070726f6a656374207375626a65637420746f20796f757220636c61696d7320616761696e7374207468656d206469726563746c792e20596f7520617265206772616e7465642061206c696d69746564206c6963656e736520746f20636f707920616e797468696e672066726f6d207468697320736974653b20697420646f6573206e6f7420637265617465206f7220696d706c7920616e7920636f6e747261637475616c206f72206578747261636f6e747261637475616c206c696162696c697479206f6e207468652070617274206f662057696b696d65646961206f7220616e79206f6620697473206167656e74732c206d656d626572732c206f7267616e697a657273206f72206f746865722075736572732e0a0a416e79206f66207468652074726164656d61726b732c2073657276696365206d61726b732c20636f6c6c656374697665206d61726b732c2064657369676e207269676874732c20706572736f6e616c69747920726967687473206f722073696d696c617220726967687473207468617420617265206d656e74696f6e65642c2075736564206f72206369746564206f6e2074686973207369746520617265207468652070726f7065727479206f662074686569722072657370656374697665206f776e6572732e2020556e6c657373206f7468657277697365207374617465642c2057696b696d6564696120736974657320617265206e65697468657220656e646f72736564206279206e6f7220616666696c6961746564207769746820616e79206f662074686520686f6c64657273206f662073756368207269676874732c206e6f722063616e2057696b696d65646961206772616e742072696768747320746f20757365206f74686572776973652070726f746563746564206d6174657269616c732e202727596f757220757365206f6620616e79207375636820696e636f72706f7265616c2070726f706572747920697320617420796f7572206f776e207269736b2e27270a0a506c65617365206e6f746520746861742074686520696e666f726d6174696f6e20666f756e642068657265206d617920626520696e2076696f6c6174696f6e206f6620746865206c617773206f662074686520636f756e747279206f72206a7572697364696374696f6e2066726f6d20776865726520796f75206172652076696577696e67207468697320696e666f726d6174696f6e2e20272757696b697065646961272720646f6573206e6f7420656e636f7572616765207468652076696f6c6174696f6e206f6620616e79206c6177732c20627574207468697320696e666f726d6174696f6e2069732073746f726564206f6e20612073657276657220696e20746865205b5b773a466c6f726964617c5374617465206f6620466c6f726964615d5d20696e20746865205b5b773a556e6974656420537461746573206f6620416d65726963617c556e6974656420537461746573206f6620416d65726963615d5d2c20616e64206973206d61696e7461696e656420696e207265666572656e636520746f207468652070726f74656374696f6e73206166666f7264656420746f20636f6e74656e742070726f76696465727320616e64207265616465727320696e2074686174206a7572697364696374696f6e2e2020546865206c61777320696e20796f757220636f756e747279206d6179206e6f74207265636f676e697a6520612073696d696c61726c792062726f61642070726f74656374696f6e206f662066726565207370656563683b20272757696b69706564696127272063616e6e6f7420626520726573706f6e7369626c6520666f7220706f74656e7469616c2076696f6c6174696f6e73206f662073756368206c6177732c2073686f756c6420796f75206c696e6b20746f207468697320646f6d61696e206f7220726575736520616e79206f662074686520696e666f726d6174696f6e20636f6e7461696e65642068657265696e2e0a0a466f72206675727468657220696e666f726d6174696f6e2c20706c65617365205b5b636f6e746163742075735d5d2e, 0x7574662d38),
(44, 0x54686520636f6e74656e74206f6620746869732073697465206973206265696e672070726f766964656420667265656c792c20616e64206e6f206b696e64206f662061677265656d656e74206f7220636f6e74726163742069732063726561746564206265747765656e20796f7520616e6420746865206f776e657273206f72207573657273206f66207468697320736974652c20746865206f776e657273206f662074686520736572766572732075706f6e20776869636820697420697320686f757365642c20696e646976696475616c20636f6e7472696275746f727320746f2074686573652070616765732c206f722070726f6a6563742061646d696e6973747261746f72732c207379736f7073206f7220616e796f6e6520656c736520636f6e6e6563746564207769746820746869732070726f6a656374207375626a65637420746f20796f757220636c61696d7320616761696e7374207468656d206469726563746c792e20596f7520617265206772616e7465642061206c696d69746564206c6963656e736520746f20636f707920616e797468696e672066726f6d207468697320736974653b20697420646f6573206e6f7420637265617465206f7220696d706c7920616e7920636f6e747261637475616c206f72206578747261636f6e747261637475616c206c696162696c697479206f6e207468652070617274206f66204361697065646961206f7220616e79206f6620697473206167656e74732c206d656d626572732c206f7267616e697a657273206f72206f746865722075736572732e0a0a416e79206f66207468652074726164656d61726b732c2073657276696365206d61726b732c20636f6c6c656374697665206d61726b732c2064657369676e207269676874732c20706572736f6e616c69747920726967687473206f722073696d696c617220726967687473207468617420617265206d656e74696f6e65642c2075736564206f72206369746564206f6e2074686973207369746520617265207468652070726f7065727479206f662074686569722072657370656374697665206f776e6572732e2020556e6c657373206f7468657277697365207374617465642c20436169706564696120736974657320617265206e65697468657220656e646f72736564206279206e6f7220616666696c6961746564207769746820616e79206f662074686520686f6c64657273206f662073756368207269676874732c206e6f722063616e204361697065646961206772616e742072696768747320746f20757365206f74686572776973652070726f746563746564206d6174657269616c732e202727596f757220757365206f6620616e79207375636820696e636f72706f7265616c2070726f706572747920697320617420796f7572206f776e207269736b2e27270a0a506c65617365206e6f746520746861742074686520696e666f726d6174696f6e20666f756e642068657265206d617920626520696e2076696f6c6174696f6e206f6620746865206c617773206f662074686520636f756e747279206f72206a7572697364696374696f6e2066726f6d20776865726520796f75206172652076696577696e67207468697320696e666f726d6174696f6e2e2027274361697065646961272720646f6573206e6f7420656e636f7572616765207468652076696f6c6174696f6e206f6620616e79206c6177732c20627574207468697320696e666f726d6174696f6e2069732073746f726564206f6e20612073657276657220696e20746865205b5b773a556e6974656420537461746573206f6620416d65726963617c556e6974656420537461746573206f6620416d65726963615d5d2c20616e64206973206d61696e7461696e656420696e207265666572656e636520746f207468652070726f74656374696f6e73206166666f7264656420746f20636f6e74656e742070726f76696465727320616e64207265616465727320696e2074686174206a7572697364696374696f6e2e2020546865206c61777320696e20796f757220636f756e747279206d6179206e6f74207265636f676e697a6520612073696d696c61726c792062726f61642070726f74656374696f6e206f662066726565207370656563683b202727436169706564696127272063616e6e6f7420626520726573706f6e7369626c6520666f7220706f74656e7469616c2076696f6c6174696f6e73206f662073756368206c6177732c2073686f756c6420796f75206c696e6b20746f207468697320646f6d61696e206f7220726575736520616e79206f662074686520696e666f726d6174696f6e20636f6e7461696e65642068657265696e2e0a0a466f72206675727468657220696e666f726d6174696f6e2c20706c65617365205b5b636f6e746163742075735d5d2e, 0x7574662d38),
(45, 0x54686520636f6e74656e74206f6620746869732073697465206973206265696e672070726f766964656420667265656c792c20616e64206e6f206b696e64206f662061677265656d656e74206f7220636f6e74726163742069732063726561746564206265747765656e20796f7520616e6420746865206f776e657273206f72207573657273206f66207468697320736974652c20746865206f776e657273206f662074686520736572766572732075706f6e20776869636820697420697320686f757365642c20696e646976696475616c20636f6e7472696275746f727320746f2074686573652070616765732c206f722070726f6a6563742061646d696e6973747261746f72732c207379736f7073206f7220616e796f6e6520656c736520636f6e6e6563746564207769746820746869732070726f6a656374207375626a65637420746f20796f757220636c61696d7320616761696e7374207468656d206469726563746c792e20596f7520617265206772616e7465642061206c696d69746564206c6963656e736520746f20636f707920616e797468696e672066726f6d207468697320736974653b20697420646f6573206e6f7420637265617465206f7220696d706c7920616e7920636f6e747261637475616c206f72206578747261636f6e747261637475616c206c696162696c697479206f6e207468652070617274206f66204361697065646961206f7220616e79206f6620697473206167656e74732c206d656d626572732c206f7267616e697a657273206f72206f746865722075736572732e0a0a416e79206f66207468652074726164656d61726b732c2073657276696365206d61726b732c20636f6c6c656374697665206d61726b732c2064657369676e207269676874732c20706572736f6e616c69747920726967687473206f722073696d696c617220726967687473207468617420617265206d656e74696f6e65642c2075736564206f72206369746564206f6e2074686973207369746520617265207468652070726f7065727479206f662074686569722072657370656374697665206f776e6572732e2020556e6c657373206f7468657277697365207374617465642c20436169706564696120736974657320617265206e65697468657220656e646f72736564206279206e6f7220616666696c6961746564207769746820616e79206f662074686520686f6c64657273206f662073756368207269676874732c206e6f722063616e204361697065646961206772616e742072696768747320746f20757365206f74686572776973652070726f746563746564206d6174657269616c732e202727596f757220757365206f6620616e79207375636820696e636f72706f7265616c2070726f706572747920697320617420796f7572206f776e207269736b2e27270a0a506c65617365206e6f746520746861742074686520696e666f726d6174696f6e20666f756e642068657265206d617920626520696e2076696f6c6174696f6e206f6620746865206c617773206f662074686520636f756e747279206f72206a7572697364696374696f6e2066726f6d20776865726520796f75206172652076696577696e67207468697320696e666f726d6174696f6e2e2027274361697065646961272720646f6573206e6f7420656e636f7572616765207468652076696f6c6174696f6e206f6620616e79206c6177732c20627574207468697320696e666f726d6174696f6e2069732073746f726564206f6e20612073657276657220696e2074686520556e6974656420537461746573206f6620416d65726963612c20616e64206973206d61696e7461696e656420696e207265666572656e636520746f207468652070726f74656374696f6e73206166666f7264656420746f20636f6e74656e742070726f76696465727320616e64207265616465727320696e2074686174206a7572697364696374696f6e2e2020546865206c61777320696e20796f757220636f756e747279206d6179206e6f74207265636f676e697a6520612073696d696c61726c792062726f61642070726f74656374696f6e206f662066726565207370656563683b202727436169706564696127272063616e6e6f7420626520726573706f6e7369626c6520666f7220706f74656e7469616c2076696f6c6174696f6e73206f662073756368206c6177732c2073686f756c6420796f75206c696e6b20746f207468697320646f6d61696e206f7220726575736520616e79206f662074686520696e666f726d6174696f6e20636f6e7461696e65642068657265696e2e0a0a466f72206675727468657220696e666f726d6174696f6e2c20706c65617365205b5b636f6e746163742075735d5d2e, 0x7574662d38);
INSERT INTO `cp1_text` (`old_id`, `old_text`, `old_flags`) VALUES
(46, 0x3d3d2053756d6d617279203d3d0a0a496620796f75206f6e6c792072656164207468652043616970656469612070726f6a65637420776562736974652c206e6f206d6f726520696e666f726d6174696f6e20697320636f6c6c6563746564207468616e206973207479706963616c6c7920636f6c6c656374656420696e20736572766572206c6f67732062792077656220736974657320696e2067656e6572616c2e0a0a496620796f7520636f6e7472696275746520746f207468652043616970656469612070726f6a6563742c20796f7520617265202727277075626c697368696e6727272720657665727920776f726420796f7520706f7374207075626c69636c792e20496620796f7520777269746520736f6d657468696e672c20617373756d6520746861742069742077696c6c2062652072657461696e656420666f72657665722e205468697320696e636c756465732061727469636c65732c207573657220706167657320616e642074616c6b2070616765732e20536f6d65206c696d6974656420657863657074696f6e7320617265206465736372696265642062656c6f772e0a0a3d3d5075626c697368696e67206f6e207468652077696b6920616e64207075626c69632064617461203d3d0a0a53696d706c79207669736974696e672074686520776562207369746520646f6573206e6f74206578706f736520796f7572206964656e74697479207075626c69636c79202862757420736565205b5b2350726976617465206c6f6767696e677c70726976617465206c6f6767696e675d5d2062656c6f77292e0a0a5768656e20796f75206564697420616e79207061676520696e207468652077696b692c20272727796f7520617265207075626c697368696e67206120646f63756d656e742727272e20546869732069732061207075626c6963206163742c20616e6420796f7520617265206964656e746966696564207075626c69636c792077697468207468617420656469742061732069747320617574686f722e0a0a3d3d3d204964656e74696669636174696f6e206f6620616e20617574686f72203d3d3d0a0a5768656e20796f75207075626c6973682061207061676520696e207468652077696b692c20796f75206d6179206265206c6f6767656420696e206f72206e6f742e0a0a496620796f7520617265206c6f6767656420696e2c20796f752077696c6c206265206964656e74696669656420627920796f75722075736572206e616d652e2054686973206d617920626520796f7572207265616c206e616d6520696620796f7520736f2063686f6f73652c206f7220796f75206d61792063686f6f736520746f207075626c69736820756e64657220612070736575646f6e796d2c2077686174657665722075736572206e616d6520796f752073656c6563746564207768656e20796f75206372656174656420796f7572206163636f756e742e0a0a496620796f752068617665206e6f74206c6f6767656420696e2c20796f752077696c6c206265206964656e74696669656420627920796f7572206e6574776f726b20495020616464726573732e2054686973206973206120736572696573206f6620666f7572206e756d62657273207768696368206964656e7469666965732074686520496e7465726e657420616464726573732066726f6d20776869636820796f752061726520636f6e74616374696e67207468652077696b692e20446570656e64696e67206f6e20796f757220636f6e6e656374696f6e2c2074686973206e756d626572206d617920626520747261636561626c65206f6e6c7920746f2061206c6172676520496e7465726e657420736572766963652070726f76696465722c206f72207370656369666963616c6c7920746f20796f7572207363686f6f6c2c20706c616365206f6620627573696e6573732c206f7220686f6d652e204974206d617920626520706f737369626c65207468617420746865206f726967696e206f662074686973204950206164647265737320636f756c64206265207573656420696e20636f6e6a756e6374696f6e207769746820616e7920696e7465726573747320796f75206578707265737320696d706c696369746c79206f72206578706c696369746c792062792065646974696e672061727469636c657320746f206964656e7469667920796f75206576656e206279207072697661746520696e646976696475616c732e200a0a4974206d61792062652065697468657220646966666963756c74206f72206561737920666f722061206d6f7469766174656420696e646976696475616c20746f20636f6e6e65637420796f7572206e6574776f726b2049502061646472657373207769746820796f7572207265616c2d6c696665206964656e746974792e205468657265666f726520696620796f7520617265207665727920636f6e6365726e65642061626f757420707269766163792c20796f75206d6179207769736820746f206c6f6720696e20616e64207075626c69736820756e64657220612070736575646f6e796d2e200a0a5768656e207573696e6720612070736575646f6e796d2c20796f757220495020616464726573732077696c6c206e6f7420626520617661696c61626c6520746f20746865207075626c69632065786365707420696e206361736573206f662061627573652c20696e636c7564696e672076616e64616c69736d206f6620612077696b69207061676520627920796f75206f7220627920616e6f7468657220757365722077697468207468652073616d6520495020616464726573732e20496e20616c6c2063617365732c20796f757220495020616464726573732077696c6c2062652073746f726564206f6e207468652077696b69207365727665727320616e642063616e206265207365656e2062792043616970656469612773207365727665722061646d696e6973747261746f727320616e642062792075736572732077686f2068617665206265656e206772616e74656420225b5b6d6574613a436865636b557365727c436865636b557365725d5d22206163636573732e20596f757220495020616464726573732c20616e642069747320636f6e6e656374696f6e20746f20616e7920757365726e616d65732074686174207368617265206974206d61792062652072656c656173656420756e646572206365727461696e2063697263756d7374616e63657320287365652062656c6f77292e0a0a496620796f7520757365206120636f6d70616e79206d61696c207365727665722066726f6d20686f6d65206f722074656c65636f6d6d75746520616e642075736520612044534c206f72206361626c6520496e7465726e657420636f6e6e656374696f6e2c206974206973206c696b656c7920746f2062652076657279206561737920666f7220796f757220656d706c6f79657220746f206964656e7469667920796f7572204950206164647265737320616e642066696e6420616c6c206f6620796f75722049502062617365642043616970656469612070726f6a65637420636f6e747269627574696f6e732e205573696e6720612075736572206e616d6520697320612062657474657220776179206f662070726573657276696e6720796f7572207072697661637920696e207468697320736974756174696f6e2e20486f77657665722c2072656d656d62657220746f206c6f67206f7574206f7220646973636f6e6e65637420796f757273656c6620616674657220656163682073657373696f6e207573696e6720612070736575646f6e796d206f6e20612073686172656420636f6d70757465722c20746f2061766f696420616c6c6f77696e67206f746865727320746f2075736520796f7572206964656e746974792e0a0a3d3d3d20436f6f6b696573203d3d3d0a0a5468652077696b692077696c6c2073657420612074656d706f726172792073657373696f6e20636f6f6b6965202850485053455353494429207768656e6576657220796f752076697369742074686520736974652e20496620796f7520646f206e6f7420696e74656e6420746f2065766572206c6f6720696e2c20796f75206d61792064656e79207468697320636f6f6b69652c2062757420796f752063616e6e6f74206c6f6720696e20776974686f75742069742e2049742077696c6c2062652064656c65746564207768656e20796f7520636c6f736520796f75722062726f777365722073657373696f6e2e0a0a4d6f726520636f6f6b696573206d617920626520736574207768656e20796f75206c6f6720696e2c20746f2061766f696420747970696e6720696e20796f75722075736572206e616d6520286f72206f7074696f6e616c6c792070617373776f726429206f6e20796f7572206e6578742076697369742e205468657365206c61737420757020746f20333020646179732e20596f75206d617920636c65617220746865736520636f6f6b6965732061667465722075736520696620796f7520617265207573696e672061207075626c6963206d616368696e6520616e6420646f6e2774207769736820746f206578706f736520796f757220757365726e616d6520746f20667574757265207573657273206f6620746865206d616368696e652e2028496620736f2c20636c656172207468652062726f777365722063616368652061732077656c6c2e290a0a3d3d3d2050617373776f726473203d3d3d0a0a4d616e792061737065637473206f66207468652043616970656469612070726f6a656374732720636f6d6d756e2e77696b6969747920696e746572616374696f6e7320646570656e64206f6e207468652072657075746174696f6e20616e6420726573706563742074686174206973206275696c74207570207468726f756768206120686973746f7279206f662076616c75656420636f6e747269627574696f6e732e20557365722070617373776f7264732061726520746865206f6e6c792067756172616e746565206f662074686520696e74656772697479206f66206120757365722773206564697420686973746f72792e20416c6c2075736572732061726520656e636f75726167656420746f2073656c656374207374726f6e672070617373776f72647320616e6420746f206e65766572207368617265207468656d2e204e6f206f6e65207368616c6c206b6e6f77696e676c79206578706f7365207468652070617373776f7264206f6620616e6f74686572207573657220746f207075626c69632072656c6561736520656974686572206469726563746c79206f7220696e6469726563746c792e0a0a3d3d2050726976617465206c6f6767696e67203d3d0a0a45766572792074696d6520796f7520766973697420612077656220706167652c20796f752073656e642061206c6f74206f6620696e666f726d6174696f6e20746f2074686520776562207365727665722e204d6f737420776562207365727665727320726f7574696e656c79206d61696e7461696e20616363657373206c6f67732077697468206120706f7274696f6e206f66207468697320696e666f726d6174696f6e2c2077686963682063616e206265207573656420746f2067657420616e206f766572616c6c2070696374757265206f6620776861742070616765732061726520706f70756c61722c2077686174206f74686572207369746573206c696e6b20746f2074686973206f6e652c20616e642077686174207765622062726f77736572732070656f706c6520617265207573696e672e204974206973206e6f742074686520696e74656e74696f6e206f66207468652043616970656469612070726f6a6563747320746f20757365207468697320696e666f726d6174696f6e20746f206b65657020747261636b206f66206c65676974696d6174652075736572732e0a0a54686520726177206c6f672064617461206973206e6f74206d616465207075626c69632c20616e64206973206e6f726d616c6c79206469736361726465642061667465722061626f75742074776f207765656b732e0a0a48657265277320612073616d706c65206f6620776861742773206c6f6767656420666f72206f6e65207061676520766965773a0a0a2036342e3136342e38322e313432202d202d205b32312f4f63742f323030333a30323a30333a3139202b303030305d0a2022474554202f77696b692f64726166745f707269766163795f706f6c69637920485454502f312e3122203230302031383038340a2022687474703a2f2f43616970656469612e6f72672f77696b692f43616970656469615f70726f6a656374733a56696c6c6167655f70756d70220a20224d6f7a696c6c612f352e3020284d6163696e746f73683b20553b20505043204d6163204f5320583b20656e2d757329204170706c655765624b69742f38352e3720284b48544d4c2c206c696b65204765636b6f29205361666172692f38352e35220a0a4c6f672064617461206d6179206265206578616d696e656420627920646576656c6f7065727320696e2074686520636f75727365206f6620736f6c76696e6720746563686e6963616c2070726f626c656d7320616e6420696e20747261636b696e6720646f776e206261646c792d626568617665642077656220737069646572732074686174206f7665727768656c6d2074686520736974652e20495020616464726573736573206f662075736572732c2064657269766564206569746865722066726f6d2074686f7365206c6f6773206f722066726f6d207265636f72647320696e2074686520646174616261736520617265206672657175656e746c79207573656420746f20636f7272656c61746520757365726e616d657320616e64206e6574776f726b20616464726573736573206f6620656469747320696e20696e7665737469676174696e67206162757365206f66207468652077696b692c20696e636c7564696e67207468652073757370656374656420757365206f66206d616c6963696f75732022736f636b707570706574732220286475706c6963617465206163636f756e7473292c2076616e64616c69736d2c206861726173736d656e74206f66206f746865722075736572732c206f722064697372757074696f6e206f66207468652077696b692e0a0a3d3d3d20506f6c696379206f6e2072656c65617365206f66206461746120646572697665642066726f6d2070616765206c6f6773203d3d3d0a0a49742069732074686520706f6c696379206f66204361697065646961207468617420706572736f6e616c6c79206964656e7469666961626c65206461746120636f6c6c656374656420696e2074686520736572766572206c6f67732c206f72207468726f756768207265636f72647320696e20746865206461746162617365207669612074686520436865636b5573657220666561747572652c206d61792062652072656c6561736564206279207468652073797374656d2061646d696e6973747261746f7273206f72207573657273207769746820436865636b55736572206163636573732c20696e2074686520666f6c6c6f77696e6720736974756174696f6e733a0a0a2320496e20726573706f6e736520746f20612076616c696420737562706f656e61206f72206f7468657220636f6d70756c736f727920726571756573742066726f6d206c617720656e666f7263656d656e740a232057697468207065726d697373696f6e206f662074686520616666656374656420757365720a2320546f20746865206368616972206f662043616970656469612c206869732f686572206c6567616c20636f756e73656c2c206f72206869732f6865722064657369676e65652c207768656e206e656365737361727920666f7220696e7665737469676174696f6e206f6620616275736520636f6d706c61696e74732e0a232057686572652074686520696e666f726d6174696f6e207065727461696e7320746f20706167652076696577732067656e657261746564206279206120737069646572206f7220626f7420616e64206974732064697373656d696e6174696f6e206973206e656365737361727920746f20696c6c75737472617465206f72207265736f6c766520746563686e6963616c206973737565732e0a2320576865726520746865207573657220686173206265656e2076616e64616c6973696e672061727469636c6573206f722070657273697374656e746c79206265686176696e6720696e20612064697372757074697665207761792c2064617461206d61792062652072656c656173656420746f2061737369737420696e2074686520746172676574696e67206f6620495020626c6f636b732c206f7220746f2061737369737420696e2074686520666f726d756c6174696f6e206f66206120636f6d706c61696e7420746f2072656c6576616e7420496e7465726e657420536572766963652050726f7669646572730a2320576865726520697420697320726561736f6e61626c79206e656365737361727920746f2070726f7465637420746865207269676874732c2070726f7065727479206f7220736166657479206f66207468652043616970656469612077656220736974652c20697473207573657273206f7220746865207075626c69632e3c212d2d2074686973206c696e6520626f72726f7765642066726f6d20476f6f676c652d2d3e0a0a436169706564696120706f6c69637920646f6573206e6f74207065726d6974207075626c696320646973747269627574696f6e206f66207375636820696e666f726d6174696f6e20756e64657220616e792063697263756d7374616e6365732c20657863657074206173206465736372696265642061626f76652e0a0a3d3d2053686172696e6720696e666f726d6174696f6e20776974682074686972642070617274696573203d3d0a0a457863657074207768657265206f7468657277697365207370656369666965642c20616c6c207465787420616464656420746f2043616970656469612070726f6a65637420697320617661696c61626c6520666f722072657573652c20776865726520746865207465787420697320617661696c61626c6520756e646572206120437265617469766520436f6d6d6f6e73204c6963656e73652e0a0a43616970656469612077696c6c206e6f742073656c6c206f72207368617265207072697661746520696e666f726d6174696f6e2c207375636820617320656d61696c206164647265737365732c207769746820746869726420706172746965732c20756e6c65737320796f7520616772656520746f2072656c65617365207468697320696e666f726d6174696f6e2c206f72206974206973207265717569726564206279206c617720746f2072656c656173652074686520696e666f726d6174696f6e2e0a0a3d3d5365637572697479206f6620696e666f726d6174696f6e3d3d0a0a546865204361697065646961207765622073697465206d616b6573206e6f2067756172616e74656520616761696e737420756e617574686f72697a65642061636365737320746f20616e7920696e666f726d6174696f6e20796f752070726f766964652e205468697320696e666f726d6174696f6e206d617920626520617661696c61626c6520746f20616e796f6e6520776974682061636365737320746f2074686520736572766572732e2041207061727469616c206c697374206f662074686f73652070656f706c652063616e20626520666f756e6420696e20746865205b5b6d3a646576656c6f706572737c646576656c6f706572735d5d206c6973742e0a0a0a3d3d20557365722064617461203d3d0a44617461206f6e2075736572732c2073756368206173207468652074696d657320617420776869636820746865792065646974656420616e6420746865206e756d626572206f6620656469747320746865792068617665206d61646520617265207075626c69636c7920617661696c61626c652076696120227573657220636f6e747269627574696f6e7322206c697374732c20616e6420696e206167677265676174656420666f726d73207075626c6973686564206279206f746865722075736572732e0a0a3d3d3d2052656d6f76616c206f662075736572206163636f756e7473203d3d3d0a0a4f6e636520637265617465642c2075736572206163636f756e74732077696c6c206e6f742062652072656d6f7665642e204974206d617920626520706f737369626c6520666f72206120757365726e616d6520746f206265206368616e6765642028646570656e64696e67206f6e2074686520706f6c6963696573206f6620796f7572206c6f63616c2077696b69292e2054686520436169706564696120776562207369746520646f6573206e6f742067756172616e74656520746861742061206e616d652077696c6c206265206368616e676564206f6e20726571756573742e200a0a57686574686572207370656369666963207573657220696e666f726d6174696f6e2069732064656c6574656420697320646570656e64616e74206f6e207468652064656c6574696f6e20706f6c6963696573206f66207468652070726f6a656374207468617420636f6e7461696e732074686520696e666f726d6174696f6e2e0a0a3d3d2044656c6574696f6e206f6620636f6e74656e74203d3d0a0a52656d6f76696e6720746578742066726f6d20436169706564696120646f6573206e6f74207065726d616e656e746c792064656c6574652069742e20496e206e6f726d616c2061727469636c65732c20616e796f6e652063616e206c6f6f6b20617420612070726576696f75732076657273696f6e20616e64207365652077686174207761732074686572652e20496620616e2061727469636c65206973202264656c65746564222c20616e7920757365722077697468202261646d696e6973747261746f722220616363657373206f6e207468652077696b692c206d65616e696e6720616c6d6f737420616e796f6e652074727573746564206e6f7420746f206162757365207468652064656c6574696f6e206361706162696c6974792c2063616e207365652077686174207761732064656c657465642e20496e666f726d6174696f6e2063616e206265207065726d616e656e746c792064656c657465642062792074686f73652070656f706c6520776974682061636365737320746f2074686520736572766572732c20627574207468657265206973206e6f2067756172616e74656520746869732077696c6c2068617070656e2065786365707420696e20726573706f6e736520746f206c6567616c20616374696f6e2e0a0a5b5b43617465676f72793a456e676c6973685d5d0a5b5b43617465676f72793a506f6c6963795d5d0a0a5f5f4e4f4544495453454354494f4e5f5f, 0x7574662d38),
(47, 0x27272757656c636f6d6520746f204361697065646961212727270a0a43686f6f7365204c616e67756167653a0a0a5b5b456e676c6973685d5d0a0a5b5b4368696e6573655d5d0a0a0a0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(48, 0x436c69636b206f6e20612063617465676f72792062656c6f77207468656e20636c69636b2022656469742220746f206164642061206e6577207265636970652e20506c65617365205b5b636f6e746163742075735d5d20696620796f752764207769736820746f2063726561746520616e6f746865722063617465676f72792e0a0a3c5441424c452077696474683d2231303025222076616c69676e3d22746f70223e0a202020203c54522076616c69676e3d22746f70223e0a2020202020202020203c54443e0a3c212d2d204c45465420434f4c554d4e202d2d3e0a272727417369616e272727200a0a5b5b4a6170616e5d5d0a0a5b5b4b6f7265615d5d0a0a5b5b546861696c616e645d5d0a0a5b5b496e6469615d5d0a0a0a2727275765737465726e2727270a0a5b5b4368696e6573655d5d0a0a5b5b4672656e63685d5d0a0a5b5b4974616c69616e5d5d0a0a5b5b4765726d616e5d5d0a0a5b5b416d65726963616e5d5d0a0a2020202020202020203c2f54443e0a0a2020202020202020203c54443e0a3c212d2d2d20524947485420434f4c554d4e202d2d2d3e0a0a2727274c6174696e612727270a0a5b5b537061696e5d5d0a0a5b5b4d657869636f5d5d0a0a5b5b47756174656d616c615d5d0a0a5b5b53616c7661646f725d5d0a0a5b5b4368696c655d5d0a0a5b5b4272617a696c5d5d0a0a5b5b417267656e74696e615d5d0a0a0a0a2727274d6964646c65204561737465726e2727270a0a5b5b4c6562616e6f6e5d5d0a0a0a2020202020202020203c2f54443e0a202020203c2f54523e0a3c2f5441424c453e, 0x7574662d38),
(49, 0x27272757656c636f6d6520746f204361697065646961212727270a0a43686f6f7365204c616e67756167653a0a0a5b5b456e676c6973682f454e205d5d0a0a5b5b4368696e6573652f434e205d5d0a0a0a0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(50, 0x436c69636b206f6e20612063617465676f72792062656c6f77207468656e20636c69636b2022656469742220746f206164642061206e6577207265636970652e20506c65617365205b5b636f6e746163742075735d5d20696620796f752764207769736820746f2063726561746520616e6f746865722063617465676f72792e0a0a3c5441424c452077696474683d2231303025222076616c69676e3d22746f70223e0a202020203c54522076616c69676e3d22746f70223e0a2020202020202020203c54443e0a3c212d2d204c45465420434f4c554d4e202d2d3e0a272727417369616e272727200a0a5b5be697a5e69cac5d5d0a0a5b5be99fa9e59bbd5d5d0a0a5b5be6b3b0e59bbd5d5d0a0a5b5be58db0e5baa65d5d0a0a5b5be4b8ade59bbd5d5d0a0a0a2727275765737465726e2727270a0a5b5be6b395e59bbd5d5d0a0a5b5be6848fe5a4a7e588a95d5d0a0a5b5be5beb7e59bbd5d5d0a0a5b5be7be8ee59bbd5d5d0a0a2020202020202020203c2f54443e0a0a2020202020202020203c54443e0a3c212d2d2d20524947485420434f4c554d4e202d2d2d3e0a0a2727274c6174696e612727270a0a5b5be8a5bfe78fade789995d5d0a0a5b5be4b988e8a5bfe4b8aa5d5d0a0a0a0a2727274d6964646c65204561737465726e2727270a0a5b5be9bb8ee5b7b4e5aba95d5d0a0a0a2020202020202020203c2f54443e0a202020203c2f54523e0a3c2f5441424c453e, 0x7574662d38),
(51, 0x436c69636b206f6e20612063617465676f72792062656c6f77207468656e20636c69636b2022656469742220746f206164642061206e6577207265636970652e20506c65617365205b5b636f6e746163742075735d5d20696620796f752764207769736820746f2063726561746520616e6f746865722063617465676f72792e0a0a3c5441424c452077696474683d2231303025222076616c69676e3d22746f70223e0a202020203c54522076616c69676e3d22746f70223e0a2020202020202020203c54443e0a3c212d2d204c45465420434f4c554d4e202d2d3e0a272727417369616e272727200a0a5b5b4368696e6573655d5d0a0a5b5b4a6170616e5d5d0a0a5b5b4b6f7265615d5d0a0a5b5b546861696c616e645d5d0a0a5b5b496e6469615d5d0a0a0a2727275765737465726e2727270a0a5b5b4672656e63685d5d0a0a5b5b4974616c69616e5d5d0a0a5b5b4765726d616e5d5d0a0a5b5b416d65726963616e5d5d0a0a2020202020202020203c2f54443e0a0a2020202020202020203c54443e0a3c212d2d2d20524947485420434f4c554d4e202d2d2d3e0a0a2727274c6174696e612727270a0a5b5b537061696e5d5d0a0a5b5b4d657869636f5d5d0a0a5b5b47756174656d616c615d5d0a0a5b5b53616c7661646f725d5d0a0a5b5b4368696c655d5d0a0a5b5b4272617a696c5d5d0a0a5b5b417267656e74696e615d5d0a0a0a0a2727274d6964646c65204561737465726e2727270a0a5b5b4c6562616e6f6e5d5d0a0a0a2020202020202020203c2f54443e0a202020203c2f54523e0a3c2f5441424c453e, 0x7574662d38),
(52, 0x235245444952454354205b5b456e676c69736820efbd9ce88bb1e8afad5d5d, 0x7574662d38),
(53, 0x27272757656c636f6d6520746f204361697065646961212727270a0a43686f6f7365204c616e67756167653a0a0a5b5b456e676c697368efbd9c20e88bb1e8afad205d5d0a0a5b5b4368696e6573652f434e205d5d0a0a0a0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(54, 0x27272757656c636f6d6520746f204361697065646961212727270a0a43686f6f7365204c616e67756167653a0a0a5b5b456e676c69736820efbd9ce88bb1e8afad5d5d0a0a5b5b4368696e6573652f434e205d5d0a0a0a0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(55, 0x235245444952454354205b5b4368696e65736520efbd9c20e4b8ade696875d5d, 0x7574662d38),
(56, 0x27272757656c636f6d6520746f204361697065646961212727270a0a43686f6f7365204c616e67756167653a0a0a5b5b456e676c69736820efbd9ce88bb1e8afad5d5d0a0a5b5b4368696e657365207c20e4b8ade696875d5d0a0a0a0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(57, 0x235245444952454354205b5be4b8ade696875d5d, 0x7574662d38),
(58, 0x235245444952454354205b5b4368696e657365202d20e4b8ade696875d5d, 0x7574662d38),
(59, 0x27272757656c636f6d6520746f204361697065646961212727270a0a43686f6f7365204c616e67756167653a0a0a5b5b456e676c69736820efbd9ce88bb1e8afad5d5d0a0a5b5b4368696e657365202d20e4b8ade696875d5d0a0a0a0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(60, 0x27272743686f6f73652062792050726f76696e63652f5374796c653a2727270a3c756c3e0a3c6c693e5b5b47656e6572616c2f436f6d6d6f6e5d5d3c2f6c693e0a3c6c693e5b5b5369636875616e6573655d5d3c2f6c693e0a3c6c693e5b5b48756e616e6573655d5d3c2f6c693e0a3c6c693e5b5b43616e746f6e6573655d5d3c2f6c693e0a3c6c693e5b5b5368616e676861696e6573655d5d3c2f6c693e0a3c6c693e5b5b48616e6742616e675d5d3c2f6c693e0a3c6c693e5b5b446f6e674265695d5d3c2f6c693e0a3c6c693e5b5b58696e6a69616e675d5d3c2f6c693e0a3c6c693e5b5b59756e6e616e5d5d3c2f6c693e0a3c2f756c3e, 0x7574662d38),
(61, 0x235245444952454354205b5b456e676c697368202d20e88bb1e8afad5d5d, 0x7574662d38),
(62, 0x27272757656c636f6d6520746f204361697065646961212727270a0a43686f6f7365204c616e67756167653a0a0a5b5b456e676c697368202d20e88bb1e8afad5d5d0a0a5b5b4368696e657365202d20e4b8ade696875d5d0a0a0a0a0a3c212d2d2d20484944452054484953205041525420286f726967696e616c290a3c6269673e2727274d6564696157696b6920686173206265656e207375636365737366756c6c7920696e7374616c6c65642e2727273c2f6269673e0a0a436f6e73756c7420746865205b687474703a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b687474703a2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b687474703a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a0a48656c6c6f0a0a2d2d2d3e, 0x7574662d38),
(63, 0x436c69636b206f6e20612063617465676f72792062656c6f77207468656e20636c69636b2022656469742220746f206164642061206e6577207265636970652e20506c65617365205b5b636f6e746163742075735d5d20696620796f752764207769736820746f2063726561746520616e6f746865722063617465676f72792e0a0a3c5441424c452077696474683d2231303025222076616c69676e3d22746f70223e0a202020203c54522076616c69676e3d22746f70223e0a2020202020202020203c54443e0a3c212d2d204c45465420434f4c554d4e202d2d3e0a272727417369616e272727200a0a5b5be4b8ade59bbd5d5d0a0a5b5be697a5e69cac5d5d0a0a5b5be99fa9e59bbd5d5d0a0a5b5be6b3b0e59bbd5d5d0a0a5b5be58db0e5baa65d5d0a0a2727275765737465726e2727270a0a5b5be6b395e59bbd5d5d0a0a5b5be6848fe5a4a7e588a95d5d0a0a5b5be5beb7e59bbd5d5d0a0a5b5be7be8ee59bbd5d5d0a0a2020202020202020203c2f54443e0a0a2020202020202020203c54443e0a3c212d2d2d20524947485420434f4c554d4e202d2d2d3e0a0a2727274c6174696e612727270a0a5b5be8a5bfe78fade789995d5d0a0a5b5be4b988e8a5bfe4b8aa5d5d0a0a0a0a2727274d6964646c65204561737465726e2727270a0a5b5be9bb8ee5b7b4e5aba95d5d0a0a0a2020202020202020203c2f54443e0a202020203c2f54523e0a3c2f5441424c453e, 0x7574662d38),
(64, 0x27272743686f6f73652062792050726f76696e63652f5374796c653a2727270a3c756c3e0a3c6c693e5b5be4b8ade4b8aa5d5d3c2f6c693e0a3c6c693e5b5be59b9be5b79d5d5d3c2f6c693e0a3c6c693e5b5be6b996e58d975d5d3c2f6c693e0a3c6c693e5b5be5b9bfe4b89c5d5d3c2f6c693e0a3c6c693e5b5be4b88ae6b5b75d5d3c2f6c693e0a3c6c693e5b5be8a18ce5b8ae5d5d3c2f6c693e0a3c6c693e5b5be4b89ce58c975d5d3c2f6c693e0a3c6c693e5b5be696b0e796865d5d3c2f6c693e0a3c6c693e5b5be4ba91e58d975d5d3c2f6c693e0a3c2f756c3e, 0x7574662d38),
(65, 0x27272743686f6f73652062792050726f76696e63652f5374796c653a2727270a3c756c3e0a3c6c693e5b5be4b8ade4b8aa5d5d3c2f6c693e0a3c6c693e5b5be59b9be5b79d5d5d3c2f6c693e0a3c6c693e5b5be6b996e58d975d5d3c2f6c693e0a3c6c693e5b5be5b9bfe4b89c5d5d3c2f6c693e0a3c6c693e5b5be4b88ae6b5b75d5d3c2f6c693e0a3c6c693e5b5be69dade5b8ae5d5d3c2f6c693e0a3c6c693e5b5be4b89ce58c975d5d3c2f6c693e0a3c6c693e5b5be696b0e796865d5d3c2f6c693e0a3c6c693e5b5be4ba91e58d975d5d3c2f6c693e0a3c2f756c3e, 0x7574662d38),
(66, 0x27272743686f6f73652062792050726f76696e63652f5374796c653a2727270a3c756c3e0a3c6c693e5b5be5a4a7e4bc975d5d3c2f6c693e0a3c6c693e5b5be59b9be5b79d5d5d3c2f6c693e0a3c6c693e5b5be6b996e58d975d5d3c2f6c693e0a3c6c693e5b5be5b9bfe4b89c5d5d3c2f6c693e0a3c6c693e5b5be4b88ae6b5b75d5d3c2f6c693e0a3c6c693e5b5be69dade5b8ae5d5d3c2f6c693e0a3c6c693e5b5be4b89ce58c975d5d3c2f6c693e0a3c6c693e5b5be696b0e796865d5d3c2f6c693e0a3c6c693e5b5be4ba91e58d975d5d3c2f6c693e0a3c2f756c3e, 0x7574662d38);

-- --------------------------------------------------------

--
-- Table structure for table `cp1_trackbacks`
--

CREATE TABLE IF NOT EXISTS `cp1_trackbacks` (
  `tb_id` int(11) NOT NULL auto_increment,
  `tb_page` int(11) default NULL,
  `tb_title` varchar(255) NOT NULL,
  `tb_url` blob NOT NULL,
  `tb_ex` text,
  `tb_name` varchar(255) default NULL,
  PRIMARY KEY  (`tb_id`),
  KEY `tb_page` (`tb_page`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cp1_trackbacks`
--


-- --------------------------------------------------------

--
-- Table structure for table `cp1_transcache`
--

CREATE TABLE IF NOT EXISTS `cp1_transcache` (
  `tc_url` varbinary(255) NOT NULL,
  `tc_contents` text,
  `tc_time` int(11) NOT NULL,
  UNIQUE KEY `tc_url_idx` (`tc_url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_transcache`
--


-- --------------------------------------------------------

--
-- Table structure for table `cp1_user`
--

CREATE TABLE IF NOT EXISTS `cp1_user` (
  `user_id` int(10) unsigned NOT NULL auto_increment,
  `user_name` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `user_real_name` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_newpass_time` binary(14) default NULL,
  `user_email` tinytext NOT NULL,
  `user_options` blob NOT NULL,
  `user_touched` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_token` binary(32) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_email_authenticated` binary(14) default NULL,
  `user_email_token` binary(32) default NULL,
  `user_email_token_expires` binary(14) default NULL,
  `user_registration` binary(14) default NULL,
  `user_editcount` int(11) default NULL,
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `user_email_token` (`user_email_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cp1_user`
--

INSERT INTO `cp1_user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_options`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`) VALUES
(1, 'T00gr33n', '', 0x3136303537636164363566663030643934386536376465323463323736396635, '', NULL, '', 0x717569636b6261723d310a756e6465726c696e653d320a636f6c733d38300a726f77733d32350a7365617263686c696d69743d32300a636f6e746578746c696e65733d350a636f6e7465787463686172733d35300a736b696e3d0a6d6174683d310a7263646179733d370a72636c696d69743d35300a776c6c696d69743d3235300a686967686c6967687462726f6b656e3d310a737475627468726573686f6c643d300a707265766965776f6e746f703d310a6564697473656374696f6e3d310a6564697473656374696f6e6f6e7269676874636c69636b3d300a73686f77746f633d310a73686f77746f6f6c6261723d310a646174653d64656661756c740a696d61676573697a653d320a7468756d6273697a653d320a72656d656d62657270617373776f72643d310a656e6f74696677617463686c69737470616765733d300a656e6f7469667573657274616c6b70616765733d310a656e6f7469666d696e6f7265646974733d300a656e6f74696672657665616c616464723d300a73686f776e756d626572737761746368696e673d310a66616e63797369673d300a65787465726e616c656469746f723d300a65787465726e616c646966663d300a73686f776a756d706c696e6b733d310a6e756d62657268656164696e67733d300a7573656c697665707265766965773d300a77617463686c697374646179733d330a76617269616e743d656e0a6c616e67756167653d656e0a7365617263684e73303d31, '20080126163601', 'c8ea95fa7a48a420d3cb245f1c7627a4', NULL, NULL, NULL, '20071117152728', 41),
(2, 'Toogreen', '', 0x3831656631303362323039353432663334323830656361613034663938646365, '', NULL, 'toogreen', 0x717569636b6261723d310a756e6465726c696e653d320a636f6c733d38300a726f77733d32350a7365617263686c696d69743d32300a636f6e746578746c696e65733d350a636f6e7465787463686172733d35300a736b696e3d6d6f6e6f626f6f6b0a6d6174683d310a7263646179733d370a72636c696d69743d35300a776c6c696d69743d3235300a686967686c6967687462726f6b656e3d310a737475627468726573686f6c643d300a707265766965776f6e746f703d310a6564697473656374696f6e3d310a6564697473656374696f6e6f6e7269676874636c69636b3d300a73686f77746f633d310a73686f77746f6f6c6261723d310a646174653d64656661756c740a696d61676573697a653d320a7468756d6273697a653d320a72656d656d62657270617373776f72643d310a656e6f74696677617463686c69737470616765733d300a656e6f7469667573657274616c6b70616765733d300a656e6f7469666d696e6f7265646974733d300a656e6f74696672657665616c616464723d300a73686f776e756d626572737761746368696e673d300a66616e63797369673d300a65787465726e616c656469746f723d300a65787465726e616c646966663d300a73686f776a756d706c696e6b733d310a6e756d62657268656164696e67733d300a7573656c697665707265766965773d300a77617463686c697374646179733d330a76617269616e743d0a6c616e67756167653d656e0a7365617263684e73303d310a6e69636b6e616d653d0a74696d65636f7272656374696f6e3d0a7365617263684e73313d300a7365617263684e73323d300a7365617263684e73333d300a7365617263684e73343d300a7365617263684e73353d300a7365617263684e73363d300a7365617263684e73373d300a7365617263684e73383d300a7365617263684e73393d300a7365617263684e7331303d300a7365617263684e7331313d300a7365617263684e7331323d300a7365617263684e7331333d300a7365617263684e7331343d300a7365617263684e7331353d300a64697361626c656d61696c3d310a6a7573746966793d300a686964656d696e6f723d300a657874656e6477617463686c6973743d300a7573656e657772633d300a656469746f6e64626c636c69636b3d300a6564697477696474683d300a77617463686372656174696f6e733d300a776174636864656661756c743d300a77617463686d6f7665733d300a776174636864656c6574696f6e3d300a6d696e6f7264656661756c743d300a707265766965776f6e66697273743d300a6e6f63616368653d300a666f7263656564697473756d6d6172793d300a77617463686c697374686964656f776e3d300a77617463686c69737468696465626f74733d300a77617463686c697374686964656d696e6f723d300a63636d656f6e656d61696c733d300a646966666f6e6c793d30, '20080608152942', '315281c0b26ee2bc6e63b935a5f2e235', NULL, NULL, NULL, '20071117163653', 12);

-- --------------------------------------------------------

--
-- Table structure for table `cp1_user_groups`
--

CREATE TABLE IF NOT EXISTS `cp1_user_groups` (
  `ug_user` int(10) unsigned NOT NULL default '0',
  `ug_group` varbinary(16) NOT NULL default '',
  PRIMARY KEY  (`ug_user`,`ug_group`),
  KEY `ug_group` (`ug_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_user_groups`
--

INSERT INTO `cp1_user_groups` (`ug_user`, `ug_group`) VALUES
(1, 'bureaucrat'),
(1, 'sysop');

-- --------------------------------------------------------

--
-- Table structure for table `cp1_user_newtalk`
--

CREATE TABLE IF NOT EXISTS `cp1_user_newtalk` (
  `user_id` int(11) NOT NULL default '0',
  `user_ip` varbinary(40) NOT NULL default '',
  KEY `user_id` (`user_id`),
  KEY `user_ip` (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_user_newtalk`
--


-- --------------------------------------------------------

--
-- Table structure for table `cp1_watchlist`
--

CREATE TABLE IF NOT EXISTS `cp1_watchlist` (
  `wl_user` int(10) unsigned NOT NULL,
  `wl_namespace` int(11) NOT NULL default '0',
  `wl_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `wl_notificationtimestamp` varbinary(14) default NULL,
  UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  KEY `namespace_title` (`wl_namespace`,`wl_title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp1_watchlist`
--

INSERT INTO `cp1_watchlist` (`wl_user`, `wl_namespace`, `wl_title`, `wl_notificationtimestamp`) VALUES
(2, 0, 'Main_Page', NULL),
(2, 1, 'Main_Page', NULL),
(2, 4, 'About', NULL),
(2, 5, 'About', NULL);
