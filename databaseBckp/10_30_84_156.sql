--
-- Database: `arma`
--
CREATE DATABASE IF NOT EXISTS `arma` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `arma`;

-- --------------------------------------------------------

--
-- Table structure for table `app_captcha`
--

DROP TABLE IF EXISTS `app_captcha`;
CREATE TABLE `app_captcha` (
  `appcaptcha_id` int(11) NOT NULL,
  `appcomponent_id` int(11) NOT NULL,
  `ipaddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `captchatext` varchar(8) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `app_captcha`
--

INSERT INTO `app_captcha` (`appcaptcha_id`, `appcomponent_id`, `ipaddress`, `captchatext`) VALUES
(2, 225, '149.164.7.157', 'lcff92fc'),
(4, 225, '173.174.150.185', '490df591'),
(5, 225, '184.58.183.158', '071120ne'),
(7, 225, '64.53.243.54', '6f8h6v9d'),
(8, 225, '80.1.114.143', '6a5dccbf'),
(9, 225, '73.114.32.186', '6fdxedb8'),
(18, 225, '184.88.193.240', '6c8yb3hf'),
(19, 225, '50.92.251.109', '96tfcfs5'),
(20, 225, '74.65.187.35', 'an3ivibx'),
(22, 225, '75.121.63.238', 'xbbd434a'),
(23, 225, '98.208.93.57', '8l8sc2zc'),
(24, 225, '23.118.177.39', '2a879nn8');

-- --------------------------------------------------------

--
-- Table structure for table `app_components`
--

DROP TABLE IF EXISTS `app_components`;
CREATE TABLE `app_components` (
  `appcomponent_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `componenttype` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `required` int(11) NOT NULL,
  `tooltip` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `ordernum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `app_components`
--

INSERT INTO `app_components` (`appcomponent_id`, `name`, `componenttype`, `required`, `tooltip`, `ordernum`) VALUES
(225, 'Captcha', 'captcha', 0, '', 11);

-- --------------------------------------------------------

--
-- Table structure for table `app_selectvalues`
--

DROP TABLE IF EXISTS `app_selectvalues`;
CREATE TABLE `app_selectvalues` (
  `appselectvalue_id` int(11) NOT NULL,
  `appcomponent_id` int(11) NOT NULL,
  `componentvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_values`
--

DROP TABLE IF EXISTS `app_values`;
CREATE TABLE `app_values` (
  `appvalue_id` int(11) NOT NULL,
  `appcomponent_id` int(11) NOT NULL,
  `memberapp_id` int(11) NOT NULL,
  `appvalue` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clocks`
--

DROP TABLE IF EXISTS `clocks`;
CREATE TABLE `clocks` (
  `clock_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ordernum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clocks`
--

INSERT INTO `clocks` (`clock_id`, `name`, `color`, `timezone`, `ordernum`) VALUES
(1, 'Eastern Time', '#16A800', 'America/New_York', 4),
(6, 'Central Time', '#C99000', 'America/Chicago', 3),
(7, 'Moutain Time', '#5E00FF', 'America/Denver', 2),
(8, 'Pacific Time', '#006FFF', 'America/Los_Angeles', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `dateposted` int(11) NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `console`
--

DROP TABLE IF EXISTS `console`;
CREATE TABLE `console` (
  `console_id` int(11) NOT NULL,
  `consolecategory_id` int(11) NOT NULL,
  `pagetitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `sortnum` int(11) NOT NULL,
  `adminoption` int(11) NOT NULL,
  `sep` int(11) NOT NULL,
  `defaultconsole` int(11) NOT NULL,
  `hide` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `console`
--

INSERT INTO `console` (`console_id`, `consolecategory_id`, `pagetitle`, `filename`, `sortnum`, `adminoption`, `sep`, `defaultconsole`, `hide`) VALUES
(1, 1, 'Add New Rank', 'admin/addrank.php', 1, 1, 0, 1, 0),
(2, 1, 'Manage Ranks', 'admin/manageranks.php', 2, 1, 0, 1, 0),
(5, 2, 'Add Member', 'membermanagement/addmember.php', 3, 0, 0, 1, 0),
(6, 2, 'Promote Member', 'membermanagement/promotemember.php', 2, 0, 0, 1, 0),
(7, 2, 'Demote Member', 'membermanagement/demotemember.php', 8, 0, 0, 1, 0),
(8, 2, 'Set Member''s Rank', 'membermanagement/setrank.php', 9, 0, 0, 1, 0),
(9, 10, 'Add New Medal', 'admin/addmedal.php', 2, 1, 0, 1, 0),
(10, 10, 'Manage Medals', 'admin/managemedals.php', 3, 1, 0, 1, 0),
(11, 3, 'Edit Profile', 'editprofile.php', 4, 0, 0, 1, 0),
(12, 1, '-separator-', '', 28, 1, 1, 0, 0),
(14, 1, 'Add Games Played', 'admin/addgamesplayed.php', 6, 1, 0, 1, 0),
(15, 1, 'Manage Games Played', 'admin/managegamesplayed.php', 7, 1, 0, 1, 0),
(17, 1, 'Add Custom Page', 'admin/addcustompages.php', 9, 1, 0, 1, 0),
(18, 1, 'Manage Custom Pages', 'admin/managecustompages.php', 10, 1, 0, 1, 0),
(19, 1, '-separator-', '', 5, 1, 1, 0, 0),
(20, 2, 'Disable a Member', 'membermanagement/disablemember.php', 1, 0, 0, 1, 0),
(21, 2, 'Delete Member', 'membermanagement/deletemember.php', 5, 0, 0, 1, 0),
(22, 1, 'Add New Rank Category', 'admin/addrankcategory.php', 3, 1, 0, 1, 0),
(23, 1, 'Manage Rank Categories', 'admin/managerankcategories.php', 4, 1, 0, 1, 0),
(25, 1, 'Add Console Option', 'admin/addconsoleoption.php', 15, 1, 0, 1, 0),
(31, 1, 'Manage Console Options', 'admin/manageconsole.php', 16, 1, 0, 1, 0),
(32, 1, 'Add New Console Category', 'admin/addconsolecategory.php', 17, 1, 0, 1, 0),
(33, 1, 'Manage Console Categories', 'admin/manageconsolecategories.php', 18, 1, 0, 1, 0),
(51, 1, '-separator-', '', 8, 1, 1, 1, 0),
(52, 1, '-separator-', '', 14, 1, 1, 1, 0),
(54, 14, '-separator-', '', 4, 1, 1, 1, 0),
(55, 14, 'Add Download Category', 'admin/adddownloadcategory.php', 2, 1, 0, 1, 0),
(56, 14, 'Manage Download Categories', 'admin/managedownloadcategories.php', 3, 1, 0, 1, 0),
(60, 1, '-separator-', '', 23, 1, 1, 1, 0),
(61, 1, 'Modify Current Theme', 'admin/edittheme.php', 29, 1, 0, 1, 0),
(62, 1, 'Website Settings', 'admin/sitesettings.php', 30, 1, 0, 1, 0),
(63, 1, 'Add Profile Category', 'admin/addprofilecategory.php', 26, 1, 0, 1, 0),
(64, 1, 'Manage Profile Categories', 'admin/manageprofilecategories.php', 27, 1, 0, 1, 0),
(65, 1, 'Add Profile Option', 'admin/addprofileoption.php', 24, 1, 0, 1, 0),
(66, 1, 'Manage Profile Options', 'admin/manageprofileoptions.php', 25, 1, 0, 1, 0),
(70, 2, '-separator-', '', 7, 0, 1, 0, 0),
(71, 7, 'Create a Squad', 'squads/create.php', 2, 0, 0, 1, 0),
(72, 7, 'View Your Squads', 'squads/index.php', 5, 0, 0, 1, 0),
(73, 7, 'Apply to a Squad', 'squads/apply.php', 3, 0, 0, 1, 0),
(74, 7, 'View Squad Invitations', 'squads/viewinvites.php', 4, 0, 0, 1, 0),
(75, 8, 'Create a Tournament', 'tournaments/create.php', 1, 0, 0, 1, 0),
(76, 8, 'Manage Tournaments', 'tournaments/manage.php', 3, 0, 0, 1, 0),
(77, 8, 'Manage My Matches', 'tournaments/managematches.php', 4, 0, 0, 1, 0),
(78, 17, 'Private Messages', 'privatemessages/index.php', 2, 0, 0, 1, 0),
(80, 3, 'Edit My Game Stats', 'editmygamestats.php', 3, 0, 0, 1, 0),
(82, 9, 'Post News', 'news/postnews.php', 2, 0, 0, 1, 0),
(83, 9, 'Manage News', 'news/managenews.php', 5, 0, 0, 1, 0),
(84, 9, 'View Private News', 'news/privatenews.php', 6, 0, 0, 1, 0),
(85, 9, 'Post Comment', 'news/postcomment.php', 3, 0, 0, 1, 1),
(86, 2, 'Undisable Member', 'membermanagement/undisablemember.php', 4, 0, 0, 1, 0),
(87, 10, 'Award Medal', 'medals/awardmedal.php', 1, 0, 0, 1, 0),
(88, 10, 'Revoke Medal', 'medals/revokemedal.php', 5, 0, 0, 1, 0),
(89, 3, 'Change Password', 'changepassword.php', 5, 0, 0, 1, 0),
(90, 2, '-separator-', '', 11, 0, 1, 0, 0),
(91, 2, 'Reset Member Password', 'membermanagement/resetpassword.php', 16, 0, 0, 1, 0),
(92, 3, 'View Logs', 'logs.php', 7, 0, 0, 1, 0),
(93, 9, 'Post in Shoutbox', 'news/postshoutbox.php', 4, 0, 0, 1, 1),
(96, 2, 'Registration Options', 'membermanagement/registrationoptions.php', 12, 0, 0, 1, 0),
(97, 2, 'Member Application', 'membermanagement/memberapplication.php', 13, 0, 0, 1, 0),
(98, 2, 'View Member Applications', 'membermanagement/viewapplications.php', 14, 0, 0, 1, 0),
(99, 11, 'Diplomacy: Add a Clan', 'diplomacy/addclan.php', 1, 0, 0, 1, 0),
(100, 11, 'Diplomacy: Manage Clans', 'diplomacy/manageclans.php', 2, 0, 0, 1, 0),
(101, 11, 'View Diplomacy Requests', 'diplomacy/viewrequests.php', 3, 0, 0, 1, 0),
(102, 11, 'Manage Diplomacy Statuses', 'diplomacy/diplomacystatuses.php', 6, 0, 0, 1, 0),
(103, 11, '-seperator-', '', 4, 0, 1, 1, 0),
(104, 11, 'Add Diplomacy Status', 'diplomacy/adddiplomacystatus.php', 5, 0, 0, 1, 0),
(105, 12, 'Add Event', 'events/addevent.php', 2, 0, 0, 1, 0),
(106, 12, 'Manage My Events', 'events/manage.php', 3, 0, 0, 1, 0),
(107, 12, 'View Event Invitations', 'events/viewinvites.php', 4, 0, 0, 1, 0),
(108, 1, 'Add Custom Form Page', 'admin/addcustomformpage.php', 11, 1, 0, 1, 0),
(109, 1, 'Manage Custom Form Pages', 'admin/managecustomforms.php', 12, 1, 0, 1, 0),
(110, 1, 'View Custom Form Submissions', 'admin/customformsubmissions.php', 13, 1, 0, 1, 0),
(111, 9, 'Modify News Ticker', 'news/newsticker.php', 8, 0, 0, 1, 0),
(113, 8, 'Join a Tournament', 'tournaments/join.php', 2, 0, 0, 1, 0),
(114, 1, 'Member''s Only Pages', 'admin/membersonlypages.php', 31, 1, 0, 1, 0),
(118, 13, 'Add Forum Category', 'forum/addcategory.php', 5, 0, 0, 1, 0),
(119, 13, 'Manage Forum Categories', 'forum/managecategories.php', 6, 0, 0, 1, 0),
(120, 13, '-seperator-', '', 7, 0, 1, 1, 0),
(121, 13, 'Add Board', 'forum/addboard.php', 8, 0, 0, 1, 0),
(122, 13, 'Manage Boards', 'forum/manageboards.php', 9, 0, 0, 1, 0),
(123, 13, 'Post Topic', 'forum/post.php', 3, 0, 0, 1, 1),
(124, 13, 'Manage Moderators', 'forum/managemoderators.php', 10, 0, 0, 1, 0),
(125, 13, 'Manage Forum Posts', 'forum/manageposts.php', 4, 0, 0, 1, 1),
(126, 3, 'Change Username', 'changeusername.php', 6, 0, 0, 1, 0),
(127, 2, 'Set Member''s Recruiter', 'membermanagement/setrecruiter.php', 17, 0, 0, 1, 0),
(128, 2, 'Set Member''s Recruit Date', 'membermanagement/setrecruitdate.php', 18, 0, 0, 1, 0),
(129, 2, '-seperator-', '', 15, 0, 1, 1, 0),
(134, 1, 'Clear Logs', 'admin/clearlogs.php', 32, 1, 0, 1, 0),
(135, 10, '-separator-', '', 4, 0, 1, 0, 0),
(136, 1, '-seperator-', '', 33, 0, 1, 1, 0),
(137, 1, 'Add Menu Category', 'admin/addmenucategory.php', 34, 0, 0, 1, 0),
(138, 1, 'Add Menu Item', 'admin/addmenuitem.php', 36, 0, 0, 1, 0),
(139, 1, 'Manage Menu Categories', 'admin/managemenucategory.php', 35, 0, 0, 1, 0),
(140, 1, 'Manage Menu Items', 'admin/managemenuitem.php', 37, 0, 0, 1, 0),
(141, 9, 'Manage Home Page Images', 'news/manageimages.php', 11, 0, 0, 1, 0),
(142, 9, 'Add Home Page Image', 'news/addimage.php', 10, 0, 0, 1, 0),
(143, 9, '-seperator-', '', 9, 0, 1, 1, 0),
(144, 13, 'Post Forum Attachments', 'forum/postattachments.php', 2, 0, 0, 1, 1),
(145, 14, 'Add Download', 'downloads/adddownload.php', 1, 0, 0, 1, 0),
(146, 14, 'Manage Downloads', 'downloads/managedownloads.php', 5, 0, 0, 1, 0),
(147, 13, '-seperator-', '', 11, 0, 1, 1, 0),
(148, 13, 'Forum Settings', 'forum/forumsettings.php', 12, 0, 0, 1, 0),
(150, 1, '-seperator-', '', 38, 0, 1, 1, 0),
(165, 1, 'Plugin Manager', 'admin/pluginmanager.php', 39, 0, 0, 1, 0),
(171, 2, 'Set Promotion Power', 'membermanagement/setpromotionpower.php', 10, 0, 0, 1, 0),
(172, 2, '-seperator-', '', 19, 0, 1, 1, 0),
(173, 2, 'Set Member Inactive Status', 'membermanagement/iaoptions.php', 20, 0, 0, 1, 0),
(174, 2, 'View Inactive Requests', 'membermanagement/inactiverequests.php', 21, 0, 0, 1, 0),
(175, 3, 'Inactive Request', 'requestinactive.php', 8, 0, 0, 1, 0),
(176, 3, 'Cancel IA', 'cancelinactive.php', 1, 0, 0, 1, 1),
(187, 17, '-separator-', '', 3, 0, 1, 0, 0),
(188, 17, 'Add PM Folder', 'privatemessages/addfolder.php', 4, 0, 0, 1, 0),
(189, 17, 'Manage PM Folders', 'privatemessages/managefolders.php', 5, 0, 0, 1, 0),
(190, 9, 'HTML in News Posts', '', 1, 0, 0, 1, 1),
(191, 9, 'Manage Shoutbox Posts', 'news/manageshoutbox.php', 7, 0, 0, 1, 0),
(192, 2, 'Change Member Username', 'membermanagement/changememberusername.php', 6, 0, 0, 1, 0),
(193, 1, 'IP Banning', 'admin/ipbanning.php', 40, 0, 0, 1, 0),
(194, 18, 'Create a Poll', 'polls/createpoll.php', 2, 0, 0, 1, 0),
(195, 18, 'Manage Polls', 'polls/managepolls.php', 3, 0, 0, 1, 0),
(196, 18, 'View Poll Results', '', 1, 0, 0, 1, 1),
(200, 13, 'Move Topic', 'forum/movetopic.php', 1, 0, 0, 1, 1),
(201, 7, 'Manage All Squads', '', 1, 1, 0, 1, 1),
(202, 12, 'Manage All Events', '', 1, 1, 0, 1, 1),
(203, 16, 'Add Social Media Icon', 'social/add.php', 1, 0, 0, 1, 0),
(204, 16, 'Manage Social Media Icons', 'social/manage.php', 2, 0, 0, 1, 0),
(209, 20, 'Add World Clock', 'worldclocks/addclock.php', 1, 1, 0, 1, 0),
(210, 20, 'Manage World Clocks', 'worldclocks/manageclocks.php', 2, 0, 0, 1, 0),
(211, 20, 'World Clock Settings', 'worldclocks/settings.php', 3, 0, 0, 1, 0),
(219, 3, 'E-mail Notification Settings', 'emailnotifications.php', 2, 0, 0, 1, 0),
(220, 17, 'E-mail Private Messages', '', 1, 1, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `console_members`
--

DROP TABLE IF EXISTS `console_members`;
CREATE TABLE `console_members` (
  `privilege_id` int(11) NOT NULL,
  `console_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `allowdeny` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `consolecategory`
--

DROP TABLE IF EXISTS `consolecategory`;
CREATE TABLE `consolecategory` (
  `consolecategory_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ordernum` int(11) NOT NULL,
  `adminoption` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `consolecategory`
--

INSERT INTO `consolecategory` (`consolecategory_id`, `name`, `ordernum`, `adminoption`) VALUES
(1, 'Administrator Options', 1, 1),
(2, 'Member Management', 5, 0),
(3, 'Account Options', 7, 0),
(7, 'Squads', 3, 0),
(8, 'Tournaments', 2, 0),
(9, 'News', 6, 0),
(10, 'Medals', 4, 0),
(11, 'Diplomacy Options', 8, 0),
(12, 'Events', 9, 0),
(13, 'Forum Management', 10, 0),
(14, 'Downloads', 11, 0),
(16, 'Social Media Connect', 12, 0),
(17, 'Private Messages', 13, 0),
(18, 'Polls', 14, 0),
(19, 'Donations', 15, 0),
(20, 'World Clocks', 16, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customform`
--

DROP TABLE IF EXISTS `customform`;
CREATE TABLE `customform` (
  `customform_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pageinfo` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `submitmessage` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `submitlink` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `specialform` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customform_components`
--

DROP TABLE IF EXISTS `customform_components`;
CREATE TABLE `customform_components` (
  `component_id` int(11) NOT NULL,
  `customform_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `componenttype` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `required` int(11) NOT NULL,
  `tooltip` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `sortnum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customform_selectvalues`
--

DROP TABLE IF EXISTS `customform_selectvalues`;
CREATE TABLE `customform_selectvalues` (
  `selectvalue_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `componentvalue` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `sortnum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customform_submission`
--

DROP TABLE IF EXISTS `customform_submission`;
CREATE TABLE `customform_submission` (
  `submission_id` int(11) NOT NULL,
  `customform_id` int(11) NOT NULL,
  `submitdate` int(11) NOT NULL,
  `ipaddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seenstatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customform_values`
--

DROP TABLE IF EXISTS `customform_values`;
CREATE TABLE `customform_values` (
  `value_id` int(11) NOT NULL,
  `submission_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `formvalue` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custompages`
--

DROP TABLE IF EXISTS `custompages`;
CREATE TABLE `custompages` (
  `custompage_id` int(11) NOT NULL,
  `pagename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pageinfo` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `custompages`
--

INSERT INTO `custompages` (`custompage_id`, `pagename`, `pageinfo`) VALUES
(11, 'History', '<p style="text-align: center;">This is the clan history.</p>\n<p style="text-align: center;">&nbsp;</p>\n<p style="text-align: center;">This is actually just a custom page...</p>'),
(12, 'Rules', '<p style="text-align: center;">This is the clan rules page.</p>\n<p style="text-align: center;">&nbsp;</p>\n<p style="text-align: center;">This is actually<strong> just a</strong> custom page...</p>\n<p style="text-align: center;">&nbsp;</p>\n<p style="text-align: center;">&nbsp;</p>');

-- --------------------------------------------------------

--
-- Table structure for table `diplomacy`
--

DROP TABLE IF EXISTS `diplomacy`;
CREATE TABLE `diplomacy` (
  `diplomacy_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `diplomacystatus_id` int(11) NOT NULL,
  `dateadded` int(11) NOT NULL,
  `clanname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `leaders` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `clansize` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `clantag` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `skill` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gamesplayed` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extrainfo` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diplomacy_request`
--

DROP TABLE IF EXISTS `diplomacy_request`;
CREATE TABLE `diplomacy_request` (
  `diplomacyrequest_id` int(11) NOT NULL,
  `ipaddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateadded` int(11) NOT NULL,
  `diplomacystatus_id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `clanname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `clantag` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `clansize` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `gamesplayed` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `leaders` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `confirmemail` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diplomacy_status`
--

DROP TABLE IF EXISTS `diplomacy_status`;
CREATE TABLE `diplomacy_status` (
  `diplomacystatus_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageurl` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `imagewidth` int(11) NOT NULL,
  `imageheight` int(11) NOT NULL,
  `ordernum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `diplomacy_status`
--

INSERT INTO `diplomacy_status` (`diplomacystatus_id`, `name`, `imageurl`, `imagewidth`, `imageheight`, `ordernum`) VALUES
(1, 'Ally', 'images/diplomacy/status_50e3b3406ddf8.png', 0, 0, 3),
(2, 'Enemy', 'images/diplomacy/status_50e3b36d60f5a.png', 20, 20, 1),
(3, 'Neutral', 'images/diplomacy/status_50e3b37ebd1fc.png', 0, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `download_extensions`
--

DROP TABLE IF EXISTS `download_extensions`;
CREATE TABLE `download_extensions` (
  `extension_id` int(11) NOT NULL,
  `downloadcategory_id` int(11) NOT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `download_extensions`
--

INSERT INTO `download_extensions` (`extension_id`, `downloadcategory_id`, `extension`) VALUES
(10, 6, '.zip'),
(11, 6, '.rep'),
(15, 7, '.mov'),
(16, 7, '.wmv'),
(17, 7, '.avi'),
(18, 7, '.swf'),
(24, 5, '');

-- --------------------------------------------------------

--
-- Table structure for table `downloadcategory`
--

DROP TABLE IF EXISTS `downloadcategory`;
CREATE TABLE `downloadcategory` (
  `downloadcategory_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ordernum` int(11) NOT NULL,
  `accesstype` int(11) NOT NULL,
  `specialkey` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `downloadcategory`
--

INSERT INTO `downloadcategory` (`downloadcategory_id`, `name`, `ordernum`, `accesstype`, `specialkey`) VALUES
(5, 'Forum Attachments', 1, 0, 'forumattachments'),
(6, 'Replays', 2, 0, ''),
(7, 'Videos', 3, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `downloads`
--

DROP TABLE IF EXISTS `downloads`;
CREATE TABLE `downloads` (
  `download_id` int(11) NOT NULL,
  `downloadcategory_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `dateuploaded` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mimetype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filesize` int(11) NOT NULL,
  `splitfile1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `splitfile2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `downloadcount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `downloads`
--

INSERT INTO `downloads` (`download_id`, `downloadcategory_id`, `member_id`, `dateuploaded`, `name`, `filename`, `mimetype`, `filesize`, `splitfile1`, `splitfile2`, `description`, `downloadcount`) VALUES
(15, 5, 13, 1378008075, '', '218d8d91a9620cebcc6e3f695433c0dd.jpg', 'image/jpeg', 16527, 'downloads/files/forumattachment/split_13780080755222bc0bdd010', 'downloads/files/forumattachment/split_13780080755222bc0bdd2ef', '', 0),
(16, 5, 13, 1378008075, '', '1323032613_trophy.png', 'image/png', 15325, 'downloads/files/forumattachment/split_13780080755222bc0bdf090', 'downloads/files/forumattachment/split_13780080755222bc0bdf36d', '', 0),
(17, 5, 13, 1378008153, '', 'phpinfo.php', 'text/x-php', 62, 'downloads/files/forumattachment/split_13780081535222bc59dd1ac', 'downloads/files/forumattachment/split_13780081535222bc59dd4e3', '', 0),
(19, 5, 13, 1378064028, '', 'iframe.html', 'text/html', 533, 'downloads/files/forumattachment/split_13780640275223969bf3c19', 'downloads/files/forumattachment/split_13780640275223969bf3e57', '', 3),
(20, 6, 13, 1378273105, 'Test Download 2', 'SplatterSocialIcons.zip', 'application/zip', 75393, 'downloads/split_13782731055226c7515288f', 'downloads/split_13782731055226c75152b34', 'sdfasdf', 0),
(21, 6, 13, 1378273133, 'Test 2', 'php_filesplit2.zip', 'application/zip', 1588, 'downloads/split_13782731335226c76de5c3d', 'downloads/split_13782731335226c76de971a', 'asdfs', 0),
(22, 6, 13, 1378273157, 'lol', 'CamStudioCodec-1.4-w32.zip', 'application/zip', 34510, 'downloads/split_13782731575226c7854346f', 'downloads/split_13782731575226c785436fc', 'wut', 0),
(23, 7, 13, 1378273371, 'Flow', 'flowplayer-3.2.7.swf', 'application/x-shockwave-flash', 120221, 'downloads/split_13782733715226c85bceb21', 'downloads/split_13782733715226c85bd333e', 'yo', 0),
(24, 7, 13, 1378276276, 'test final', 'flowplayer-3.2.7.swf', 'application/x-shockwave-flash', 120221, 'downloads/files/split_13782762765226d3b47718a', 'downloads/files/split_13782762765226d3b47750d', 'asdfs', 2),
(25, 6, 13, 1394083893, 'test', 'filters-2.0.zip', 'application/zip', 11870, 'downloads/files/split_139408389353180835dd0c7', 'downloads/files/split_139408389353180835dd528', 'asdf', 1),
(26, 5, 0, 1401776295, '', '1287666826226.png', 'image/png', 130930, 'downloads/files/forumattachment/split_1401776295538d68a7df419', 'downloads/files/forumattachment/split_1401776295538d68a7dfbe9', '', 1),
(27, 5, 0, 1401776368, '', '1287666826226.png', 'image/png', 130930, 'downloads/files/forumattachment/split_1401776368538d68f050f4f', 'downloads/files/forumattachment/split_1401776368538d68f051337', '', 0),
(28, 5, 0, 1401776368, '', 'avatar_52de4d9a0c0c2.jpg', 'image/jpeg', 42069, 'downloads/files/forumattachment/split_1401776368538d68f059039', 'downloads/files/forumattachment/split_1401776368538d68f059809', '', 0),
(31, 5, 0, 1412037813, '', 'testfile.zip', 'application/zip', 129, 'downloads/files/forumattachment/split_14120378135429fcb52e8ce', 'downloads/files/forumattachment/split_14120378135429fcb52ecb6', '', 5),
(32, 5, 0, 1412720198, '', 'testfile.txt', 'text/plain', 7, 'downloads/files/forumattachment/split_141272019854346646cb2ff', 'downloads/files/forumattachment/split_141272019854346646cbacf', '', 0),
(33, 6, 13, 1419924685, 'test', 'Torch.png', '', 0, 'downloads/files/54a254cd12a35', 'downloads/files/', 'asdf', 0),
(34, 6, 13, 1419924721, 'dsd', 'Torch.png', '', 0, 'downloads/files/54a254f17b730', 'downloads/files/', 'sd', 0),
(35, 6, 13, 1419924831, 'dsd', 'Torch.png', '', 0, 'downloads/files/54a2555fec585', 'downloads/files/', 'sd', 0),
(36, 6, 13, 1419924850, 'dsd', 'Torch.png', '', 0, 'downloads/files/54a25572f0697', 'downloads/files/', 'sd', 0),
(37, 6, 13, 1419924936, 'dsd', 'Torch.png', '', 0, 'downloads/files/54a255c8750a4', 'downloads/files/', 'sd', 0),
(38, 6, 13, 1419924975, 'dsd', 'Torch.png', '', 0, 'downloads/files/54a255ef2eba5', 'downloads/files/', 'sd', 0),
(39, 6, 13, 1419925039, 'dsd', 'stripe-php-latest.zip', '', 0, 'downloads/files/54a2562f8cd92.zip', 'downloads/files/', 'sd', 2),
(40, 6, 13, 1419928345, 'sdfgsdfgs', 'chromecast-master.zip', '', 0, 'downloads/files/54a26319a7e4d.zip.download', 'downloads/files/', '', 0),
(41, 5, 0, 1419928402, '', 'chromecast-master.zip', '', 0, 'downloads/files/forumattachment/54a26352a8e14zip.download', '', '', 0),
(42, 5, 0, 1419928500, '', 'chromecast-master.zip', '', 0, 'downloads/files/forumattachment/54a263b42a10c.zip.download', '', '', 1),
(43, 5, 0, 1419928700, '', 'chromecast-master.zip', '', 0, 'downloads/files/forumattachment/54a2647c3f6db.zip.download', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `emailnotifications_queue`
--

DROP TABLE IF EXISTS `emailnotifications_queue`;
CREATE TABLE `emailnotifications_queue` (
  `emailnotificationsqueue_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `senddate` int(11) NOT NULL,
  `sent` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emailnotifications_settings`
--

DROP TABLE IF EXISTS `emailnotifications_settings`;
CREATE TABLE `emailnotifications_settings` (
  `emailnotificationsetting_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `tournament_time` int(11) NOT NULL,
  `tournament_unit` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `event_time` int(11) NOT NULL,
  `event_unit` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `privatemessage` int(11) NOT NULL,
  `email_privatemessage` int(11) NOT NULL,
  `forum_topic` int(11) NOT NULL,
  `forum_post` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_reminder`
--

DROP TABLE IF EXISTS `event_reminder`;
CREATE TABLE `event_reminder` (
  `eventreminder_id` int(11) NOT NULL,
  `emailnotificationsqueue_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eventchat`
--

DROP TABLE IF EXISTS `eventchat`;
CREATE TABLE `eventchat` (
  `eventchat_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `datestarted` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eventchat_messages`
--

DROP TABLE IF EXISTS `eventchat_messages`;
CREATE TABLE `eventchat_messages` (
  `eventchatmessage_id` int(11) NOT NULL,
  `eventchat_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `dateposted` int(11) NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eventchat_roomlist`
--

DROP TABLE IF EXISTS `eventchat_roomlist`;
CREATE TABLE `eventchat_roomlist` (
  `eventchatlist_id` int(11) NOT NULL,
  `eventchat_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `inactive` int(11) NOT NULL,
  `lastseen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eventmessage_comment`
--

DROP TABLE IF EXISTS `eventmessage_comment`;
CREATE TABLE `eventmessage_comment` (
  `comment_id` int(11) NOT NULL,
  `eventmessage_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `dateposted` int(11) NOT NULL,
  `comment` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eventmessages`
--

DROP TABLE IF EXISTS `eventmessages`;
CREATE TABLE `eventmessages` (
  `eventmessage_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `dateposted` int(11) NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eventpositions`
--

DROP TABLE IF EXISTS `eventpositions`;
CREATE TABLE `eventpositions` (
  `position_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sortnum` int(11) NOT NULL,
  `modchat` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `invitemembers` int(11) NOT NULL,
  `manageinvites` int(11) NOT NULL,
  `postmessages` int(11) NOT NULL,
  `managemessages` int(11) NOT NULL,
  `attendenceconfirm` int(11) NOT NULL,
  `editinfo` int(11) NOT NULL,
  `eventpositions` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `startdate` int(11) NOT NULL,
  `timezone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enddate` int(11) NOT NULL,
  `publicprivate` int(11) NOT NULL,
  `visibility` int(11) NOT NULL,
  `messages` int(11) NOT NULL,
  `invitepermission` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events_members`
--

DROP TABLE IF EXISTS `events_members`;
CREATE TABLE `events_members` (
  `eventmember_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `invitedbymember_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `attendconfirm_admin` int(11) NOT NULL,
  `attendconfirm_member` int(11) NOT NULL,
  `hide` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failban`
--

DROP TABLE IF EXISTS `failban`;
CREATE TABLE `failban` (
  `failban_id` int(11) NOT NULL,
  `pagename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ipaddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `failban`
--

INSERT INTO `failban` (`failban_id`, `pagename`, `ipaddress`) VALUES
(1, 'edittheme', '98.208.93.57'),
(2, 'edittheme', '98.208.93.57'),
(3, 'edittheme', '98.208.93.57');

-- --------------------------------------------------------

--
-- Table structure for table `forgotpass`
--

DROP TABLE IF EXISTS `forgotpass`;
CREATE TABLE `forgotpass` (
  `rqid` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `changekey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timeofrq` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forum_attachments`
--

DROP TABLE IF EXISTS `forum_attachments`;
CREATE TABLE `forum_attachments` (
  `forumattachment_id` int(11) NOT NULL,
  `forumpost_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forum_board`
--

DROP TABLE IF EXISTS `forum_board`;
CREATE TABLE `forum_board` (
  `forumboard_id` int(11) NOT NULL,
  `forumcategory_id` int(11) NOT NULL,
  `subforum_id` int(11) NOT NULL,
  `lastpost_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `accesstype` int(11) NOT NULL,
  `sortnum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `forum_board`
--

INSERT INTO `forum_board` (`forumboard_id`, `forumcategory_id`, `subforum_id`, `lastpost_id`, `name`, `description`, `accesstype`, `sortnum`) VALUES
(1, 1, 0, 0, 'The Bar', 'Talk about shit here.', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `forum_category`
--

DROP TABLE IF EXISTS `forum_category`;
CREATE TABLE `forum_category` (
  `forumcategory_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ordernum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `forum_category`
--

INSERT INTO `forum_category` (`forumcategory_id`, `name`, `ordernum`) VALUES
(1, 'General', 1);

-- --------------------------------------------------------

--
-- Table structure for table `forum_memberaccess`
--

DROP TABLE IF EXISTS `forum_memberaccess`;
CREATE TABLE `forum_memberaccess` (
  `forummemberaccess_id` int(11) NOT NULL,
  `board_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `accessrule` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forum_moderator`
--

DROP TABLE IF EXISTS `forum_moderator`;
CREATE TABLE `forum_moderator` (
  `forummoderator_id` int(11) NOT NULL,
  `forumboard_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `dateadded` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forum_post`
--

DROP TABLE IF EXISTS `forum_post`;
CREATE TABLE `forum_post` (
  `forumpost_id` int(11) NOT NULL,
  `forumtopic_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `dateposted` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `lastedit_date` int(11) NOT NULL,
  `lastedit_member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forum_rankaccess`
--

DROP TABLE IF EXISTS `forum_rankaccess`;
CREATE TABLE `forum_rankaccess` (
  `forumrankaccess_id` int(11) NOT NULL,
  `board_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `accesstype` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forum_topic`
--

DROP TABLE IF EXISTS `forum_topic`;
CREATE TABLE `forum_topic` (
  `forumtopic_id` int(11) NOT NULL,
  `forumboard_id` int(11) NOT NULL,
  `forumpost_id` int(11) NOT NULL,
  `lastpost_id` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `replies` int(11) NOT NULL,
  `lockstatus` int(11) NOT NULL,
  `stickystatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forum_topicseen`
--

DROP TABLE IF EXISTS `forum_topicseen`;
CREATE TABLE `forum_topicseen` (
  `forumtopicseen_id` int(11) NOT NULL,
  `forumtopic_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `freezemedals_members`
--

DROP TABLE IF EXISTS `freezemedals_members`;
CREATE TABLE `freezemedals_members` (
  `freezemedal_id` int(11) NOT NULL,
  `medal_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `freezetime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gamesplayed`
--

DROP TABLE IF EXISTS `gamesplayed`;
CREATE TABLE `gamesplayed` (
  `gamesplayed_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageurl` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `imagewidth` int(11) NOT NULL,
  `imageheight` int(11) NOT NULL,
  `ordernum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gamesplayed`
--

INSERT INTO `gamesplayed` (`gamesplayed_id`, `name`, `imageurl`, `imagewidth`, `imageheight`, `ordernum`) VALUES
(2, 'Starcraft 2', 'images/gamesplayed/game_4f9dc59c97b06.png', 48, 48, 5),
(5, 'Starcraft', 'images/gamesplayed/game_4fc70ad0a7ab8.gif', 28, 14, 3),
(7, 'Minecraft', 'images/gamesplayed/game_501f58d5683e4.png', 32, 32, 1),
(8, 'Call of Duty', 'images/gamesplayed/game_508dc503812e7.png', 60, 15, 2),
(9, 'World of Warcraft', 'images/gamesplayed/game_508dc7963ba36.png', 0, 0, 4),
(12, 'Black Ops 2', 'images/gamesplayed/game_522d32661c6b3.png', 40, 40, 6),
(18, 'ARMA 3', 'images/gamesplayed/game_581146815a384.png', 0, 0, 7);

-- --------------------------------------------------------

--
-- Table structure for table `gamesplayed_members`
--

DROP TABLE IF EXISTS `gamesplayed_members`;
CREATE TABLE `gamesplayed_members` (
  `gamemember_id` int(11) NOT NULL,
  `gamesplayed_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gamesplayed_members`
--

INSERT INTO `gamesplayed_members` (`gamemember_id`, `gamesplayed_id`, `member_id`) VALUES
(218, 12, 65),
(219, 5, 69),
(220, 8, 69),
(221, 7, 69),
(222, 5, 70),
(223, 8, 70),
(224, 7, 70),
(225, 5, 71),
(226, 8, 71),
(227, 7, 71),
(228, 2, 72),
(229, 8, 72),
(230, 7, 72),
(321, 12, 13),
(322, 2, 13),
(323, 9, 13),
(324, 5, 13),
(325, 8, 13),
(326, 7, 13),
(327, 2, 48),
(328, 7, 48),
(329, 9, 75),
(330, 9, 76),
(331, 9, 77),
(332, 9, 78),
(333, 9, 79),
(337, 18, 4),
(339, 18, 8);

-- --------------------------------------------------------

--
-- Table structure for table `gamestats`
--

DROP TABLE IF EXISTS `gamestats`;
CREATE TABLE `gamestats` (
  `gamestats_id` int(11) NOT NULL,
  `gamesplayed_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stattype` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `calcop` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `firststat_id` int(11) NOT NULL,
  `secondstat_id` int(11) NOT NULL,
  `decimalspots` int(11) NOT NULL,
  `ordernum` int(11) NOT NULL,
  `hidestat` int(11) NOT NULL,
  `textinput` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gamestats`
--

INSERT INTO `gamestats` (`gamestats_id`, `gamesplayed_id`, `name`, `stattype`, `calcop`, `firststat_id`, `secondstat_id`, `decimalspots`, `ordernum`, `hidestat`, `textinput`) VALUES
(1, 8, 'K/D Ratio', 'calculate', 'div', 2, 3, 2, 0, 0, 0),
(2, 8, 'Kills', 'input', '', 0, 0, 0, 1, 0, 0),
(3, 8, 'Deaths', 'input', '', 0, 0, 0, 2, 0, 0),
(4, 5, 'Wins', 'input', '', 0, 0, 0, 0, 0, 0),
(5, 5, 'Losses', 'input', '', 0, 0, 0, 1, 0, 0),
(6, 2, 'Wins', 'input', '', 0, 0, 0, 0, 0, 0),
(7, 2, 'Losses', 'input', '', 0, 0, 0, 1, 0, 0),
(8, 9, 'Level', 'input', '', 0, 0, 0, 0, 0, 0),
(12, 12, 'K/D Ratio', 'input', '', 0, 0, 2, 0, 0, 0),
(13, 12, 'Kills', 'input', '', 0, 0, 0, 1, 0, 0),
(14, 12, 'Deaths', 'input', '', 0, 0, 0, 2, 0, 0),
(18, 12, 'New Stat', 'input', '', 0, 0, 1, 3, 0, 0),
(21, 7, 'Minecraft Username', 'input', '', 0, 0, 2, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gamestats_members`
--

DROP TABLE IF EXISTS `gamestats_members`;
CREATE TABLE `gamestats_members` (
  `gamestatmember_id` int(11) NOT NULL,
  `gamestats_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `statvalue` decimal(65,30) NOT NULL,
  `stattext` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateupdated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hitcounter`
--

DROP TABLE IF EXISTS `hitcounter`;
CREATE TABLE `hitcounter` (
  `hit_id` int(11) NOT NULL,
  `ipaddress` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `dateposted` int(11) NOT NULL,
  `pagename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `totalhits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hitcounter`
--

INSERT INTO `hitcounter` (`hit_id`, `ipaddress`, `dateposted`, `pagename`, `totalhits`) VALUES
(1, '98.208.93.57', 1477685665, 'Diplomacy - ', 243),
(2, '149.164.7.157', 1477685163, 'Promote Member - ', 23),
(3, '150.70.173.21', 1477656485, 'Members - ', 7),
(4, '209.0.146.171', 1477517211, 'Sign Up - ', 2),
(5, '73.235.44.156', 1477528932, '', 71),
(6, '173.174.150.185', 1477603207, '', 12),
(7, '64.53.243.54', 1477685363, '', 49),
(8, '93.159.230.39', 1477528795, '', 1),
(9, '50.92.251.109', 1477619783, 'Sign Up - ', 9),
(10, '98.212.148.19', 1477624949, '', 2),
(11, '50.121.48.56', 1477538470, '', 5),
(12, '184.58.183.158', 1477622098, 'Poll - ', 21),
(13, '45.35.63.194', 1477542723, '', 1),
(14, '104.238.248.15', 1477559402, '', 1),
(15, '158.69.229.134', 1477561045, '', 1),
(16, '204.13.201.138', 1477573369, '', 1),
(17, '206.225.80.193', 1477573369, '', 3),
(18, '192.42.116.16', 1477573370, '', 1),
(19, '104.131.157.171', 1477573438, '', 2),
(20, '193.171.202.150', 1477573438, '', 2),
(21, '89.234.157.254', 1477573438, '', 1),
(22, '37.157.193.161', 1477573439, '', 1),
(23, '89.187.142.208', 1477573440, '', 1),
(24, '199.249.223.71', 1477573441, '', 2),
(25, '162.242.156.106', 1477578806, '', 2),
(26, '149.164.111.200', 1477578114, '', 7),
(27, '54.184.37.156', 1477583139, '', 1),
(28, '70.198.78.184', 1477585310, '', 1),
(29, '80.1.114.143', 1477686294, 'Members - ', 24),
(30, '67.53.14.246', 1477676473, 'Forum - ', 9),
(31, '209.133.211.147', 1477599227, '', 1),
(32, '66.102.8.223', 1477599228, '', 1),
(33, '73.114.32.186', 1477601972, '', 7),
(34, '184.88.193.240', 1477606070, '', 15),
(35, '50.159.19.105', 1477606086, '', 1),
(36, '91.121.83.118', 1477608441, '', 1),
(37, '198.186.192.44', 1477685893, '', 2),
(38, '167.114.233.118', 1477615307, '', 1),
(39, '139.162.163.183', 1477617779, '', 1),
(40, '104.50.11.195', 1477621462, '', 5),
(41, '184.91.38.211', 1477619793, '', 1),
(42, '74.65.187.35', 1477685446, 'Ranks - ', 31),
(43, '110.88.44.187', 1477625570, '', 1),
(44, '122.177.106.45', 1477632982, '', 1),
(45, '66.249.88.19', 1477634967, '', 1),
(46, '66.102.6.140', 1477660029, '', 3),
(47, '95.175.97.229', 1477635733, '', 1),
(48, '173.236.168.104', 1477646974, '', 1),
(49, '45.32.217.244', 1477647616, '', 1),
(50, '160.9.1.54', 1477652873, 'Members - ', 3),
(51, '75.121.63.238', 1477681096, 'Edit Profile - ', 21),
(52, '150.70.173.9', 1477655031, 'Sign Up - ', 1),
(53, '150.70.173.6', 1477655058, '', 1),
(54, '150.70.188.165', 1477655081, 'Members - ', 1),
(55, '150.70.173.43', 1477655167, '', 1),
(56, '150.70.173.8', 1477655204, '', 1),
(57, '108.50.200.30', 1477677071, 'Ranks - ', 6),
(58, '183.82.112.166', 1477677197, '', 1),
(59, '182.61.21.10', 1477678060, '', 1),
(60, '159.203.160.162', 1477679962, '', 1),
(61, '23.118.177.39', 1477686339, 'Members - ', 15),
(62, '150.70.173.11', 1477686777, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `iarequest`
--

DROP TABLE IF EXISTS `iarequest`;
CREATE TABLE `iarequest` (
  `iarequest_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `requestdate` int(11) NOT NULL,
  `reason` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `requeststatus` int(11) NOT NULL,
  `reviewer_id` int(11) NOT NULL,
  `reviewdate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iarequest_messages`
--

DROP TABLE IF EXISTS `iarequest_messages`;
CREATE TABLE `iarequest_messages` (
  `iamessage_id` int(11) NOT NULL,
  `iarequest_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `messagedate` int(11) NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imageslider`
--

DROP TABLE IF EXISTS `imageslider`;
CREATE TABLE `imageslider` (
  `imageslider_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `messagetitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageurl` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `fillstretch` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `ordernum` int(11) NOT NULL,
  `link` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `linktarget` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `membersonly` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ipban`
--

DROP TABLE IF EXISTS `ipban`;
CREATE TABLE `ipban` (
  `ipban_id` int(11) NOT NULL,
  `ipaddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exptime` int(11) NOT NULL,
  `dateadded` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `logdate` int(11) NOT NULL,
  `ipaddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`log_id`, `member_id`, `logdate`, `ipaddress`, `message`) VALUES
(1, 1, 1477683155, '98.208.93.57', '<span style=''color: #ffffff''><a href=''/profile.php?mID=2'' style=''color: #048500'' title=''.R9''>.R9</a></span> promoted to rank Captain from Recruit.<br><br><b>Reason:</b><br>'),
(2, 1, 1477683197, '98.208.93.57', '<span style=''color: #ffffff''><a href=''/profile.php?mID=5'' style=''color: #048500'' title=''Arend''>Arend</a></span> promoted to rank 1st Lieutenant from Recruit.<br><br><b>Reason:</b><br>');

-- --------------------------------------------------------

--
-- Table structure for table `medals`
--

DROP TABLE IF EXISTS `medals`;
CREATE TABLE `medals` (
  `medal_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `imageurl` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `imagewidth` int(11) NOT NULL,
  `imageheight` int(11) NOT NULL,
  `autodays` int(11) NOT NULL,
  `autorecruits` int(11) NOT NULL,
  `ordernum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `medals`
--

INSERT INTO `medals` (`medal_id`, `name`, `description`, `imageurl`, `imagewidth`, `imageheight`, `autodays`, `autorecruits`, `ordernum`) VALUES
(2, 'Active Member Medal', 'Awarded for being an active clan member.', 'images/medals/medal_50d53660e7533.gif', 105, 30, 0, 0, 1),
(3, 'Forum Hero', 'Awarded for being active on the forums.', 'images/medals/medal_50d536249845b.gif', 105, 30, 0, 0, 3),
(4, 'Epic Medal', 'Awarded for being epic.', 'images/medals/medal_50d5361482940.gif', 105, 30, 0, 0, 4),
(6, 'Veteran Medal', 'Awarded after being in the clan for 90 days.', 'images/medals/medal_50d535a2dc0f8.gif', 105, 30, 90, 0, 7),
(7, 'Old Timer Medal', 'Awarded for being in the clan for 120 days.', 'images/medals/medal_50d535ef43360.gif', 105, 30, 0, 0, 6),
(8, 'Shooting Star Medal', 'Awarded for being in the clan 150 days.', 'images/medals/medal_50d536049e104.gif', 105, 30, 150, 0, 5),
(9, 'Silver Shield Medal', 'Awarded to members who help the clan with Web Design/Graphics, etc...', 'images/medals/medal_50d53640a63e9.gif', 105, 30, 0, 0, 2),
(10, 'Established Member Medal', 'Awarded after being in the clan for 30 days.', 'images/medals/medal_50d535cada75a.gif', 105, 30, 0, 0, 8);

-- --------------------------------------------------------

--
-- Table structure for table `medals_members`
--

DROP TABLE IF EXISTS `medals_members`;
CREATE TABLE `medals_members` (
  `medalmember_id` int(11) NOT NULL,
  `medal_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `dateawarded` int(11) NOT NULL,
  `reason` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `memberapps`
--

DROP TABLE IF EXISTS `memberapps`;
CREATE TABLE `memberapps` (
  `memberapp_id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applydate` int(11) NOT NULL,
  `ipaddress` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `memberadded` int(11) NOT NULL,
  `seenstatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `memberapps`
--

INSERT INTO `memberapps` (`memberapp_id`, `username`, `password`, `password2`, `email`, `applydate`, `ipaddress`, `memberadded`, `seenstatus`) VALUES
(1, '.R9', '$2a$04$352230e26fcade69b7b44uwUnxooK2106KFzpeuDkoCVoCA/7JqI2', '$2a$04$352230e26fcade69b7b443', 'travis.brumm@gmail.com', 1477506675, '149.164.7.157', 1, 1),
(2, 'Nightrader', '$2a$09$b8edaf6c15ac28cb59e55uLHyDPNx9d7JCFUnAY8HEUiviugzuFNK', '$2a$09$b8edaf6c15ac28cb59e559', 'nick.mayerson@gmail.com', 1477536152, '184.58.183.158', 1, 1),
(3, 'Luke Jefferson', '$2a$06$7006a43b9f721ae759d48u.3lseazwh73mizv6fGnXvayPtWiH/0W', '$2a$06$7006a43b9f721ae759d483', 'lsgenn@gmail.com', 1477538702, '64.53.243.54', 1, 1),
(4, 'Arend', '$2a$05$ced238bc68dfe2edc25e1u2AYMhlXV6FCDU7gybazLH/iztHmI91K', '$2a$05$ced238bc68dfe2edc25e10', 'ntnbrink1@gmail.com', 1477588906, '80.1.114.143', 1, 1),
(5, 'Zachary', '$2a$05$2ccf3e7690a5b598145d4efNN3qinUeb8rgzKByjoOBQTIVA6ng.a', '$2a$05$2ccf3e7690a5b598145d4f', 'zacheppy@gmail.com', 1477602038, '73.114.32.186', 1, 1),
(6, 'Faewix', '$2a$10$5dbabfe1c034976a0b6d2O51YM6xmlJSbG0sJkoycKBmDe8NIC2aa', '$2a$10$5dbabfe1c034976a0b6d2b', 'ianwolf@gmail.com', 1477606348, '184.88.193.240', 1, 1),
(7, 'Castaway', '$2a$09$e30b3641612257bbf669au715607nNJRbFPWTfyGBvcTF7nYNq8zm', '$2a$09$e30b3641612257bbf669a9', 'castaway15pvp@gmail.com', 1477620729, '74.65.187.35', 1, 1),
(8, 'J.Byram', '$2a$09$809e7445b9ad00f4aa154eKzn5ViJ0BFerlzMjhnqbS2BgOUkWK4K', '$2a$09$809e7445b9ad00f4aa154f', 'joshbyram15@yahoo.com', 1477654830, '75.121.63.238', 1, 1),
(9, 'Beachhead', '$2a$04$3b38dacdb6518f3596b33utr3H1.lL7wrROLb5qJBkoD1fISi.68K', '$2a$04$3b38dacdb6518f3596b337', 'beachhead85@gmail.com', 1477682912, '98.208.93.57', 1, 1),
(10, 'Powzer', '$2a$06$5a0a1d49704b2c73cdcc7ueC3Tf8zCsUzMNDypWgocnsf066gbD.e', '$2a$06$5a0a1d49704b2c73cdcc75', 'bower31@yahoo.com', 1477686458, '23.118.177.39', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rank_id` int(11) NOT NULL,
  `profilepic` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `avatar` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `maingame_id` int(11) NOT NULL,
  `birthday` int(11) NOT NULL,
  `datejoined` int(11) NOT NULL,
  `lastlogin` int(11) NOT NULL,
  `lastseen` int(11) NOT NULL,
  `lastseenlink` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `loggedin` int(11) NOT NULL,
  `lastpromotion` int(11) NOT NULL,
  `lastdemotion` int(11) NOT NULL,
  `timesloggedin` int(11) NOT NULL,
  `recruiter` int(11) NOT NULL,
  `ipaddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profileviews` int(11) NOT NULL,
  `defaultconsole` int(11) NOT NULL,
  `disabled` int(11) NOT NULL,
  `disableddate` int(11) NOT NULL,
  `notifications` int(11) NOT NULL,
  `topicsperpage` int(11) NOT NULL,
  `postsperpage` int(11) NOT NULL,
  `freezerank` int(11) NOT NULL,
  `forumsignature` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `promotepower` int(11) NOT NULL,
  `onia` int(11) NOT NULL,
  `inactivedate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `username`, `password`, `password2`, `rank_id`, `profilepic`, `avatar`, `email`, `maingame_id`, `birthday`, `datejoined`, `lastlogin`, `lastseen`, `lastseenlink`, `loggedin`, `lastpromotion`, `lastdemotion`, `timesloggedin`, `recruiter`, `ipaddress`, `profileviews`, `defaultconsole`, `disabled`, `disableddate`, `notifications`, `topicsperpage`, `postsperpage`, `freezerank`, `forumsignature`, `promotepower`, `onia`, `inactivedate`) VALUES
(1, 'admin', '$2a$06$98bf93c92295029184ba5uB.9R0.7nFTSkSDiAR/auv9RlRfzWAPS', '$2a$06$98bf93c92295029184ba50', 1, '', '', '', 0, 0, 1477506238, 1477685993, 1477687012, '<a href=''http://www.9thsfg.com/diplomacy/''>Diplomacy</a>', 1, 0, 0, 6, 0, '98.208.93.57', 2, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0),
(2, '.R9', '$2a$04$352230e26fcade69b7b44uwUnxooK2106KFzpeuDkoCVoCA/7JqI2', '$2a$04$352230e26fcade69b7b443', 60, '', '', 'travis.brumm@gmail.com', 0, 0, 1477506675, 1477685163, 1477685193, '<a href=''http://9thsfg.com/members/console.php?cID=6''>Promote Member</a>', 0, 1477683155, 0, 3, 0, '149.164.111.200', 1, 0, 0, 0, 0, 0, 0, 1477683155, '', 0, 0, 0),
(3, 'Nightrader', '$2a$09$b8edaf6c15ac28cb59e55uLHyDPNx9d7JCFUnAY8HEUiviugzuFNK', '$2a$09$b8edaf6c15ac28cb59e559', 43, '', '', 'nick.mayerson@gmail.com', 0, 0, 1477536153, 1477676473, 1477676473, '<a href=''http://www.9thsfg.com/forum/''>Forum</a>', 0, 0, 0, 1, 0, '184.58.183.158', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0),
(4, 'Luke Jefferson', '$2a$06$7006a43b9f721ae759d48u.3lseazwh73mizv6fGnXvayPtWiH/0W', '$2a$06$7006a43b9f721ae759d483', 43, 'images/profile/profile_5812912de41f0.jpg', '', 'lsgenn@gmail.com', 18, 932600674, 1477538702, 1477685363, 1477687048, '<a href=''http://www.9thsfg.com/index.php''>Home Page</a>', 1, 0, 0, 1, 0, '64.53.243.54', 0, 17, 0, 0, 0, 10, 10, 0, '', 0, 0, 0),
(5, 'Arend', '$2a$05$ced238bc68dfe2edc25e1u2AYMhlXV6FCDU7gybazLH/iztHmI91K', '$2a$05$ced238bc68dfe2edc25e10', 59, '', '', 'ntnbrink1@gmail.com', 0, 0, 1477588906, 1477685004, 1477687060, '<a href=''http://www.9thsfg.com/members.php''>Members</a>', 1, 1477683196, 0, 2, 0, '80.1.114.143', 0, 0, 0, 0, 0, 0, 0, 1477683196, '', 0, 0, 0),
(6, 'Zachary', '$2a$05$2ccf3e7690a5b598145d4efNN3qinUeb8rgzKByjoOBQTIVA6ng.a', '$2a$05$2ccf3e7690a5b598145d4f', 43, '', '', 'zacheppy@gmail.com', 0, 0, 1477602039, 1477602063, 1477602092, '<a href=''http://www.9thsfg.com/index.php''>Home Page</a>', 0, 0, 0, 1, 0, '73.114.32.186', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0),
(7, 'Faewix', '$2a$10$5dbabfe1c034976a0b6d2O51YM6xmlJSbG0sJkoycKBmDe8NIC2aa', '$2a$10$5dbabfe1c034976a0b6d2b', 43, '', '', 'ianwolf@gmail.com', 0, 0, 1477606348, 1477606363, 1477606384, '<a href=''http://www.9thsfg.com/''>Home Page</a>', 0, 0, 0, 1, 0, '184.88.193.240', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0),
(8, 'Castaway', '$2a$09$e30b3641612257bbf669au715607nNJRbFPWTfyGBvcTF7nYNq8zm', '$2a$09$e30b3641612257bbf669a9', 43, '', 'images/avatar/avatar_5812b42d010c4.jpg', 'castaway15pvp@gmail.com', 18, 72870, 1477620729, 1477685645, 1477685678, '<a href=''http://www.9thsfg.com/ranks.php''>Ranks</a>', 0, 0, 0, 3, 0, '74.65.187.35', 0, 17, 0, 0, 0, 10, 10, 0, '', 0, 0, 0),
(9, 'J.Byram', '$2a$09$809e7445b9ad00f4aa154eKzn5ViJ0BFerlzMjhnqbS2BgOUkWK4K', '$2a$09$809e7445b9ad00f4aa154f', 43, '', '', 'joshbyram15@yahoo.com', 0, 0, 1477654830, 1477681816, 1477681890, '<a href=''http://www.9thsfg.com/members/console.php?cID=11''>Edit Profile</a>', 0, 0, 0, 3, 0, '75.121.63.238', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0),
(10, 'Beachhead', '$2a$04$3b38dacdb6518f3596b33utr3H1.lL7wrROLb5qJBkoD1fISi.68K', '$2a$04$3b38dacdb6518f3596b337', 43, '', '', 'beachhead85@gmail.com', 0, 0, 1477682912, 1477683032, 1477683033, '<a href=''http://www.9thsfg.com/index.php''>Home Page</a>', 0, 0, 0, 1, 0, '98.208.93.57', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0),
(11, 'Powzer', '$2a$06$5a0a1d49704b2c73cdcc7ueC3Tf8zCsUzMNDypWgocnsf066gbD.e', '$2a$06$5a0a1d49704b2c73cdcc75', 43, '', '', 'bower31@yahoo.com', 0, 0, 1477686458, 1477686473, 1477687143, '<a href=''http://www.9thsfg.com/members.php''>Members</a>', 1, 0, 0, 1, 0, '23.118.177.39', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `membersonlypage`
--

DROP TABLE IF EXISTS `membersonlypage`;
CREATE TABLE `membersonlypage` (
  `page_id` int(11) NOT NULL,
  `pagename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pageurl` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateadded` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_category`
--

DROP TABLE IF EXISTS `menu_category`;
CREATE TABLE `menu_category` (
  `menucategory_id` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortnum` int(11) NOT NULL,
  `headertype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `headercode` longtext COLLATE utf8_unicode_ci NOT NULL,
  `accesstype` int(11) NOT NULL,
  `hide` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu_category`
--

INSERT INTO `menu_category` (`menucategory_id`, `section`, `name`, `sortnum`, `headertype`, `headercode`, `accesstype`, `hide`) VALUES
(1, 1, 'Shoutbox', 3, 'customcode', 'SHOUTBOX', 0, 0),
(4, 1, 'New Members', 4, 'customcode', 'NEW MEMBERS', 0, 0),
(5, 0, 'Forum Activity', 4, 'customcode', 'FORUM ACTIVITY', 0, 0),
(16, 0, 'Poll', 3, 'customcode', 'POLL', 0, 0),
(17, 0, 'Main Menu', 1, 'customcode', 'MAIN MENU', 0, 0),
(24, 1, 'Log In', 1, 'customcode', 'LOG IN', 2, 0),
(25, 1, 'Logged In', 2, 'customcode', 'LOGGED IN', 1, 0),
(28, 2, 'Top Menu', 1, 'customcode', '', 0, 0),
(29, 0, 'Top Players', 2, 'customcode', 'TOP PLAYERS', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu_item`
--

DROP TABLE IF EXISTS `menu_item`;
CREATE TABLE `menu_item` (
  `menuitem_id` int(11) NOT NULL,
  `menucategory_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `itemtype_id` int(11) NOT NULL,
  `accesstype` int(1) NOT NULL,
  `hide` int(1) NOT NULL,
  `sortnum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu_item`
--

INSERT INTO `menu_item` (`menuitem_id`, `menucategory_id`, `name`, `itemtype`, `itemtype_id`, `accesstype`, `hide`, `sortnum`) VALUES
(2, 1, 'Shoutbox', 'shoutbox', 1, 0, 0, 1),
(4, 4, 'Newest Members', 'newestmembers', 0, 0, 0, 1),
(5, 5, 'Forum Activity', 'forumactivity', 0, 0, 0, 1),
(54, 17, 'Ranks', 'link', 30, 0, 0, 4),
(55, 17, 'Medals', 'link', 31, 0, 0, 8),
(56, 17, 'Diplomacy', 'link', 32, 0, 0, 9),
(57, 17, 'Diplomacy Request', 'link', 33, 0, 0, 10),
(67, 17, 'Home', 'link', 34, 0, 0, 1),
(68, 16, 'Poll', 'poll', 1, 0, 0, 1),
(69, 24, 'Log In', 'login', 0, 0, 0, 1),
(70, 25, 'Logged In', 'login', 0, 0, 0, 1),
(75, 17, 'News', 'link', 36, 0, 0, 2),
(76, 17, 'Members', 'link', 37, 0, 0, 3),
(77, 17, 'Squads', 'link', 38, 0, 0, 5),
(78, 17, 'Tournaments', 'link', 39, 0, 0, 6),
(79, 17, 'Events', 'link', 40, 0, 0, 7),
(80, 17, 'Forum', 'link', 41, 0, 0, 13),
(81, 29, 'Top Player Links', 'top-players', 0, 0, 0, 1),
(82, 28, 'News', 'link', 42, 0, 0, 2),
(83, 28, 'Members', 'link', 43, 0, 0, 3),
(86, 28, 'Events', 'link', 46, 0, 0, 4),
(87, 28, 'Forum', 'link', 47, 0, 0, 5),
(89, 17, 'History', 'custompage', 10, 0, 0, 11),
(90, 17, 'Rules', 'custompage', 11, 0, 0, 12),
(91, 28, 'Ranks', 'link', 48, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menuitem_customblock`
--

DROP TABLE IF EXISTS `menuitem_customblock`;
CREATE TABLE `menuitem_customblock` (
  `menucustomblock_id` int(11) NOT NULL,
  `menuitem_id` int(11) NOT NULL,
  `blocktype` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `code` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menuitem_custompage`
--

DROP TABLE IF EXISTS `menuitem_custompage`;
CREATE TABLE `menuitem_custompage` (
  `menucustompage_id` int(11) NOT NULL,
  `menuitem_id` int(11) NOT NULL,
  `custompage_id` int(11) NOT NULL,
  `prefix` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `linktarget` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `textalign` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menuitem_custompage`
--

INSERT INTO `menuitem_custompage` (`menucustompage_id`, `menuitem_id`, `custompage_id`, `prefix`, `linktarget`, `textalign`) VALUES
(10, 89, 11, '<b>&middot;</b> ', '', 'left'),
(11, 90, 12, '<b>&middot;</b> ', '', 'left');

-- --------------------------------------------------------

--
-- Table structure for table `menuitem_image`
--

DROP TABLE IF EXISTS `menuitem_image`;
CREATE TABLE `menuitem_image` (
  `menuimage_id` int(11) NOT NULL,
  `menuitem_id` int(11) NOT NULL,
  `imageurl` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `link` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `linktarget` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `imagealign` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menuitem_link`
--

DROP TABLE IF EXISTS `menuitem_link`;
CREATE TABLE `menuitem_link` (
  `menulink_id` int(11) NOT NULL,
  `menuitem_id` int(11) NOT NULL,
  `link` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `linktarget` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `prefix` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `textalign` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menuitem_link`
--

INSERT INTO `menuitem_link` (`menulink_id`, `menuitem_id`, `link`, `linktarget`, `prefix`, `textalign`) VALUES
(30, 54, 'ranks.php', '', '<b>&middot;</b> ', 'left'),
(31, 55, 'medals.php', '', '<b>&middot;</b> ', 'left'),
(32, 56, 'diplomacy', '', '<b>&middot;</b> ', 'left'),
(33, 57, 'diplomacy/request.php', '', '<b>&middot;</b> ', 'left'),
(34, 67, 'index.php', '', '<b>&middot;</b> ', 'left'),
(36, 75, 'news', '', '<b>&middot;</b> ', 'left'),
(37, 76, 'members.php', '', '<b>&middot;</b> ', 'left'),
(38, 77, 'squads', '', '<b>&middot;</b> ', 'left'),
(39, 78, 'tournaments', '', '<b>&middot;</b> ', 'left'),
(40, 79, 'events', '', '<b>&middot;</b> ', 'left'),
(41, 80, 'forum', '', '<b>&middot;</b> ', 'left'),
(42, 82, 'news', '', '', 'left'),
(43, 83, 'members.php', '', '', 'left'),
(46, 86, 'events', '', '', 'left'),
(47, 87, 'forum', '', '', 'left'),
(48, 91, 'ranks.php', '', '', 'left');

-- --------------------------------------------------------

--
-- Table structure for table `menuitem_shoutbox`
--

DROP TABLE IF EXISTS `menuitem_shoutbox`;
CREATE TABLE `menuitem_shoutbox` (
  `menushoutbox_id` int(11) NOT NULL,
  `menuitem_id` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `percentwidth` int(1) NOT NULL,
  `percentheight` int(1) NOT NULL,
  `textboxwidth` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menuitem_shoutbox`
--

INSERT INTO `menuitem_shoutbox` (`menushoutbox_id`, `menuitem_id`, `width`, `height`, `percentwidth`, `percentheight`, `textboxwidth`) VALUES
(1, 2, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `newstype` int(11) NOT NULL,
  `dateposted` int(11) NOT NULL,
  `postsubject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `newspost` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `lasteditmember_id` int(11) NOT NULL,
  `lasteditdate` int(11) NOT NULL,
  `hpsticky` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `member_id`, `newstype`, `dateposted`, `postsubject`, `newspost`, `lasteditmember_id`, `lasteditdate`, `hpsticky`) VALUES
(1, 1, 3, 1477527324, 'Shoutbox Post', 'Test', 0, 0, 0),
(2, 5, 3, 1477588939, 'Shoutbox Post', 'Test 2', 0, 0, 0),
(3, 5, 3, 1477588950, 'Shoutbox Post', 'Cool, works. Hi guys!', 0, 0, 0),
(4, 2, 3, 1477589500, 'Shoutbox Post', 'WTB ability to edit the site and get it operational.', 0, 0, 0),
(5, 2, 3, 1477589523, 'Shoutbox Post', 'WTS my continually bugging Beach.', 0, 0, 0),
(6, 5, 3, 1477590645, 'Shoutbox Post', 'Goddamnit... stop using accronyms I don''t understand!', 0, 0, 0),
(7, 3, 3, 1477596385, 'Shoutbox Post', 'YOOOOOOOOOO', 0, 0, 0),
(8, 5, 3, 1477596468, 'Shoutbox Post', 'I''m hoping I can clear this data before we finish the site xD', 0, 0, 0),
(9, 4, 3, 1477601374, 'Shoutbox Post', 'Howdy :D', 0, 0, 0),
(10, 2, 3, 1477660130, 'Shoutbox Post', 'Arend - WTB = Willing to Buy : WTS = Willing to Sell', 0, 0, 0),
(11, 2, 3, 1477663889, 'Shoutbox Post', 'https://discord.gg/py6rShb', 0, 0, 0),
(12, 5, 3, 1477685034, 'Shoutbox Post', 'Ah right', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `datesent` int(11) NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `icontype` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `member_id`, `datesent`, `message`, `status`, `icontype`) VALUES
(1, 1, 1477506675, 'A new member has signed up!  Go to the <a href=''/members/console.php?cID=98''>View Member Applications</a> page to review the application.', 1, 'general'),
(2, 1, 1477536152, 'A new member has signed up!  Go to the <a href=''/members/console.php?cID=98''>View Member Applications</a> page to review the application.', 1, 'general'),
(3, 1, 1477538702, 'A new member has signed up!  Go to the <a href=''/members/console.php?cID=98''>View Member Applications</a> page to review the application.', 1, 'general'),
(4, 1, 1477588906, 'A new member has signed up!  Go to the <a href=''/members/console.php?cID=98''>View Member Applications</a> page to review the application.', 1, 'general'),
(5, 1, 1477602038, 'A new member has signed up!  Go to the <a href=''/members/console.php?cID=98''>View Member Applications</a> page to review the application.', 1, 'general'),
(6, 1, 1477606348, 'A new member has signed up!  Go to the <a href=''/members/console.php?cID=98''>View Member Applications</a> page to review the application.', 1, 'general'),
(7, 1, 1477620729, 'A new member has signed up!  Go to the <a href=''/members/console.php?cID=98''>View Member Applications</a> page to review the application.', 1, 'general'),
(8, 1, 1477654830, 'A new member has signed up!  Go to the <a href=''/members/console.php?cID=98''>View Member Applications</a> page to review the application.', 1, 'general'),
(9, 1, 1477682912, 'A new member has signed up!  Go to the <a href=''/members/console.php?cID=98''>View Member Applications</a> page to review the application.', 1, 'general'),
(10, 2, 1477683155, 'Your rank has been set to Captain!', 1, 'general'),
(11, 5, 1477683197, 'Your rank has been set to 1st Lieutenant!', 1, 'general'),
(12, 1, 1477686458, 'A new member has signed up!  Go to the <a href=''/members/console.php?cID=98''>View Member Applications</a> page to review the application.', 1, 'general');

-- --------------------------------------------------------

--
-- Table structure for table `plugin_config`
--

DROP TABLE IF EXISTS `plugin_config`;
CREATE TABLE `plugin_config` (
  `pluginconfig_id` int(11) NOT NULL,
  `plugin_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plugin_pages`
--

DROP TABLE IF EXISTS `plugin_pages`;
CREATE TABLE `plugin_pages` (
  `pluginpage_id` int(11) NOT NULL,
  `plugin_id` int(11) NOT NULL,
  `page` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pagepath` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `sortnum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
CREATE TABLE `plugins` (
  `plugin_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filepath` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `apikey` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateinstalled` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poll_memberaccess`
--

DROP TABLE IF EXISTS `poll_memberaccess`;
CREATE TABLE `poll_memberaccess` (
  `pollmemberaccess_id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `accesstype` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poll_options`
--

DROP TABLE IF EXISTS `poll_options`;
CREATE TABLE `poll_options` (
  `polloption_id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `optionvalue` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `sortnum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `poll_options`
--

INSERT INTO `poll_options` (`polloption_id`, `poll_id`, `optionvalue`, `color`, `sortnum`) VALUES
(1, 1, 'Green', '#1AFF00', 0),
(2, 1, 'White', '#FFFFFF', 1),
(3, 1, 'Black', '#000000', 2),
(4, 1, 'Red', '#FF0000', 3),
(5, 1, 'Blue', '#0900FF', 4);

-- --------------------------------------------------------

--
-- Table structure for table `poll_rankaccess`
--

DROP TABLE IF EXISTS `poll_rankaccess`;
CREATE TABLE `poll_rankaccess` (
  `pollrankaccess_id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `accesstype` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poll_votes`
--

DROP TABLE IF EXISTS `poll_votes`;
CREATE TABLE `poll_votes` (
  `pollvote_id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `polloption_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `ipaddress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `datevoted` int(11) NOT NULL,
  `votecount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `poll_votes`
--

INSERT INTO `poll_votes` (`pollvote_id`, `poll_id`, `polloption_id`, `member_id`, `ipaddress`, `datevoted`, `votecount`) VALUES
(1, 1, 4, 0, '184.58.183.158', 1477536119, 1),
(2, 1, 1, 0, '184.88.193.240', 1477606289, 1),
(3, 1, 3, 0, '104.50.11.195', 1477618591, 1),
(4, 1, 4, 3, '184.58.183.158', 1477622149, 1),
(5, 1, 3, 0, '74.65.187.35', 1477632099, 1),
(6, 1, 4, 0, '108.50.200.30', 1477677094, 1),
(7, 1, 5, 0, '75.121.63.238', 1477681741, 1),
(8, 1, 3, 11, '23.118.177.39', 1477686988, 18),
(9, 1, 2, 11, '23.118.177.39', 1477687097, 25);

-- --------------------------------------------------------

--
-- Table structure for table `polls`
--

DROP TABLE IF EXISTS `polls`;
CREATE TABLE `polls` (
  `poll_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `question` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `accesstype` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `multivote` int(11) NOT NULL,
  `displayvoters` int(11) NOT NULL,
  `resultvisibility` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `maxvotes` int(11) NOT NULL,
  `pollend` int(11) NOT NULL,
  `dateposted` int(11) NOT NULL,
  `lastedit_date` int(11) NOT NULL,
  `lastedit_memberid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `polls`
--

INSERT INTO `polls` (`poll_id`, `member_id`, `question`, `accesstype`, `multivote`, `displayvoters`, `resultvisibility`, `maxvotes`, `pollend`, `dateposted`, `lastedit_date`, `lastedit_memberid`) VALUES
(1, 13, 'Whats your favorite color?', 'public', 0, 0, 'open', 0, 0, 1395344025, 1395859418, 13);

-- --------------------------------------------------------

--
-- Table structure for table `privatemessage_folders`
--

DROP TABLE IF EXISTS `privatemessage_folders`;
CREATE TABLE `privatemessage_folders` (
  `pmfolder_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ordernum` int(11) NOT NULL,
  `sortnum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `privatemessage_members`
--

DROP TABLE IF EXISTS `privatemessage_members`;
CREATE TABLE `privatemessage_members` (
  `pmmember_id` int(11) NOT NULL,
  `pm_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `grouptype` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  `seenstatus` int(11) NOT NULL,
  `deletestatus` int(11) NOT NULL,
  `pmfolder_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `privatemessages`
--

DROP TABLE IF EXISTS `privatemessages`;
CREATE TABLE `privatemessages` (
  `pm_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `datesent` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `originalpm_id` int(11) NOT NULL,
  `deletesender` int(11) NOT NULL,
  `deletereceiver` int(11) NOT NULL,
  `senderfolder_id` int(11) NOT NULL DEFAULT '-1',
  `receiverfolder_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profilecategory`
--

DROP TABLE IF EXISTS `profilecategory`;
CREATE TABLE `profilecategory` (
  `profilecategory_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ordernum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profilecategory`
--

INSERT INTO `profilecategory` (`profilecategory_id`, `name`, `ordernum`) VALUES
(1, 'Personal Information', 1);

-- --------------------------------------------------------

--
-- Table structure for table `profileoptions`
--

DROP TABLE IF EXISTS `profileoptions`;
CREATE TABLE `profileoptions` (
  `profileoption_id` int(11) NOT NULL,
  `profilecategory_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `optiontype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortnum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profileoptions`
--

INSERT INTO `profileoptions` (`profileoption_id`, `profilecategory_id`, `name`, `optiontype`, `sortnum`) VALUES
(2, 1, 'First Name', 'input', 2),
(3, 1, 'Gender', 'select', 1),
(6, 1, 'Last Name', 'input', 3);

-- --------------------------------------------------------

--
-- Table structure for table `profileoptions_select`
--

DROP TABLE IF EXISTS `profileoptions_select`;
CREATE TABLE `profileoptions_select` (
  `selectopt_id` int(11) NOT NULL,
  `profileoption_id` int(11) NOT NULL,
  `selectvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortnum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profileoptions_select`
--

INSERT INTO `profileoptions_select` (`selectopt_id`, `profileoption_id`, `selectvalue`, `sortnum`) VALUES
(13, 3, 'Alien', 1),
(14, 3, 'Male', 2),
(15, 3, 'Female', 3);

-- --------------------------------------------------------

--
-- Table structure for table `profileoptions_values`
--

DROP TABLE IF EXISTS `profileoptions_values`;
CREATE TABLE `profileoptions_values` (
  `values_id` int(11) NOT NULL,
  `profileoption_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `inputvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profileoptions_values`
--

INSERT INTO `profileoptions_values` (`values_id`, `profileoption_id`, `member_id`, `inputvalue`) VALUES
(10, 3, 4, '14'),
(11, 2, 4, 'Not Set'),
(12, 6, 4, 'Not Set'),
(16, 3, 8, '14'),
(17, 2, 8, 'Not Set'),
(18, 6, 8, 'Not Set');

-- --------------------------------------------------------

--
-- Table structure for table `rank_privileges`
--

DROP TABLE IF EXISTS `rank_privileges`;
CREATE TABLE `rank_privileges` (
  `privilege_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `console_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rank_privileges`
--

INSERT INTO `rank_privileges` (`privilege_id`, `rank_id`, `console_id`) VALUES
(2, 1, 2),
(3, 1, 3),
(6, 1, 7),
(10, 1, 11),
(11, 1, 12),
(12, 1, 14),
(13, 1, 15),
(14, 1, 17),
(15, 1, 18),
(16, 1, 19),
(61, 1, 22),
(62, 1, 23),
(165, 1, 25),
(337, 1, 31),
(338, 1, 32),
(339, 1, 33),
(340, 1, 34),
(367, 1, 21),
(451, 1, 8),
(482, 1, 51),
(483, 1, 52),
(491, 1, 60),
(492, 1, 61),
(493, 1, 62),
(494, 1, 63),
(495, 1, 64),
(496, 1, 65),
(497, 1, 66),
(509, 1, 70),
(517, 1, 71),
(518, 1, 72),
(519, 1, 73),
(520, 1, 74),
(564, 1, 75),
(565, 1, 76),
(573, 1, 83),
(574, 1, 84),
(575, 1, 85),
(578, 1, 86),
(580, 1, 88),
(581, 1, 89),
(582, 1, 90),
(583, 1, 91),
(584, 1, 92),
(585, 1, 93),
(771, 61, 85),
(772, 61, 93),
(775, 61, 71),
(776, 61, 75),
(778, 61, 11),
(779, 61, 73),
(780, 61, 76),
(781, 61, 74),
(782, 61, 77),
(784, 61, 84),
(785, 61, 72),
(786, 61, 89),
(787, 61, 70),
(788, 61, 92),
(790, 61, 7),
(811, 59, 85),
(812, 59, 93),
(815, 59, 71),
(816, 59, 75),
(818, 59, 11),
(819, 59, 73),
(820, 59, 76),
(821, 59, 74),
(822, 59, 77),
(824, 59, 84),
(825, 59, 72),
(826, 59, 89),
(827, 59, 70),
(828, 59, 92),
(830, 59, 7),
(831, 58, 85),
(832, 58, 93),
(835, 58, 71),
(836, 58, 75),
(838, 58, 11),
(839, 58, 73),
(840, 58, 76),
(841, 58, 74),
(842, 58, 77),
(844, 58, 84),
(845, 58, 72),
(846, 58, 89),
(847, 58, 70),
(848, 58, 92),
(850, 58, 7),
(938, 52, 85),
(939, 52, 93),
(941, 52, 11),
(942, 52, 73),
(943, 52, 74),
(945, 52, 72),
(946, 52, 89),
(947, 52, 92),
(948, 51, 85),
(949, 51, 93),
(951, 51, 11),
(952, 51, 73),
(953, 51, 74),
(955, 51, 72),
(956, 51, 89),
(957, 51, 92),
(958, 50, 85),
(959, 50, 93),
(961, 50, 11),
(962, 50, 73),
(963, 50, 74),
(965, 50, 72),
(966, 50, 89),
(967, 50, 92),
(1048, 50, 80),
(1059, 51, 80),
(1060, 52, 80),
(1066, 58, 80),
(1067, 59, 80),
(1069, 61, 80),
(1076, 1, 80),
(1138, 1, 99),
(1139, 1, 100),
(1140, 1, 101),
(1141, 1, 102),
(1143, 1, 104),
(1290, 50, 106),
(1301, 51, 106),
(1302, 52, 106),
(1308, 58, 106),
(1309, 59, 106),
(1311, 61, 106),
(1319, 1, 106),
(1320, 50, 107),
(1331, 51, 107),
(1332, 52, 107),
(1338, 58, 107),
(1339, 59, 107),
(1341, 61, 107),
(1349, 1, 107),
(1469, 63, 85),
(1470, 63, 93),
(1473, 63, 71),
(1474, 63, 75),
(1475, 63, 80),
(1476, 63, 106),
(1477, 63, 11),
(1478, 63, 73),
(1479, 63, 76),
(1481, 63, 74),
(1482, 63, 77),
(1484, 63, 84),
(1485, 63, 107),
(1486, 63, 72),
(1487, 63, 89),
(1488, 63, 70),
(1489, 63, 92),
(1491, 63, 7),
(1492, 62, 85),
(1493, 62, 93),
(1496, 62, 71),
(1497, 62, 75),
(1498, 62, 80),
(1499, 62, 106),
(1500, 62, 11),
(1501, 62, 73),
(1502, 62, 76),
(1504, 62, 74),
(1505, 62, 77),
(1507, 62, 84),
(1508, 62, 107),
(1509, 62, 72),
(1510, 62, 89),
(1511, 62, 70),
(1512, 62, 92),
(1514, 62, 7),
(1515, 43, 85),
(1516, 43, 93),
(1517, 43, 80),
(1518, 43, 106),
(1519, 43, 11),
(1520, 43, 73),
(1522, 43, 74),
(1524, 43, 107),
(1525, 43, 72),
(1526, 43, 89),
(1527, 43, 92),
(1603, 1, 103),
(1622, 50, 82),
(1626, 43, 82),
(1633, 51, 82),
(1634, 52, 82),
(1640, 58, 82),
(1641, 59, 82),
(1643, 61, 82),
(1644, 62, 82),
(1645, 63, 82),
(1649, 1, 82),
(1651, 50, 105),
(1655, 43, 105),
(1662, 51, 105),
(1663, 52, 105),
(1669, 58, 105),
(1670, 59, 105),
(1672, 61, 105),
(1673, 62, 105),
(1674, 63, 105),
(1679, 1, 105),
(1682, 50, 123),
(1686, 43, 123),
(1693, 51, 123),
(1694, 52, 123),
(1700, 58, 123),
(1701, 59, 123),
(1703, 61, 123),
(1704, 62, 123),
(1705, 63, 123),
(1711, 1, 123),
(1715, 1, 1),
(1824, 1, 125),
(1831, 1, 9),
(1838, 1, 10),
(1967, 1, 5),
(2063, 1, 55),
(2065, 1, 56),
(2067, 1, 54),
(2218, 60, 82),
(2219, 60, 71),
(2220, 60, 75),
(2221, 60, 80),
(2222, 60, 105),
(2223, 60, 11),
(2224, 60, 73),
(2225, 60, 76),
(2226, 60, 85),
(2227, 60, 106),
(2228, 60, 123),
(2229, 60, 74),
(2230, 60, 77),
(2232, 60, 93),
(2233, 60, 107),
(2234, 60, 72),
(2235, 60, 89),
(2236, 60, 70),
(2237, 60, 84),
(2239, 60, 92),
(2240, 60, 7),
(2244, 50, 175),
(2248, 43, 175),
(2255, 51, 175),
(2256, 52, 175),
(2262, 58, 175),
(2263, 59, 175),
(2264, 60, 175),
(2265, 61, 175),
(2266, 62, 175),
(2267, 63, 175),
(2272, 1, 175),
(2273, 50, 176),
(2277, 43, 176),
(2284, 51, 176),
(2285, 52, 176),
(2291, 58, 176),
(2292, 59, 176),
(2293, 60, 176),
(2294, 61, 176),
(2295, 62, 176),
(2296, 63, 176),
(2301, 1, 176),
(2302, 50, 113),
(2306, 43, 113),
(2313, 51, 113),
(2314, 52, 113),
(2320, 58, 113),
(2321, 59, 113),
(2322, 60, 113),
(2323, 61, 113),
(2324, 62, 113),
(2325, 63, 113),
(2329, 1, 113),
(2351, 1, 20),
(2354, 1, 171),
(2360, 58, 6),
(2361, 59, 6),
(2362, 60, 6),
(2363, 61, 6),
(2364, 62, 6),
(2365, 63, 6),
(2369, 1, 6),
(2376, 1, 87),
(2377, 50, 78),
(2381, 43, 78),
(2388, 51, 78),
(2389, 52, 78),
(2395, 58, 78),
(2396, 59, 78),
(2397, 60, 78),
(2398, 61, 78),
(2399, 62, 78),
(2400, 63, 78),
(2404, 1, 78),
(2406, 50, 187),
(2410, 43, 187),
(2417, 51, 187),
(2418, 52, 187),
(2424, 58, 187),
(2425, 59, 187),
(2426, 60, 187),
(2427, 61, 187),
(2428, 62, 187),
(2429, 63, 187),
(2433, 1, 187),
(2524, 1, 190),
(2526, 1, 192),
(2527, 50, 188),
(2531, 43, 188),
(2538, 51, 188),
(2539, 52, 188),
(2545, 58, 188),
(2546, 59, 188),
(2547, 60, 188),
(2548, 61, 188),
(2549, 62, 188),
(2550, 63, 188),
(2554, 1, 188),
(2555, 50, 189),
(2559, 43, 189),
(2566, 51, 189),
(2567, 52, 189),
(2573, 58, 189),
(2574, 59, 189),
(2575, 60, 189),
(2576, 61, 189),
(2577, 62, 189),
(2578, 63, 189),
(2582, 1, 189),
(2589, 1, 98),
(2683, 50, 219),
(2687, 43, 219),
(2694, 51, 219),
(2695, 52, 219),
(2701, 58, 219),
(2702, 59, 219),
(2703, 60, 219),
(2704, 61, 219),
(2705, 62, 219),
(2706, 63, 219),
(2710, 1, 219),
(2712, 1, 209),
(2714, 1, 210),
(2716, 1, 211),
(2718, 1, 196),
(2720, 1, 194),
(2722, 1, 195),
(2724, 1, 220),
(2726, 1, 203),
(2728, 1, 204),
(2730, 1, 145),
(2732, 1, 146),
(2734, 1, 200),
(2736, 1, 118),
(2738, 1, 119),
(2740, 1, 121),
(2742, 1, 122),
(2744, 1, 124),
(2746, 1, 147),
(2748, 1, 120),
(2750, 1, 148),
(2752, 1, 202),
(2754, 1, 126),
(2756, 1, 191),
(2758, 1, 111),
(2760, 1, 96),
(2762, 1, 97),
(2764, 1, 129),
(2766, 1, 127),
(2768, 1, 128),
(2770, 1, 172),
(2772, 1, 173),
(2774, 1, 174),
(2776, 1, 135),
(2778, 1, 201),
(2779, 57, 75),
(2780, 57, 176),
(2781, 57, 6),
(2782, 57, 71),
(2783, 57, 78),
(2784, 57, 82),
(2785, 57, 105),
(2786, 57, 113),
(2787, 57, 219),
(2788, 57, 73),
(2789, 57, 76),
(2790, 57, 80),
(2791, 57, 85),
(2792, 57, 106),
(2793, 57, 123),
(2794, 57, 187),
(2795, 57, 11),
(2796, 57, 74),
(2797, 57, 77),
(2798, 57, 93),
(2799, 57, 107),
(2800, 57, 188),
(2801, 57, 72),
(2802, 57, 89),
(2803, 57, 189),
(2804, 57, 84),
(2805, 57, 70),
(2806, 57, 92),
(2807, 57, 7),
(2808, 57, 175),
(2809, 56, 75),
(2810, 56, 176),
(2811, 56, 6),
(2812, 56, 71),
(2813, 56, 78),
(2814, 56, 82),
(2815, 56, 105),
(2816, 56, 113),
(2817, 56, 219),
(2818, 56, 73),
(2819, 56, 76),
(2820, 56, 80),
(2821, 56, 85),
(2822, 56, 106),
(2823, 56, 123),
(2824, 56, 187),
(2825, 56, 11),
(2826, 56, 74),
(2827, 56, 77),
(2828, 56, 93),
(2829, 56, 107),
(2830, 56, 188),
(2831, 56, 72),
(2832, 56, 89),
(2833, 56, 189),
(2834, 56, 84),
(2835, 56, 70),
(2836, 56, 92),
(2837, 56, 7),
(2838, 56, 175),
(2839, 55, 176),
(2840, 55, 78),
(2841, 55, 82),
(2842, 55, 105),
(2843, 55, 113),
(2844, 55, 219),
(2845, 55, 73),
(2846, 55, 80),
(2847, 55, 85),
(2848, 55, 106),
(2849, 55, 123),
(2850, 55, 187),
(2851, 55, 11),
(2852, 55, 74),
(2853, 55, 93),
(2854, 55, 107),
(2855, 55, 188),
(2856, 55, 72),
(2857, 55, 89),
(2858, 55, 189),
(2859, 55, 84),
(2860, 55, 92),
(2861, 55, 175),
(2862, 54, 176),
(2863, 54, 78),
(2864, 54, 82),
(2865, 54, 105),
(2866, 54, 113),
(2867, 54, 219),
(2868, 54, 73),
(2869, 54, 80),
(2870, 54, 85),
(2871, 54, 106),
(2872, 54, 123),
(2873, 54, 187),
(2874, 54, 11),
(2875, 54, 74),
(2876, 54, 93),
(2877, 54, 107),
(2878, 54, 188),
(2879, 54, 72),
(2880, 54, 89),
(2881, 54, 189),
(2882, 54, 84),
(2883, 54, 92),
(2884, 54, 175),
(2885, 53, 176),
(2886, 53, 78),
(2887, 53, 82),
(2888, 53, 105),
(2889, 53, 113),
(2890, 53, 219),
(2891, 53, 73),
(2892, 53, 80),
(2893, 53, 85),
(2894, 53, 106),
(2895, 53, 123),
(2896, 53, 187),
(2897, 53, 11),
(2898, 53, 74),
(2899, 53, 93),
(2900, 53, 107),
(2901, 53, 188),
(2902, 53, 72),
(2903, 53, 89),
(2904, 53, 189),
(2905, 53, 84),
(2906, 53, 92),
(2907, 53, 175),
(2952, 44, 176),
(2953, 44, 78),
(2954, 44, 82),
(2955, 44, 105),
(2956, 44, 113),
(2957, 44, 219),
(2958, 44, 73),
(2959, 44, 80),
(2960, 44, 85),
(2961, 44, 106),
(2962, 44, 123),
(2963, 44, 187),
(2964, 44, 11),
(2965, 44, 74),
(2966, 44, 93),
(2967, 44, 107),
(2968, 44, 188),
(2969, 44, 72),
(2970, 44, 89),
(2971, 44, 189),
(2972, 44, 92),
(2973, 44, 175),
(2974, 47, 176),
(2975, 47, 78),
(2976, 47, 82),
(2977, 47, 105),
(2978, 47, 113),
(2979, 47, 219),
(2980, 47, 73),
(2981, 47, 80),
(2982, 47, 85),
(2983, 47, 106),
(2984, 47, 123),
(2985, 47, 187),
(2986, 47, 11),
(2987, 47, 74),
(2988, 47, 93),
(2989, 47, 107),
(2990, 47, 188),
(2991, 47, 72),
(2992, 47, 89),
(2993, 47, 189),
(2994, 47, 92),
(2995, 47, 175),
(2996, 46, 176),
(2997, 46, 78),
(2998, 46, 82),
(2999, 46, 105),
(3000, 46, 113),
(3001, 46, 219),
(3002, 46, 73),
(3003, 46, 80),
(3004, 46, 85),
(3005, 46, 106),
(3006, 46, 123),
(3007, 46, 187),
(3008, 46, 11),
(3009, 46, 74),
(3010, 46, 93),
(3011, 46, 107),
(3012, 46, 188),
(3013, 46, 72),
(3014, 46, 89),
(3015, 46, 189),
(3016, 46, 92),
(3017, 46, 175),
(3018, 45, 176),
(3019, 45, 78),
(3020, 45, 82),
(3021, 45, 105),
(3022, 45, 113),
(3023, 45, 219),
(3024, 45, 73),
(3025, 45, 80),
(3026, 45, 85),
(3027, 45, 106),
(3028, 45, 123),
(3029, 45, 187),
(3030, 45, 11),
(3031, 45, 74),
(3032, 45, 93),
(3033, 45, 107),
(3034, 45, 188),
(3035, 45, 72),
(3036, 45, 89),
(3037, 45, 189),
(3038, 45, 92),
(3039, 45, 175),
(3040, 48, 176),
(3041, 48, 78),
(3042, 48, 82),
(3043, 48, 105),
(3044, 48, 113),
(3045, 48, 219),
(3046, 48, 73),
(3047, 48, 80),
(3048, 48, 85),
(3049, 48, 106),
(3050, 48, 123),
(3051, 48, 187),
(3052, 48, 11),
(3053, 48, 74),
(3054, 48, 93),
(3055, 48, 107),
(3056, 48, 188),
(3057, 48, 72),
(3058, 48, 89),
(3059, 48, 189),
(3060, 48, 92),
(3061, 48, 175),
(3062, 49, 176),
(3063, 49, 78),
(3064, 49, 82),
(3065, 49, 105),
(3066, 49, 113),
(3067, 49, 219),
(3068, 49, 73),
(3069, 49, 80),
(3070, 49, 85),
(3071, 49, 106),
(3072, 49, 123),
(3073, 49, 187),
(3074, 49, 11),
(3075, 49, 74),
(3076, 49, 93),
(3077, 49, 107),
(3078, 49, 188),
(3079, 49, 72),
(3080, 49, 89),
(3081, 49, 189),
(3082, 49, 92),
(3083, 49, 175);

-- --------------------------------------------------------

--
-- Table structure for table `rankcategory`
--

DROP TABLE IF EXISTS `rankcategory`;
CREATE TABLE `rankcategory` (
  `rankcategory_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageurl` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `ordernum` int(11) NOT NULL,
  `hidecat` int(11) NOT NULL,
  `useimage` int(1) NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `imagewidth` int(11) NOT NULL,
  `imageheight` int(11) NOT NULL,
  `color` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rankcategory`
--

INSERT INTO `rankcategory` (`rankcategory_id`, `name`, `imageurl`, `ordernum`, `hidecat`, `useimage`, `description`, `imagewidth`, `imageheight`, `color`) VALUES
(6, 'Officers', '', 3, 0, 0, '', 0, 0, '#048500'),
(7, 'Warrant Officers', '', 2, 0, 0, '', 0, 0, '#67A300'),
(8, 'Enlisted', '', 1, 0, 0, '', 0, 0, '#4A2000');

-- --------------------------------------------------------

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
CREATE TABLE `ranks` (
  `rank_id` int(11) NOT NULL,
  `rankcategory_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `imageurl` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `imagewidth` int(11) NOT NULL,
  `imageheight` int(11) NOT NULL,
  `ordernum` int(11) NOT NULL,
  `autodays` int(11) NOT NULL,
  `hiderank` int(11) NOT NULL,
  `promotepower` int(11) NOT NULL,
  `autodisable` int(11) NOT NULL,
  `color` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ranks`
--

INSERT INTO `ranks` (`rank_id`, `rankcategory_id`, `name`, `description`, `imageurl`, `imagewidth`, `imageheight`, `ordernum`, `autodays`, `hiderank`, `promotepower`, `autodisable`, `color`) VALUES
(1, 3, 'Administrator', '', '', 0, 0, 1, 0, 1, 0, 0, '#7FFF00'),
(43, 8, 'Recruit', 'Starting Rank', 'images/ranks/rank_4fa58088a6a9d.png', 50, 75, 2, 0, 0, 0, 0, '#00EAFF'),
(44, 8, 'Private', '3 days in clan.', 'images/ranks/rank_5813acce2c6be.png', 100, 100, 3, 3, 0, 0, 0, '#ffffff'),
(45, 8, 'Private First Class', '7 days in clan.', 'images/ranks/rank_5813ae3705141.png', 100, 100, 4, 7, 0, 0, 0, '#ffffff'),
(46, 8, 'Corporal', '', 'images/ranks/rank_5813adc75873f.png', 100, 100, 5, 14, 0, 0, 0, '#ffffff'),
(47, 8, 'Sergeant', '21 days in the clan.', 'images/ranks/rank_5813ad955b684.png', 100, 100, 7, 21, 0, 0, 0, '#ffffff'),
(48, 8, 'Staff Sergeant', '', 'images/ranks/rank_5813ae6e9cdb1.png', 100, 100, 8, 28, 0, 0, 0, '#ffffff'),
(49, 8, 'Sergeant 1st Class (E-7 SFC)', '35 days in the clan.', 'images/ranks/rank_5813aeb70c02b.png', 50, 75, 9, 35, 0, 0, 0, '#ffffff'),
(50, 8, 'Master Sergeant', '42 days in the clan.', 'images/ranks/rank_4fa5ecc2638ee.png', 50, 75, 10, 42, 0, 0, 0, '#ffffff'),
(51, 8, '1st Sergeant', '49 days in the clan.', 'images/ranks/rank_4fa5ed08200bc.png', 50, 75, 11, 49, 0, 0, 0, '#ffffff'),
(52, 8, 'Sergeant Major', '56 days in the clan.', 'images/ranks/rank_4fa5ed82cb573.png', 50, 75, 12, 56, 0, 0, 0, '#ffffff'),
(53, 7, 'Warrant Officer 1', 'Promoted by 2nd Lieutanent or Higher.', 'images/ranks/rank_4fa5f1e607f8a.png', 50, 75, 13, 0, 0, 0, 0, '#ffffff'),
(54, 7, 'Chief Warrant Officer 2', 'Promoted by 2nd Lieutanent or Higher.', 'images/ranks/rank_4fa5f35316e43.png', 50, 75, 14, 0, 0, 0, 0, '#ffffff'),
(55, 7, 'Chief Warrant Officer 3', 'Promoted by 2nd Lieutanent or Higher.', 'images/ranks/rank_4fa5f37660647.png', 50, 75, 15, 0, 0, 0, 0, '#ffffff'),
(56, 7, 'Chief Warrant Officer 4', 'Promoted by 1st Lieutanent or Higher.', 'images/ranks/rank_4fa5f3d842b99.png', 50, 75, 16, 0, 0, 52, 0, '#ffffff'),
(57, 7, 'Chief Warrant Officer 5', 'Promoted by 1st Lieutanent or Higher.', 'images/ranks/rank_4fa5f407bba12.png', 50, 75, 17, 0, 0, 52, 0, '#ffffff'),
(58, 6, '2nd Lieutenant', 'Promoted by Captain or Higher.', 'images/ranks/rank_4fa5f51b9c48c.png', 50, 75, 18, 0, 0, 55, 0, '#ffffff'),
(59, 6, '1st Lieutenant', 'Promoted by Captain or Higher.', 'images/ranks/rank_4fa5f54c265ce.png', 50, 75, 19, 0, 0, 57, 0, '#ffffff'),
(60, 6, 'Captain', 'Promoted by Colonel or Higher.', 'images/ranks/rank_4fa5f5ddbca9a.png', 50, 75, 20, 0, 0, 59, 0, '#ffffff'),
(61, 6, 'Major', 'Promoted by Colonel or Higher.', 'images/ranks/rank_4fa5f614eabf2.png', 50, 75, 21, 0, 0, 59, 0, '#FF6F00'),
(62, 6, 'Lieutenant Colonel', 'Promoted by Colonel or Higher.', 'images/ranks/rank_517e084db9628.png', 50, 75, 22, 0, 0, 59, 0, '#ffffff'),
(63, 6, 'Colonel', 'Promoted by Brigadier General or Higher.', 'images/ranks/rank_517e0842d66f0.png', 50, 75, 23, 0, 0, 62, 0, '#ffffff'),
(67, 8, 'Specialist', '', 'images/ranks/rank_58139e84c17ba.png', 100, 100, 6, 0, 0, 0, 0, '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `social`
--

DROP TABLE IF EXISTS `social`;
CREATE TABLE `social` (
  `social_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` text COLLATE utf8_unicode_ci NOT NULL,
  `iconwidth` int(11) NOT NULL,
  `iconheight` int(11) NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `tooltip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ordernum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `social`
--

INSERT INTO `social` (`social_id`, `name`, `icon`, `iconwidth`, `iconheight`, `url`, `tooltip`, `ordernum`) VALUES
(1, 'Facebook', 'images/socialmedia/facebook.png', 24, 24, '', 'Entire entire Facebook URL.', 4),
(2, 'Twitter', 'images/socialmedia/twitter.png', 24, 24, 'http://www.twitter.com/', 'Enter your Twitter username.', 3),
(3, 'Youtube', 'images/socialmedia/youtube.png', 24, 24, 'http://youtube.com/', 'Enter your Youtube username.', 2),
(4, 'Google Plus', 'images/socialmedia/googleplus.png', 24, 24, '', 'Enter entire Google Plus URL.', 1),
(19, 'Twitch', 'plugins/twitch/images/twitch.png', 24, 24, 'http://twitch.tv/', 'Enter your Twitch username', 5);

-- --------------------------------------------------------

--
-- Table structure for table `social_members`
--

DROP TABLE IF EXISTS `social_members`;
CREATE TABLE `social_members` (
  `socialmember_id` int(11) NOT NULL,
  `social_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `social_members`
--

INSERT INTO `social_members` (`socialmember_id`, `social_id`, `member_id`, `value`) VALUES
(1, 19, 4, ''),
(2, 1, 4, ''),
(3, 2, 4, ''),
(4, 3, 4, 'https://www.youtube.com/channel/UCPsHKX7R30CHqLFPerj1mkg'),
(5, 4, 4, ''),
(6, 19, 8, ''),
(7, 1, 8, ''),
(8, 2, 8, ''),
(9, 3, 8, ''),
(10, 4, 8, '');

-- --------------------------------------------------------

--
-- Table structure for table `squadapps`
--

DROP TABLE IF EXISTS `squadapps`;
CREATE TABLE `squadapps` (
  `squadapp_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `squad_id` int(11) NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `applydate` int(11) NOT NULL,
  `dateaction` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `squadmember_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `squadinvites`
--

DROP TABLE IF EXISTS `squadinvites`;
CREATE TABLE `squadinvites` (
  `squadinvite_id` int(11) NOT NULL,
  `squad_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `datesent` int(11) NOT NULL,
  `dateaction` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `startingrank_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `squadnews`
--

DROP TABLE IF EXISTS `squadnews`;
CREATE TABLE `squadnews` (
  `squadnews_id` int(11) NOT NULL,
  `squad_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `newstype` int(11) NOT NULL,
  `dateposted` int(11) NOT NULL,
  `postsubject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `newspost` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `lasteditmember_id` int(11) NOT NULL,
  `lasteditdate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `squadranks`
--

DROP TABLE IF EXISTS `squadranks`;
CREATE TABLE `squadranks` (
  `squadrank_id` int(11) NOT NULL,
  `squad_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortnum` int(11) NOT NULL,
  `postnews` int(11) NOT NULL,
  `managenews` int(11) NOT NULL,
  `postshoutbox` int(11) NOT NULL,
  `manageshoutbox` int(11) NOT NULL,
  `addrank` int(11) NOT NULL,
  `manageranks` int(11) NOT NULL,
  `editprofile` int(11) NOT NULL,
  `sendinvites` int(11) NOT NULL,
  `acceptapps` int(11) NOT NULL,
  `setrank` int(11) NOT NULL,
  `removemember` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `squads`
--

DROP TABLE IF EXISTS `squads`;
CREATE TABLE `squads` (
  `squad_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `logourl` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `recruitingstatus` int(11) NOT NULL,
  `datecreated` int(11) NOT NULL,
  `privateshoutbox` int(11) NOT NULL,
  `website` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `squads_members`
--

DROP TABLE IF EXISTS `squads_members`;
CREATE TABLE `squads_members` (
  `squadmember_id` int(11) NOT NULL,
  `squad_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `squadrank_id` int(11) NOT NULL,
  `datejoined` int(11) NOT NULL,
  `lastpromotion` int(11) NOT NULL,
  `lastdemotion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tableupdates`
--

DROP TABLE IF EXISTS `tableupdates`;
CREATE TABLE `tableupdates` (
  `tableupdate_id` int(11) NOT NULL,
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updatetime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tableupdates`
--

INSERT INTO `tableupdates` (`tableupdate_id`, `tablename`, `updatetime`) VALUES
(1, 'websiteinfo', 1477686530),
(2, 'hitcounter', 1477687143),
(3, 'app_captcha', 1477686417),
(4, 'memberapps', 1477686458),
(5, 'notifications', 1477686458),
(6, 'members', 1477686458),
(7, 'gamesplayed', 1477527169),
(8, 'news', 1477685034),
(9, 'menuitem_link', 1477684261),
(10, 'menu_item', 1477684262),
(11, 'poll_votes', 1477687097),
(12, 'profileoptions_values', 1477685670),
(13, 'social_members', 1477685670),
(14, 'gamesplayed_members', 1477685670),
(15, 'ranks', 1477684919),
(16, 'rank_privileges', 1477684919),
(17, 'forum_category', 1477682010),
(18, 'forum_board', 1477682071),
(19, 'logs', 1477683197),
(20, 'rankcategory', 1477684360),
(21, 'failban', 1477686305);

-- --------------------------------------------------------

--
-- Table structure for table `tournament_managers`
--

DROP TABLE IF EXISTS `tournament_managers`;
CREATE TABLE `tournament_managers` (
  `tournamentmanager_id` int(11) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tournament_reminder`
--

DROP TABLE IF EXISTS `tournament_reminder`;
CREATE TABLE `tournament_reminder` (
  `tournamentreminder_id` int(11) NOT NULL,
  `emailnotificationqueue_id` int(11) NOT NULL,
  `tournament_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tournamentmatch`
--

DROP TABLE IF EXISTS `tournamentmatch`;
CREATE TABLE `tournamentmatch` (
  `tournamentmatch_id` int(11) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  `round` int(11) NOT NULL,
  `team1_id` int(11) NOT NULL,
  `team2_id` int(11) NOT NULL,
  `team1score` int(11) NOT NULL,
  `team2score` int(11) NOT NULL,
  `outcome` int(11) NOT NULL,
  `replayteam1url` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `replayteam2url` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `adminreplayurl` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `team1approve` int(11) NOT NULL,
  `team2approve` int(11) NOT NULL,
  `nextmatch_id` int(11) NOT NULL,
  `sortnum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tournamentplayers`
--

DROP TABLE IF EXISTS `tournamentplayers`;
CREATE TABLE `tournamentplayers` (
  `tournamentplayer_id` int(11) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `displayname` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tournamentpools`
--

DROP TABLE IF EXISTS `tournamentpools`;
CREATE TABLE `tournamentpools` (
  `tournamentpool_id` int(11) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  `finished` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tournamentpools_teams`
--

DROP TABLE IF EXISTS `tournamentpools_teams`;
CREATE TABLE `tournamentpools_teams` (
  `poolteam_id` int(11) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  `pool_id` int(11) NOT NULL,
  `team1_id` int(11) NOT NULL,
  `team2_id` int(11) NOT NULL,
  `team1score` int(11) NOT NULL,
  `team2score` int(11) NOT NULL,
  `team1approve` int(1) NOT NULL,
  `team2approve` int(1) NOT NULL,
  `replayteam1url` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `replayteam2url` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `winner` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tournaments`
--

DROP TABLE IF EXISTS `tournaments`;
CREATE TABLE `tournaments` (
  `tournament_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `gamesplayed_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seedtype` int(11) NOT NULL,
  `startdate` int(11) NOT NULL,
  `timezone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `eliminations` int(11) NOT NULL,
  `playersperteam` int(11) NOT NULL,
  `maxteams` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `requirereplay` int(10) NOT NULL,
  `access` int(11) NOT NULL,
  `imageurl` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tournamentteams`
--

DROP TABLE IF EXISTS `tournamentteams`;
CREATE TABLE `tournamentteams` (
  `tournamentteam_id` int(11) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `websiteinfo`
--

DROP TABLE IF EXISTS `websiteinfo`;
CREATE TABLE `websiteinfo` (
  `websiteinfo_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `websiteinfo`
--

INSERT INTO `websiteinfo` (`websiteinfo_id`, `name`, `value`) VALUES
(1, 'clanname', '9th Special Forces Group'),
(2, 'clantag', '[9SFG]'),
(3, 'preventhack', '5555'),
(4, 'maxdsl', '0'),
(5, 'theme', 'ribboncamo'),
(6, 'lowdsl', '#00FF00'),
(7, 'meddsl', '#FFFF52'),
(8, 'highdsl', '#F75B5B'),
(9, 'logourl', 'images/logo.png'),
(10, 'forumurl', 'http://localhost/cs4git/forum'),
(11, 'failedlogins', '8'),
(12, 'maxdiplomacy', '10'),
(13, 'mostonline', '4'),
(14, 'mostonlinedate', '1477685646'),
(15, 'memberregistration', '0'),
(16, 'memberapproval', '0'),
(17, 'medalorder', '1'),
(18, 'newsticker', 'Welcome to the Site!'),
(19, 'newstickercolor', '#000000'),
(20, 'newstickersize', '14'),
(21, 'newstickerbold', ''),
(22, 'newstickeritalic', ''),
(23, 'debugmode', '0'),
(24, 'privateforum', '0'),
(25, 'privateprofile', '0'),
(26, 'updatemenu', '1399187245'),
(27, 'hpimagetype', 'slider'),
(28, 'hpimagewidth', '600'),
(29, 'hpimageheight', '400'),
(30, 'hpimagewidthunit', 'px'),
(31, 'hpimageheightunit', 'px'),
(32, 'forum_showmedal', '1'),
(33, 'forum_medalcount', '5'),
(34, 'forum_medalwidth', '50'),
(35, 'forum_medalheight', '13'),
(36, 'forum_medalwidthunit', 'px'),
(37, 'forum_medalheightunit', 'px'),
(38, 'forum_showrank', '1'),
(39, 'forum_rankwidth', '50'),
(40, 'forum_rankheight', '75'),
(41, 'forum_rankwidthunit', 'px'),
(42, 'forum_rankheightunit', 'px'),
(43, 'forum_postsperpage', '0'),
(44, 'forum_topicsperpage', '0'),
(45, 'forum_imagewidth', '500'),
(46, 'forum_imageheight', '500'),
(47, 'forum_sigwidth', '500'),
(48, 'forum_sigheight', '150'),
(49, 'forum_imagewidthunit', 'px'),
(50, 'forum_imageheightunit', 'px'),
(51, 'forum_sigwidthunit', 'px'),
(52, 'forum_sigheightunit', 'px'),
(53, 'forum_linkimages', '1'),
(54, 'forum_hidesignatures', ''),
(55, 'forum_avatarwidth', '50'),
(56, 'forum_avatarheight', '50'),
(57, 'forum_avatarwidthunit', 'px'),
(58, 'forum_avatarheightunit', 'px'),
(59, 'hideinactive', '0'),
(60, 'hpnews', '0'),
(61, 'sortnum', '0'),
(62, 'news_postsperpage', '10'),
(63, 'default_timezone', 'America/New_York'),
(64, 'date_format', 'l, F j, Y'),
(65, 'display_date', '1'),
(66, 'emailqueue_lastsent', '1477686530'),
(67, 'forum_newindicator', '5'),
(68, 'emailqueue_delay', '30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_captcha`
--
ALTER TABLE `app_captcha`
  ADD PRIMARY KEY (`appcaptcha_id`);

--
-- Indexes for table `app_components`
--
ALTER TABLE `app_components`
  ADD PRIMARY KEY (`appcomponent_id`);

--
-- Indexes for table `app_selectvalues`
--
ALTER TABLE `app_selectvalues`
  ADD PRIMARY KEY (`appselectvalue_id`);

--
-- Indexes for table `app_values`
--
ALTER TABLE `app_values`
  ADD PRIMARY KEY (`appvalue_id`);

--
-- Indexes for table `clocks`
--
ALTER TABLE `clocks`
  ADD PRIMARY KEY (`clock_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `console`
--
ALTER TABLE `console`
  ADD PRIMARY KEY (`console_id`);

--
-- Indexes for table `console_members`
--
ALTER TABLE `console_members`
  ADD PRIMARY KEY (`privilege_id`);

--
-- Indexes for table `consolecategory`
--
ALTER TABLE `consolecategory`
  ADD PRIMARY KEY (`consolecategory_id`);

--
-- Indexes for table `customform`
--
ALTER TABLE `customform`
  ADD PRIMARY KEY (`customform_id`);

--
-- Indexes for table `customform_components`
--
ALTER TABLE `customform_components`
  ADD PRIMARY KEY (`component_id`);

--
-- Indexes for table `customform_selectvalues`
--
ALTER TABLE `customform_selectvalues`
  ADD PRIMARY KEY (`selectvalue_id`);

--
-- Indexes for table `customform_submission`
--
ALTER TABLE `customform_submission`
  ADD PRIMARY KEY (`submission_id`);

--
-- Indexes for table `customform_values`
--
ALTER TABLE `customform_values`
  ADD PRIMARY KEY (`value_id`);

--
-- Indexes for table `custompages`
--
ALTER TABLE `custompages`
  ADD PRIMARY KEY (`custompage_id`);

--
-- Indexes for table `diplomacy`
--
ALTER TABLE `diplomacy`
  ADD PRIMARY KEY (`diplomacy_id`);

--
-- Indexes for table `diplomacy_request`
--
ALTER TABLE `diplomacy_request`
  ADD PRIMARY KEY (`diplomacyrequest_id`);

--
-- Indexes for table `diplomacy_status`
--
ALTER TABLE `diplomacy_status`
  ADD PRIMARY KEY (`diplomacystatus_id`);

--
-- Indexes for table `download_extensions`
--
ALTER TABLE `download_extensions`
  ADD PRIMARY KEY (`extension_id`);

--
-- Indexes for table `downloadcategory`
--
ALTER TABLE `downloadcategory`
  ADD PRIMARY KEY (`downloadcategory_id`);

--
-- Indexes for table `downloads`
--
ALTER TABLE `downloads`
  ADD PRIMARY KEY (`download_id`);

--
-- Indexes for table `emailnotifications_queue`
--
ALTER TABLE `emailnotifications_queue`
  ADD PRIMARY KEY (`emailnotificationsqueue_id`);

--
-- Indexes for table `emailnotifications_settings`
--
ALTER TABLE `emailnotifications_settings`
  ADD PRIMARY KEY (`emailnotificationsetting_id`),
  ADD UNIQUE KEY `member_id` (`member_id`);

--
-- Indexes for table `event_reminder`
--
ALTER TABLE `event_reminder`
  ADD PRIMARY KEY (`eventreminder_id`);

--
-- Indexes for table `eventchat`
--
ALTER TABLE `eventchat`
  ADD PRIMARY KEY (`eventchat_id`);

--
-- Indexes for table `eventchat_messages`
--
ALTER TABLE `eventchat_messages`
  ADD PRIMARY KEY (`eventchatmessage_id`);

--
-- Indexes for table `eventchat_roomlist`
--
ALTER TABLE `eventchat_roomlist`
  ADD PRIMARY KEY (`eventchatlist_id`);

--
-- Indexes for table `eventmessage_comment`
--
ALTER TABLE `eventmessage_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `eventmessages`
--
ALTER TABLE `eventmessages`
  ADD PRIMARY KEY (`eventmessage_id`);

--
-- Indexes for table `eventpositions`
--
ALTER TABLE `eventpositions`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `events_members`
--
ALTER TABLE `events_members`
  ADD PRIMARY KEY (`eventmember_id`);

--
-- Indexes for table `failban`
--
ALTER TABLE `failban`
  ADD PRIMARY KEY (`failban_id`);

--
-- Indexes for table `forgotpass`
--
ALTER TABLE `forgotpass`
  ADD PRIMARY KEY (`rqid`);

--
-- Indexes for table `forum_attachments`
--
ALTER TABLE `forum_attachments`
  ADD PRIMARY KEY (`forumattachment_id`);

--
-- Indexes for table `forum_board`
--
ALTER TABLE `forum_board`
  ADD PRIMARY KEY (`forumboard_id`);

--
-- Indexes for table `forum_category`
--
ALTER TABLE `forum_category`
  ADD PRIMARY KEY (`forumcategory_id`);

--
-- Indexes for table `forum_memberaccess`
--
ALTER TABLE `forum_memberaccess`
  ADD PRIMARY KEY (`forummemberaccess_id`);

--
-- Indexes for table `forum_moderator`
--
ALTER TABLE `forum_moderator`
  ADD PRIMARY KEY (`forummoderator_id`);

--
-- Indexes for table `forum_post`
--
ALTER TABLE `forum_post`
  ADD PRIMARY KEY (`forumpost_id`);

--
-- Indexes for table `forum_rankaccess`
--
ALTER TABLE `forum_rankaccess`
  ADD PRIMARY KEY (`forumrankaccess_id`);

--
-- Indexes for table `forum_topic`
--
ALTER TABLE `forum_topic`
  ADD PRIMARY KEY (`forumtopic_id`);

--
-- Indexes for table `forum_topicseen`
--
ALTER TABLE `forum_topicseen`
  ADD PRIMARY KEY (`forumtopicseen_id`);

--
-- Indexes for table `freezemedals_members`
--
ALTER TABLE `freezemedals_members`
  ADD PRIMARY KEY (`freezemedal_id`);

--
-- Indexes for table `gamesplayed`
--
ALTER TABLE `gamesplayed`
  ADD PRIMARY KEY (`gamesplayed_id`);

--
-- Indexes for table `gamesplayed_members`
--
ALTER TABLE `gamesplayed_members`
  ADD PRIMARY KEY (`gamemember_id`);

--
-- Indexes for table `gamestats`
--
ALTER TABLE `gamestats`
  ADD PRIMARY KEY (`gamestats_id`);

--
-- Indexes for table `gamestats_members`
--
ALTER TABLE `gamestats_members`
  ADD PRIMARY KEY (`gamestatmember_id`);

--
-- Indexes for table `hitcounter`
--
ALTER TABLE `hitcounter`
  ADD PRIMARY KEY (`hit_id`);

--
-- Indexes for table `iarequest`
--
ALTER TABLE `iarequest`
  ADD PRIMARY KEY (`iarequest_id`);

--
-- Indexes for table `iarequest_messages`
--
ALTER TABLE `iarequest_messages`
  ADD PRIMARY KEY (`iamessage_id`);

--
-- Indexes for table `imageslider`
--
ALTER TABLE `imageslider`
  ADD PRIMARY KEY (`imageslider_id`);

--
-- Indexes for table `ipban`
--
ALTER TABLE `ipban`
  ADD PRIMARY KEY (`ipban_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `medals`
--
ALTER TABLE `medals`
  ADD PRIMARY KEY (`medal_id`);

--
-- Indexes for table `medals_members`
--
ALTER TABLE `medals_members`
  ADD PRIMARY KEY (`medalmember_id`);

--
-- Indexes for table `memberapps`
--
ALTER TABLE `memberapps`
  ADD PRIMARY KEY (`memberapp_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `membersonlypage`
--
ALTER TABLE `membersonlypage`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `menu_category`
--
ALTER TABLE `menu_category`
  ADD PRIMARY KEY (`menucategory_id`);

--
-- Indexes for table `menu_item`
--
ALTER TABLE `menu_item`
  ADD PRIMARY KEY (`menuitem_id`);

--
-- Indexes for table `menuitem_customblock`
--
ALTER TABLE `menuitem_customblock`
  ADD PRIMARY KEY (`menucustomblock_id`);

--
-- Indexes for table `menuitem_custompage`
--
ALTER TABLE `menuitem_custompage`
  ADD PRIMARY KEY (`menucustompage_id`);

--
-- Indexes for table `menuitem_image`
--
ALTER TABLE `menuitem_image`
  ADD PRIMARY KEY (`menuimage_id`);

--
-- Indexes for table `menuitem_link`
--
ALTER TABLE `menuitem_link`
  ADD PRIMARY KEY (`menulink_id`);

--
-- Indexes for table `menuitem_shoutbox`
--
ALTER TABLE `menuitem_shoutbox`
  ADD PRIMARY KEY (`menushoutbox_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `plugin_config`
--
ALTER TABLE `plugin_config`
  ADD PRIMARY KEY (`pluginconfig_id`);

--
-- Indexes for table `plugin_pages`
--
ALTER TABLE `plugin_pages`
  ADD PRIMARY KEY (`pluginpage_id`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`plugin_id`);

--
-- Indexes for table `poll_memberaccess`
--
ALTER TABLE `poll_memberaccess`
  ADD PRIMARY KEY (`pollmemberaccess_id`);

--
-- Indexes for table `poll_options`
--
ALTER TABLE `poll_options`
  ADD PRIMARY KEY (`polloption_id`);

--
-- Indexes for table `poll_rankaccess`
--
ALTER TABLE `poll_rankaccess`
  ADD PRIMARY KEY (`pollrankaccess_id`);

--
-- Indexes for table `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD PRIMARY KEY (`pollvote_id`);

--
-- Indexes for table `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`poll_id`);

--
-- Indexes for table `privatemessage_folders`
--
ALTER TABLE `privatemessage_folders`
  ADD PRIMARY KEY (`pmfolder_id`);

--
-- Indexes for table `privatemessage_members`
--
ALTER TABLE `privatemessage_members`
  ADD PRIMARY KEY (`pmmember_id`);

--
-- Indexes for table `privatemessages`
--
ALTER TABLE `privatemessages`
  ADD PRIMARY KEY (`pm_id`);

--
-- Indexes for table `profilecategory`
--
ALTER TABLE `profilecategory`
  ADD PRIMARY KEY (`profilecategory_id`);

--
-- Indexes for table `profileoptions`
--
ALTER TABLE `profileoptions`
  ADD PRIMARY KEY (`profileoption_id`);

--
-- Indexes for table `profileoptions_select`
--
ALTER TABLE `profileoptions_select`
  ADD PRIMARY KEY (`selectopt_id`);

--
-- Indexes for table `profileoptions_values`
--
ALTER TABLE `profileoptions_values`
  ADD PRIMARY KEY (`values_id`);

--
-- Indexes for table `rank_privileges`
--
ALTER TABLE `rank_privileges`
  ADD PRIMARY KEY (`privilege_id`);

--
-- Indexes for table `rankcategory`
--
ALTER TABLE `rankcategory`
  ADD PRIMARY KEY (`rankcategory_id`);

--
-- Indexes for table `ranks`
--
ALTER TABLE `ranks`
  ADD PRIMARY KEY (`rank_id`);

--
-- Indexes for table `social`
--
ALTER TABLE `social`
  ADD PRIMARY KEY (`social_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `social_members`
--
ALTER TABLE `social_members`
  ADD PRIMARY KEY (`socialmember_id`);

--
-- Indexes for table `squadapps`
--
ALTER TABLE `squadapps`
  ADD PRIMARY KEY (`squadapp_id`);

--
-- Indexes for table `squadinvites`
--
ALTER TABLE `squadinvites`
  ADD PRIMARY KEY (`squadinvite_id`);

--
-- Indexes for table `squadnews`
--
ALTER TABLE `squadnews`
  ADD PRIMARY KEY (`squadnews_id`);

--
-- Indexes for table `squadranks`
--
ALTER TABLE `squadranks`
  ADD PRIMARY KEY (`squadrank_id`);

--
-- Indexes for table `squads`
--
ALTER TABLE `squads`
  ADD PRIMARY KEY (`squad_id`);

--
-- Indexes for table `squads_members`
--
ALTER TABLE `squads_members`
  ADD PRIMARY KEY (`squadmember_id`);

--
-- Indexes for table `tableupdates`
--
ALTER TABLE `tableupdates`
  ADD PRIMARY KEY (`tableupdate_id`);

--
-- Indexes for table `tournament_managers`
--
ALTER TABLE `tournament_managers`
  ADD PRIMARY KEY (`tournamentmanager_id`);

--
-- Indexes for table `tournament_reminder`
--
ALTER TABLE `tournament_reminder`
  ADD PRIMARY KEY (`tournamentreminder_id`);

--
-- Indexes for table `tournamentmatch`
--
ALTER TABLE `tournamentmatch`
  ADD PRIMARY KEY (`tournamentmatch_id`);

--
-- Indexes for table `tournamentplayers`
--
ALTER TABLE `tournamentplayers`
  ADD PRIMARY KEY (`tournamentplayer_id`);

--
-- Indexes for table `tournamentpools`
--
ALTER TABLE `tournamentpools`
  ADD PRIMARY KEY (`tournamentpool_id`);

--
-- Indexes for table `tournamentpools_teams`
--
ALTER TABLE `tournamentpools_teams`
  ADD PRIMARY KEY (`poolteam_id`);

--
-- Indexes for table `tournaments`
--
ALTER TABLE `tournaments`
  ADD PRIMARY KEY (`tournament_id`);

--
-- Indexes for table `tournamentteams`
--
ALTER TABLE `tournamentteams`
  ADD PRIMARY KEY (`tournamentteam_id`);

--
-- Indexes for table `websiteinfo`
--
ALTER TABLE `websiteinfo`
  ADD PRIMARY KEY (`websiteinfo_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_captcha`
--
ALTER TABLE `app_captcha`
  MODIFY `appcaptcha_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `app_components`
--
ALTER TABLE `app_components`
  MODIFY `appcomponent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;
--
-- AUTO_INCREMENT for table `app_selectvalues`
--
ALTER TABLE `app_selectvalues`
  MODIFY `appselectvalue_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `app_values`
--
ALTER TABLE `app_values`
  MODIFY `appvalue_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `clocks`
--
ALTER TABLE `clocks`
  MODIFY `clock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `console`
--
ALTER TABLE `console`
  MODIFY `console_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;
--
-- AUTO_INCREMENT for table `console_members`
--
ALTER TABLE `console_members`
  MODIFY `privilege_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `consolecategory`
--
ALTER TABLE `consolecategory`
  MODIFY `consolecategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `customform`
--
ALTER TABLE `customform`
  MODIFY `customform_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customform_components`
--
ALTER TABLE `customform_components`
  MODIFY `component_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customform_selectvalues`
--
ALTER TABLE `customform_selectvalues`
  MODIFY `selectvalue_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customform_submission`
--
ALTER TABLE `customform_submission`
  MODIFY `submission_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customform_values`
--
ALTER TABLE `customform_values`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `custompages`
--
ALTER TABLE `custompages`
  MODIFY `custompage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `diplomacy`
--
ALTER TABLE `diplomacy`
  MODIFY `diplomacy_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `diplomacy_request`
--
ALTER TABLE `diplomacy_request`
  MODIFY `diplomacyrequest_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `diplomacy_status`
--
ALTER TABLE `diplomacy_status`
  MODIFY `diplomacystatus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `download_extensions`
--
ALTER TABLE `download_extensions`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `downloadcategory`
--
ALTER TABLE `downloadcategory`
  MODIFY `downloadcategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `downloads`
--
ALTER TABLE `downloads`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `emailnotifications_queue`
--
ALTER TABLE `emailnotifications_queue`
  MODIFY `emailnotificationsqueue_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emailnotifications_settings`
--
ALTER TABLE `emailnotifications_settings`
  MODIFY `emailnotificationsetting_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_reminder`
--
ALTER TABLE `event_reminder`
  MODIFY `eventreminder_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `eventchat`
--
ALTER TABLE `eventchat`
  MODIFY `eventchat_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `eventchat_messages`
--
ALTER TABLE `eventchat_messages`
  MODIFY `eventchatmessage_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `eventchat_roomlist`
--
ALTER TABLE `eventchat_roomlist`
  MODIFY `eventchatlist_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `eventmessage_comment`
--
ALTER TABLE `eventmessage_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `eventmessages`
--
ALTER TABLE `eventmessages`
  MODIFY `eventmessage_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `eventpositions`
--
ALTER TABLE `eventpositions`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `events_members`
--
ALTER TABLE `events_members`
  MODIFY `eventmember_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `failban`
--
ALTER TABLE `failban`
  MODIFY `failban_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `forgotpass`
--
ALTER TABLE `forgotpass`
  MODIFY `rqid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_attachments`
--
ALTER TABLE `forum_attachments`
  MODIFY `forumattachment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_board`
--
ALTER TABLE `forum_board`
  MODIFY `forumboard_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `forum_category`
--
ALTER TABLE `forum_category`
  MODIFY `forumcategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `forum_memberaccess`
--
ALTER TABLE `forum_memberaccess`
  MODIFY `forummemberaccess_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_moderator`
--
ALTER TABLE `forum_moderator`
  MODIFY `forummoderator_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_post`
--
ALTER TABLE `forum_post`
  MODIFY `forumpost_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_rankaccess`
--
ALTER TABLE `forum_rankaccess`
  MODIFY `forumrankaccess_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_topic`
--
ALTER TABLE `forum_topic`
  MODIFY `forumtopic_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_topicseen`
--
ALTER TABLE `forum_topicseen`
  MODIFY `forumtopicseen_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `freezemedals_members`
--
ALTER TABLE `freezemedals_members`
  MODIFY `freezemedal_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gamesplayed`
--
ALTER TABLE `gamesplayed`
  MODIFY `gamesplayed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `gamesplayed_members`
--
ALTER TABLE `gamesplayed_members`
  MODIFY `gamemember_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;
--
-- AUTO_INCREMENT for table `gamestats`
--
ALTER TABLE `gamestats`
  MODIFY `gamestats_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `gamestats_members`
--
ALTER TABLE `gamestats_members`
  MODIFY `gamestatmember_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hitcounter`
--
ALTER TABLE `hitcounter`
  MODIFY `hit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `iarequest`
--
ALTER TABLE `iarequest`
  MODIFY `iarequest_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `iarequest_messages`
--
ALTER TABLE `iarequest_messages`
  MODIFY `iamessage_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `imageslider`
--
ALTER TABLE `imageslider`
  MODIFY `imageslider_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ipban`
--
ALTER TABLE `ipban`
  MODIFY `ipban_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `medals`
--
ALTER TABLE `medals`
  MODIFY `medal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `medals_members`
--
ALTER TABLE `medals_members`
  MODIFY `medalmember_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `memberapps`
--
ALTER TABLE `memberapps`
  MODIFY `memberapp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `membersonlypage`
--
ALTER TABLE `membersonlypage`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu_category`
--
ALTER TABLE `menu_category`
  MODIFY `menucategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `menu_item`
--
ALTER TABLE `menu_item`
  MODIFY `menuitem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `menuitem_customblock`
--
ALTER TABLE `menuitem_customblock`
  MODIFY `menucustomblock_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menuitem_custompage`
--
ALTER TABLE `menuitem_custompage`
  MODIFY `menucustompage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `menuitem_image`
--
ALTER TABLE `menuitem_image`
  MODIFY `menuimage_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menuitem_link`
--
ALTER TABLE `menuitem_link`
  MODIFY `menulink_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `menuitem_shoutbox`
--
ALTER TABLE `menuitem_shoutbox`
  MODIFY `menushoutbox_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `plugin_config`
--
ALTER TABLE `plugin_config`
  MODIFY `pluginconfig_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `plugin_pages`
--
ALTER TABLE `plugin_pages`
  MODIFY `pluginpage_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `plugin_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `poll_memberaccess`
--
ALTER TABLE `poll_memberaccess`
  MODIFY `pollmemberaccess_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `poll_options`
--
ALTER TABLE `poll_options`
  MODIFY `polloption_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `poll_rankaccess`
--
ALTER TABLE `poll_rankaccess`
  MODIFY `pollrankaccess_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `poll_votes`
--
ALTER TABLE `poll_votes`
  MODIFY `pollvote_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `polls`
--
ALTER TABLE `polls`
  MODIFY `poll_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `privatemessage_folders`
--
ALTER TABLE `privatemessage_folders`
  MODIFY `pmfolder_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `privatemessage_members`
--
ALTER TABLE `privatemessage_members`
  MODIFY `pmmember_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `privatemessages`
--
ALTER TABLE `privatemessages`
  MODIFY `pm_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `profilecategory`
--
ALTER TABLE `profilecategory`
  MODIFY `profilecategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `profileoptions`
--
ALTER TABLE `profileoptions`
  MODIFY `profileoption_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `profileoptions_select`
--
ALTER TABLE `profileoptions_select`
  MODIFY `selectopt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `profileoptions_values`
--
ALTER TABLE `profileoptions_values`
  MODIFY `values_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `rank_privileges`
--
ALTER TABLE `rank_privileges`
  MODIFY `privilege_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3084;
--
-- AUTO_INCREMENT for table `rankcategory`
--
ALTER TABLE `rankcategory`
  MODIFY `rankcategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `ranks`
--
ALTER TABLE `ranks`
  MODIFY `rank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `social`
--
ALTER TABLE `social`
  MODIFY `social_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `social_members`
--
ALTER TABLE `social_members`
  MODIFY `socialmember_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `squadapps`
--
ALTER TABLE `squadapps`
  MODIFY `squadapp_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `squadinvites`
--
ALTER TABLE `squadinvites`
  MODIFY `squadinvite_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `squadnews`
--
ALTER TABLE `squadnews`
  MODIFY `squadnews_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `squadranks`
--
ALTER TABLE `squadranks`
  MODIFY `squadrank_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `squads`
--
ALTER TABLE `squads`
  MODIFY `squad_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `squads_members`
--
ALTER TABLE `squads_members`
  MODIFY `squadmember_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tableupdates`
--
ALTER TABLE `tableupdates`
  MODIFY `tableupdate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tournament_managers`
--
ALTER TABLE `tournament_managers`
  MODIFY `tournamentmanager_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tournament_reminder`
--
ALTER TABLE `tournament_reminder`
  MODIFY `tournamentreminder_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tournamentmatch`
--
ALTER TABLE `tournamentmatch`
  MODIFY `tournamentmatch_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tournamentplayers`
--
ALTER TABLE `tournamentplayers`
  MODIFY `tournamentplayer_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tournamentpools`
--
ALTER TABLE `tournamentpools`
  MODIFY `tournamentpool_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tournamentpools_teams`
--
ALTER TABLE `tournamentpools_teams`
  MODIFY `poolteam_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tournaments`
--
ALTER TABLE `tournaments`
  MODIFY `tournament_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tournamentteams`
--
ALTER TABLE `tournamentteams`
  MODIFY `tournamentteam_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `websiteinfo`
--
ALTER TABLE `websiteinfo`
  MODIFY `websiteinfo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
