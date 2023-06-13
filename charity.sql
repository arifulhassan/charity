-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2023 at 04:03 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `charity`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_settings`
--

CREATE TABLE `admin_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `welcome_text` varchar(200) NOT NULL,
  `welcome_subtitle` text NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `result_request` int(10) UNSIGNED NOT NULL COMMENT 'The max number of shots per request',
  `status_page` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 Offline, 1 Online',
  `email_verification` enum('0','1') NOT NULL COMMENT '0 Off, 1 On',
  `email_no_reply` varchar(200) NOT NULL,
  `email_admin` varchar(200) NOT NULL,
  `captcha` enum('on','off') NOT NULL DEFAULT 'on',
  `file_size_allowed` int(11) UNSIGNED NOT NULL COMMENT 'Size in Bytes',
  `google_analytics` text NOT NULL,
  `paypal_account` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `googleplus` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `google_adsense` text NOT NULL,
  `currency_symbol` char(10) NOT NULL,
  `currency_code` varchar(20) NOT NULL,
  `min_donation_amount` int(11) UNSIGNED NOT NULL,
  `min_campaign_amount` int(11) UNSIGNED NOT NULL,
  `payment_gateway` enum('Paypal','Stripe') NOT NULL DEFAULT 'Paypal',
  `paypal_sandbox` enum('true','false') NOT NULL DEFAULT 'true',
  `min_width_height_image` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_settings`
--

INSERT INTO `admin_settings` (`id`, `title`, `description`, `welcome_text`, `welcome_subtitle`, `keywords`, `result_request`, `status_page`, `email_verification`, `email_no_reply`, `email_admin`, `captcha`, `file_size_allowed`, `google_analytics`, `paypal_account`, `twitter`, `facebook`, `googleplus`, `instagram`, `google_adsense`, `currency_symbol`, `currency_code`, `min_donation_amount`, `min_campaign_amount`, `payment_gateway`, `paypal_sandbox`, `min_width_height_image`) VALUES
(1, 'Charity | Charity Management System Platform', 'We provide help to people who are victims of natural disasters or conflict or suffering from poverty, hunger, disease, homelessness, injustice, deprivation, or lack of skills and economic opportunities. We will not stop until all communities in the forgotten corners of our world have the safety they need and deserve.', 'Little help, for big cause!', 'Charity Management System Platform', 'Charity, Crowdfunding, crowfund, fundme, campaign', 8, '1', '0', 'arifulhasan107@gmail.com', 'arifulhasan107@gmail.com', 'off', 2048, '', 'arifulhasan107@gmail.com', 'https://www.twitter.com/', 'https://www.facebook.com/fundme', 'https://plus.google.com/', 'https://www.instagram.com/', '<script async src=\"//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js\"></script>\r\n<ins class=\"adsbygoogle\"\r\nstyle=\"display:block\"\r\ndata-ad-client=\"ca-pub-4300901855004979\"\r\ndata-ad-slot=\"7623553448\"\r\ndata-ad-format=\"auto\"></ins> <script>(adsbygoogle=window.adsbygoogle||[]).push({});</script>', '$', 'USD', 5, 100, 'Paypal', 'true', '800x400');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(11) NOT NULL,
  `small_image` varchar(255) NOT NULL,
  `large_image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','pending') NOT NULL DEFAULT 'active',
  `token_id` varchar(255) NOT NULL,
  `goal` int(11) UNSIGNED NOT NULL,
  `location` varchar(200) NOT NULL,
  `finalized` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 No 1 Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `small_image`, `large_image`, `title`, `description`, `user_id`, `date`, `status`, `token_id`, `goal`, `location`, `finalized`) VALUES
(3, '11686078587fkscopscgn2gf1ublgevcofu4iyoaqkssuncr4ie.jpg', '11686078587miy1i9yixzscpfxqrpiilhorx1aqrbonxvw1mshn.jpg', 'Flood affected area of Kushtia', 'Vidyananda in flood-affected areas\r\n37 villages of Daulatpur and Bheramara upazilas of Kushtia were flooded due to the rise of river water. About 60,000 people in these villages became waterlogged.', 1, '2016-09-13 07:15:15', 'active', 'bFoHsUP4CjY5YM9koC5mjkSHLhp9HyEOxTKRbjhrhqFmEDI1KCXKMTq3NccWDUP2TycvkHSJdjz0ntUkbeYA8Lsv7CLgXsZg4a6Tg5Uis7HL1wjvVekdmhGEtUyxKNV6Xf61LAJEpRlfKpPpaXJdqv8OtKp6ggWO7wymAYChS94bEdvhbokn1N86vI1AjwcfuEhLgWRH', 30500, 'Kushtia', '0'),
(4, '11686078139oo5pdsexrribu9eg14nust7hbmbom6wluy5qpdke.jpg', '116860781390wmr0e7wymlwomwmdgi5hxs6ttuchijzdcxgqery.jpg', 'Lalmonirhat relief distribution', 'Spot Name: Kalamati-Lalmonirhat\r\nNumber: 156 families.\r\nPackage: Eight and a half kg.\r\nDescription: Labourer, Day Labourer, Fisherman, Widow, Aged, Unemployed Unemployed.\r\nDate of issue: August 1, 2023', 1, '2016-09-13 07:15:50', 'active', 'qFoHsUP4CjY5YM9koC5mjkSHLhp9HyEOxTKRbjhrhqFmEDI1KCXKMTq3NccWDUP2TycvkHSJdjz0ntUkbeYA8Lsv7CLgXsZg4a6Tg5Uis7HL1wjvVekdmhGEtUyxKNV6Xf61LAJEpRlfKpPpaXJdqv8OtKp6ggWO7wymAYChS94bEdvhbokn1N86vI1AjwcfuEhLgWRH', 150000, 'Lalmonirhat', '0'),
(8, '11686077100ggj5w0g8vzfm0ys8qavqyynrnzciijnvx4u47kd4.jpg', '11686077100hlf6dacxhg2j2r0vdck1aqqy6qylmejiq3n6dye5.jpg', 'Bongo Bazar Fire', 'Around 3000 shops in Dhaka\'s Bangabazar were burnt to ashes in a terrible fire. According to the preliminary investigation report, the fire caused a total loss of around 305 crore rupees. And cigarette fire is responsible for this damage. Dhaka South City Corporation has formed an investigation committee to find out why this fire broke out in Bangabazar.', 1, '2023-06-06 12:45:00', 'active', 'aGqyd4o1zsOXeCYcZlVMODSth99P4n0NIZMq9jQgEqZrkWEUPMBsxxCvL6Aoq97l6gGVjeFEu2jzvHsz7cDPZxIh26w1XA7iZnxTGjQBvdI3Lt9i9G5jiPe39eFhDZbZsSD2CIIzYre38FS725H4GICy7fO1Sg3Y8znmY3MNuDGGiGgYiVhIL5OIxYu82ldEByUqkr86', 500000, 'Bongo Bazar, Dhaka', '0'),
(9, '11686077318k6f251xs7ybfx78c85ofqufoma4adrg9ocfgvtnb.jpg', '11686077318yeg0wigwjpd7lavgmu5er1y8s1oh3fxrramhncz5.jpg', 'Sylhet Floods', 'The flood situation has worsened in Sylhet district. The lower areas of all the upazilas of the district have been flooded. Millions of people have become waterlogged. Many areas are cut off from upazila and district headquarters due to the sinking of various roads. Floodwaters have also entered educational institutions, bazaars, and many government offices.', 1, '2023-06-06 12:48:38', 'active', '5DorgNJAkPGkmE1RSB6cDAEK35Lx9Vzo7SONNQT1VnI8AY5o2cZn0u9OU4cG4S5JoI6TBu3mctpWU9jYyWdpTcZX8AMfLqqI5A6cr36PrM3Ik8jfm0wz7HfstIMdkSkbkJ2uc5WlDBf8eyJ8MlIu60cvOjsPVBQGGZLtYEJzlOc8VcIbMqU7Uo5t5DGJ3dXOHBNv6ovY', 300000, 'Shylet', '0'),
(11, '11686083141y88vct6gyfnnzyu2yyghbmwqzyk5wgsiulcp3usi.jpg', '11686083141v2lltmnng89qtcttcz6oodrhrhd91napm6mwnrad.jpg', 'Dhaka\'s Bangabazar were burnt', 'fjhbvjkhbjkhnkljnjkl;mjl;ml;mbjhbjjjkkk', 1, '2023-06-06 14:25:41', 'active', 'k6Y02KTjAIoHD5JKbdYHh6y8yYeIoK6xBKq5JuO309Vfe31BGKQG5otKXxvUsfCSdA8UC2hxLv3uc418CK1sJdfsCrDB9syUMqitp5nssc9NoDWyDGvruSxhWTln3rkEvWNmIC4n3hzLqsyd62aOMDDp4MGmNnOgGavEyAToNnJ01uLdY3i913W2sPw9neNek5SeppKp', 200000, 'Shylet', '0');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `mode` enum('on','off') NOT NULL DEFAULT 'on'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `mode`) VALUES
(1, 'Business', 'Business', 'on'),
(2, 'Charity', 'Charity', 'on'),
(3, 'Community', 'Community', 'on'),
(4, 'Competitions', 'Competitions', 'on'),
(5, 'Creative', 'Creative', 'on'),
(6, 'Events', 'Events', 'on'),
(7, 'Faith', 'Faith', 'on'),
(8, 'Family', 'Family', 'on'),
(9, 'Other', 'Other', 'on'),
(10, 'Travel', 'Travel', 'on'),
(11, 'Wishes', 'Wishes', 'on'),
(12, 'Medical', 'Medical', 'on'),
(13, 'Emergencies', 'Emergencies', 'on'),
(14, 'Education', 'Education', 'on'),
(15, 'Memorials', 'Memorials', 'on'),
(16, 'Sports', 'Sports', 'on'),
(17, 'Animals', 'Animals', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('new','readed') NOT NULL DEFAULT 'new'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'US', 'United States'),
(2, 'CA', 'Canada'),
(3, 'AF', 'Afghanistan'),
(4, 'AL', 'Albania'),
(5, 'DZ', 'Algeria'),
(6, 'DS', 'American Samoa'),
(7, 'AD', 'Andorra'),
(8, 'AO', 'Angola'),
(9, 'AI', 'Anguilla'),
(10, 'AQ', 'Antarctica'),
(11, 'AG', 'Antigua and/or Barbuda'),
(12, 'AR', 'Argentina'),
(13, 'AM', 'Armenia'),
(14, 'AW', 'Aruba'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia and Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BV', 'Bouvet Island'),
(32, 'BR', 'Brazil'),
(33, 'IO', 'British lndian Ocean Territory'),
(34, 'BN', 'Brunei Darussalam'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CV', 'Cape Verde'),
(41, 'KY', 'Cayman Islands'),
(42, 'CF', 'Central African Republic'),
(43, 'TD', 'Chad'),
(44, 'CL', 'Chile'),
(45, 'CN', 'China'),
(46, 'CX', 'Christmas Island'),
(47, 'CC', 'Cocos (Keeling) Islands'),
(48, 'CO', 'Colombia'),
(49, 'KM', 'Comoros'),
(50, 'CG', 'Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'ID', 'Indonesia'),
(101, 'IR', 'Iran (Islamic Republic of)'),
(102, 'IQ', 'Iraq'),
(103, 'IE', 'Ireland'),
(104, 'IL', 'Israel'),
(105, 'IT', 'Italy'),
(106, 'CI', 'Ivory Coast'),
(107, 'JM', 'Jamaica'),
(108, 'JP', 'Japan'),
(109, 'JO', 'Jordan'),
(110, 'KZ', 'Kazakhstan'),
(111, 'KE', 'Kenya'),
(112, 'KI', 'Kiribati'),
(113, 'KP', 'Korea, Democratic People\'s Republic of'),
(114, 'KR', 'Korea, Republic of'),
(115, 'XK', 'Kosovo'),
(116, 'KW', 'Kuwait'),
(117, 'KG', 'Kyrgyzstan'),
(118, 'LA', 'Lao People\'s Democratic Republic'),
(119, 'LV', 'Latvia'),
(120, 'LB', 'Lebanon'),
(121, 'LS', 'Lesotho'),
(122, 'LR', 'Liberia'),
(123, 'LY', 'Libyan Arab Jamahiriya'),
(124, 'LI', 'Liechtenstein'),
(125, 'LT', 'Lithuania'),
(126, 'LU', 'Luxembourg'),
(127, 'MO', 'Macau'),
(128, 'MK', 'Macedonia'),
(129, 'MG', 'Madagascar'),
(130, 'MW', 'Malawi'),
(131, 'MY', 'Malaysia'),
(132, 'MV', 'Maldives'),
(133, 'ML', 'Mali'),
(134, 'MT', 'Malta'),
(135, 'MH', 'Marshall Islands'),
(136, 'MQ', 'Martinique'),
(137, 'MR', 'Mauritania'),
(138, 'MU', 'Mauritius'),
(139, 'TY', 'Mayotte'),
(140, 'MX', 'Mexico'),
(141, 'FM', 'Micronesia, Federated States of'),
(142, 'MD', 'Moldova, Republic of'),
(143, 'MC', 'Monaco'),
(144, 'MN', 'Mongolia'),
(145, 'ME', 'Montenegro'),
(146, 'MS', 'Montserrat'),
(147, 'MA', 'Morocco'),
(148, 'MZ', 'Mozambique'),
(149, 'MM', 'Myanmar'),
(150, 'NA', 'Namibia'),
(151, 'NR', 'Nauru'),
(152, 'NP', 'Nepal'),
(153, 'NL', 'Netherlands'),
(154, 'AN', 'Netherlands Antilles'),
(155, 'NC', 'New Caledonia'),
(156, 'NZ', 'New Zealand'),
(157, 'NI', 'Nicaragua'),
(158, 'NE', 'Niger'),
(159, 'NG', 'Nigeria'),
(160, 'NU', 'Niue'),
(161, 'NF', 'Norfork Island'),
(162, 'MP', 'Northern Mariana Islands'),
(163, 'NO', 'Norway'),
(164, 'OM', 'Oman'),
(165, 'PK', 'Pakistan'),
(166, 'PW', 'Palau'),
(167, 'PA', 'Panama'),
(168, 'PG', 'Papua New Guinea'),
(169, 'PY', 'Paraguay'),
(170, 'PE', 'Peru'),
(171, 'PH', 'Philippines'),
(172, 'PN', 'Pitcairn'),
(173, 'PL', 'Poland'),
(174, 'PT', 'Portugal'),
(175, 'PR', 'Puerto Rico'),
(176, 'QA', 'Qatar'),
(177, 'RE', 'Reunion'),
(178, 'RO', 'Romania'),
(179, 'RU', 'Russian Federation'),
(180, 'RW', 'Rwanda'),
(181, 'KN', 'Saint Kitts and Nevis'),
(182, 'LC', 'Saint Lucia'),
(183, 'VC', 'Saint Vincent and the Grenadines'),
(184, 'WS', 'Samoa'),
(185, 'SM', 'San Marino'),
(186, 'ST', 'Sao Tome and Principe'),
(187, 'SA', 'Saudi Arabia'),
(188, 'SN', 'Senegal'),
(189, 'RS', 'Serbia'),
(190, 'SC', 'Seychelles'),
(191, 'SL', 'Sierra Leone'),
(192, 'SG', 'Singapore'),
(193, 'SK', 'Slovakia'),
(194, 'SI', 'Slovenia'),
(195, 'SB', 'Solomon Islands'),
(196, 'SO', 'Somalia'),
(197, 'ZA', 'South Africa'),
(198, 'GS', 'South Georgia South Sandwich Islands'),
(199, 'ES', 'Spain'),
(200, 'LK', 'Sri Lanka'),
(201, 'SH', 'St. Helena'),
(202, 'PM', 'St. Pierre and Miquelon'),
(203, 'SD', 'Sudan'),
(204, 'SR', 'Suriname'),
(205, 'SJ', 'Svalbarn and Jan Mayen Islands'),
(206, 'SZ', 'Swaziland'),
(207, 'SE', 'Sweden'),
(208, 'CH', 'Switzerland'),
(209, 'SY', 'Syrian Arab Republic'),
(210, 'TW', 'Taiwan'),
(211, 'TJ', 'Tajikistan'),
(212, 'TZ', 'Tanzania, United Republic of'),
(213, 'TH', 'Thailand'),
(214, 'TG', 'Togo'),
(215, 'TK', 'Tokelau'),
(216, 'TO', 'Tonga'),
(217, 'TT', 'Trinidad and Tobago'),
(218, 'TN', 'Tunisia'),
(219, 'TR', 'Turkey'),
(220, 'TM', 'Turkmenistan'),
(221, 'TC', 'Turks and Caicos Islands'),
(222, 'TV', 'Tuvalu'),
(223, 'UG', 'Uganda'),
(224, 'UA', 'Ukraine'),
(225, 'AE', 'United Arab Emirates'),
(226, 'GB', 'United Kingdom'),
(227, 'UM', 'United States minor outlying islands'),
(228, 'UY', 'Uruguay'),
(229, 'UZ', 'Uzbekistan'),
(230, 'VU', 'Vanuatu'),
(231, 'VA', 'Vatican City State'),
(232, 'VE', 'Venezuela'),
(233, 'VN', 'Vietnam'),
(234, 'VG', 'Virgin Islands (British)'),
(235, 'VI', 'Virgin Islands (U.S.)'),
(236, 'WF', 'Wallis and Futuna Islands'),
(237, 'EH', 'Western Sahara'),
(238, 'YE', 'Yemen'),
(239, 'YU', 'Yugoslavia'),
(240, 'ZR', 'Zaire'),
(241, 'ZM', 'Zambia'),
(242, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` int(10) UNSIGNED NOT NULL,
  `campaigns_id` int(11) UNSIGNED NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `country` varchar(100) NOT NULL,
  `postal_code` varchar(100) NOT NULL,
  `donation` int(11) UNSIGNED NOT NULL,
  `payment_gateway` varchar(100) NOT NULL,
  `oauth_uid` varchar(200) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `anonymous` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 No, 1 Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `campaigns_id`, `fullname`, `email`, `country`, `postal_code`, `donation`, `payment_gateway`, `oauth_uid`, `comment`, `date`, `anonymous`) VALUES
(1, 4, 'Mike Doe', 'mike@doe.com', 'US', '234564', 500, 'paypal', '', '', '2016-09-13 08:14:35', '0'),
(2, 4, 'Luke Hanks', 'luke@hank.com', 'US', '12345', 750, 'paypal', '', '', '2016-09-13 08:14:35', '0'),
(3, 4, 'Pet Sand', 'pete@test.com', 'US', '232324', 250, 'paypal', '', '', '2016-09-13 08:27:42', '1'),
(4, 2, 'Tyler Simna', 'tyle@test.com', 'US', '847346', 10000, 'paypal', '', 'Good luck!', '2016-09-13 08:27:42', '0'),
(5, 3, 'Lola Flores', 'lola@test.com', 'VE', '2121', 210, 'paypal', '', 'Buena suerte!!', '2016-09-13 08:46:28', '0'),
(6, 2, 'pedro luma', 'pedro@luma.com', 'AR', '873824', 110, 'paypal', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam,', '2016-09-13 08:48:18', '1'),
(7, 2, 'John Luang', 'luang@test.com', 'US', '332872', 25, 'Paypal', '', '', '2016-09-13 08:49:14', '0'),
(8, 3, 'Pesha Ulla', 'pesha@test.com', 'US', '1234567', 2800, 'Paypal', '', '', '2016-09-13 08:51:52', '0'),
(9, 4, 'Oswald Parra', 'oswald@parra.com', 'US', '8765432', 1750, 'Paypal', '', '', '2016-09-13 08:51:52', '0'),
(10, 2, 'Gary Filo', 'gary@test.com', 'US', '123456', 1000, 'Paypal', '', '', '2016-09-13 09:08:21', '0'),
(11, 4, 'Alek Chang', 'alek@example.com', 'US', '23754', 1250, 'Paypal', '', '', '2016-09-14 20:42:27', '0'),
(12, 4, 'Ryan Queen', 'miguelvasquezweb@gmail.com', 'VE', '2123', 50000, 'Paypal', '', '', '2016-09-14 20:44:36', '0'),
(13, 3, 'Mary Kate Holmes', 'mary@holmes.com', 'US', '283928', 2000, 'Paypal', '', '', '2016-09-14 20:45:55', '0'),
(14, 5, 'Yaki Lee Juhad', 'yaaki@corporation.com', 'US', '232434', 1500, 'Paypal', '', '', '2016-09-20 02:39:07', '0');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(100) NOT NULL,
  `show_navbar` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 No, 1 Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `content`, `slug`, `show_navbar`) VALUES
(2, 'Terms', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets \r\n\r\n<br/><br/>\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets \r\n\r\n<br/><br/>\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets ', 'terms-of-service', '0'),
(3, 'Privacy', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets \n\n<br/><br/>\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'privacy', '0'),
(5, 'About us', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets<br />\r\n<br />\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n', 'about', '1'),
(7, 'Support', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets <br /><br /> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>', 'support', '0'),
(8, 'How it works', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n', 'how-it-works', '1');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(10) UNSIGNED NOT NULL,
  `token` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `token`, `email`, `created_at`) VALUES
(2, '92e870ce9f7a5e8a27dec37161bce7b501bc35bad0360190c7b39674f88a2cdf', 'mike@doe.com', '2016-09-29 07:21:24'),
(7, '3308e00e3115fef24cdbdf74bbd2424d769da3dc9b98dc738eda614debc1285d', 'admin@example.com', '2016-10-04 09:53:20');

-- --------------------------------------------------------

--
-- Table structure for table `reserved`
--

CREATE TABLE `reserved` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reserved`
--

INSERT INTO `reserved` (`id`, `name`) VALUES
(14, 'account'),
(31, 'api'),
(2, 'app'),
(30, 'bootstrap'),
(37, 'campaigns'),
(34, 'categories'),
(36, 'collections'),
(29, 'comment'),
(42, 'config'),
(25, 'contact'),
(41, 'database'),
(35, 'featured'),
(32, 'freebies'),
(9, 'goods'),
(1, 'gostock1'),
(11, 'jobs'),
(21, 'join'),
(16, 'latest'),
(20, 'login'),
(33, 'logout'),
(27, 'members'),
(13, 'messages'),
(19, 'notifications'),
(15, 'popular'),
(6, 'porn'),
(26, 'programs'),
(12, 'projects'),
(3, 'public'),
(23, 'register'),
(40, 'resources'),
(39, 'routes'),
(17, 'search'),
(7, 'sex'),
(44, 'storage'),
(8, 'tags'),
(38, 'tests'),
(24, 'upgrade'),
(28, 'upload'),
(4, 'vendor'),
(5, 'xxx');

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `campaigns_id` int(10) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `token_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `image`, `description`, `campaigns_id`, `date`, `token_id`) VALUES
(1, '1464967090.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet', 4, '2016-09-13 06:59:15', 'jFoHsUP4CjY5YM9koC5mjkSHLhp9HyEOxTKRbjhrhqFmEDI1KCXKMTq3NccWDUP2TycvkHSJdjz0ntUkbeYA8Lsv7CLgXsZg4a6Tg5Uis7HL1wjvVekdmhGEtUyxKNV6Xf61LAJEpRlfKpPpaXJdqv8OtKp6ggWO7wymAYChS94bEdvhbokn1N86vI1AjwcfuEhLgWRH'),
(2, '1458113122.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet', 4, '2016-09-17 07:14:15', 'aFoHsUP4CjY5YM9koC5mjkSHLhp9HyEOxTKRbjhrhqFmEDI1KCXKMTq3NccWDUP2TycvkHSJdjz0ntUkbeYA8Lsv7CLgXsZg4a6Tg5Uis7HL1wjvVekdmhGEtUyxKNV6Xf61LAJEpRlfKpPpaXJdqv8OtKp6ggWO7wymAYChS94bEdvhbokn1N86vI1AjwcfuEhLgWRH'),
(4, '1469177313.png', '<strong>Lorem ipsum</strong> dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet.\r\n\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet', 3, '2016-09-18 07:15:50', 'qFoHsUP4CjY5YM9koC5mjkSHLhp9HyEOxTKRbjhrhqFmEDI1KCXKMTq3NccWDUP2TycvkHSJdjz0ntUkbeYA8Lsv7CLgXsZg4a6Tg5Uis7HL1wjvVekdmhGEtUyxKNV6Xf61LAJEpRlfKpPpaXJdqv8OtKp6ggWO7wymAYChS94bEdvhbokn1N86vI1AjwcfuEhLgWRH'),
(5, '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet', 4, '2016-09-19 13:14:15', 'aFoHsUP4CjY5YM9koC5mjkSHLhp9HyEOxTKRbjhrhqFmEDI1KCXKMTq3NccWDUP2TycvkHSJdjz0ntUkbeYA8Lsv7CLgasZg4a6Tg5Uis7HL1wjvVekdmhGEtUyxKNV6Xf61LAJEpRlfKpPpaXJdqv8OtKp6ggWO7wymAYChS94bEdvhbokn1N86vI1AjwcfuEhLgWRH'),
(6, '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut tortor rutrum massa efficitur tincidunt vel nec lacus. Curabitur porta aliquet diam, eu gravida neque lacinia in. Praesent eget orci id sem commodo aliquet', 3, '2016-09-19 10:14:15', 'aFoHsUP4CjY5YM9koA5mjkSHLhp9qyEOxTKRbjhrhqFmEDI1KCXKMTq3NccWDUP2TycvkHSJdjz0ntUkbeYA8Lsv7CLgasZg4a6Tg5Uis7HL1wjvVekdmhGEtUyxKNV6Xf61LAJEpRlfKpPpaXJdqv8OtKp6ggWO7wymAYChS94bEdvhbokn1N86vI1AjwcfuEhLgWRH');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `countries_id` char(25) NOT NULL,
  `password` char(60) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `avatar` varchar(70) NOT NULL,
  `status` enum('pending','active','suspended','delete') NOT NULL DEFAULT 'active',
  `role` enum('normal','admin') NOT NULL DEFAULT 'normal',
  `remember_token` varchar(100) NOT NULL,
  `token` varchar(80) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `countries_id`, `password`, `email`, `date`, `avatar`, `status`, `role`, `remember_token`, `token`, `updated_at`, `created_at`) VALUES
(1, 'Ariful Hassan', '', '$2y$10$XzUZMAN.KUwPkpg0xSIDi.GOvyF1JDeciikz.lZJvwgMVzQqKP6uu', 'arifulhasan107@gmail.com', '2016-09-09 11:04:42', '11686072576usxrawsumtkny5c.jpg', 'active', 'admin', '2VNu7teqrGidW1dpH4Nr8h804JhtiDXL71mxPNHGpcaJ9T5PDC9XDorCVMdo', 'Wy4VkAl2dxHb9WHoXjTowSGPXFPnEQHca6RBe2yeqqmRafs0hSbCEobhNkZZAbCDIru60ceLzAAOI3fj', '2023-06-06 14:28:20', '2016-09-09 15:34:42'),
(2, 'Hasan', '', '$2y$10$fE6XCtweZOX6kP8xKCK09euWEJhJrKTZI0PpH8FbRpP7Gzn49qhtK', 'hasan@gmail.com', '2016-06-10 05:38:20', 'default.jpg', 'active', 'admin', 'cWMCt2pA78Y9gQoiqMfFS9pbZIi2fPud0vBsgiPKYZf2PeMfIKRklZGH1oKf', 'ElWawZOolicfoIMj548UOaie8niRNEkY96TZZPtCQTzYi2s7mRHEVaBMkzLuY0aETciCGjLmdKu', '2023-06-06 12:00:22', '0000-00-00 00:00:00'),
(3, 'Tushar', '', '$2y$10$iu.sFW3eLWyB1ReNS/mi.epQ0Iyyl1mp8QQ8Rk34AK2kOgwBMRSv.', 'tushar@gmail.com', '2016-09-28 10:44:20', 'default.jpg', 'active', 'normal', 'QwpnnuQUFh4h9Mg2vBlQSwRV0EKupg3b1vWbCjbckwsOCXQ4K05pmQZDw78S', 'XI2yuKhwYfVfT6B7y6UZSgCvT35gM65gsYzPU9NJLNRuUAHNSe0Pcq14mAQs8FWhJOlRyStuJAIvMz9e', '2023-06-06 12:00:14', '2016-09-28 15:14:20'),
(4, 'tushar', '', '$2y$10$sk/dQMyKFFPsV79y0PKJCOREP5mvtF7EMey9C.n.NqYQbo3D.9vn2', 'tushar12@gmail.com', '2023-06-06 19:25:58', '41686079611f58hdieqdjjvevz.png', 'active', 'normal', 'aNCQmOBEUtrj9BtlEwpW7eoefuXOOXOy7y01446wS0mcN5DCoz4PHHNA5IQZ', 'qlEPQVCb6Qq2pzySm7i9dkgZeJzJRSeDVGGXfVWTA42l8n5BbAk9LPnwYGMwfEEVaiEULw2ytL0cSEUS', '2023-06-06 13:27:11', '2023-06-06 13:25:58'),
(5, 'Ariful', '', '$2y$10$zMYAjFB.qK3eWd3ZWU6VcuPZ28mpT7YE6BAeyGwwV6dZIuT5Cxesm', 'ariful12@gmail.com', '2023-06-06 20:26:57', '51686084117wvyzahw6klvh4rf.jpg', 'active', 'normal', '', 'fY9HoO2FiInPXTwgeArYt1W2aDBq12syiz2gyPSMOVSStpe7CKwV62l3e7Oys11cImM3hDN9a1g4iOcY', '2023-06-06 14:41:57', '2023-06-06 14:26:57');

-- --------------------------------------------------------

--
-- Table structure for table `users_reporteds`
--

CREATE TABLE `users_reporteds` (
  `id` int(10) UNSIGNED NOT NULL,
  `reason` enum('copyright','privacy_issue','violent_sexual_content','spoofing') NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `id_reported` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_reporteds`
--

INSERT INTO `users_reporteds` (`id`, `reason`, `user_id`, `id_reported`, `created_at`) VALUES
(1, 'copyright', 2, 1, '2016-06-21 20:35:01'),
(3, 'spoofing', 3, 1, '2016-06-23 05:41:50');

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `campaigns_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(25) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_settings`
--
ALTER TABLE `admin_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_id` (`token_id`),
  ADD KEY `author_id` (`user_id`,`status`,`token_id`),
  ADD KEY `image` (`small_image`),
  ADD KEY `goal` (`goal`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ip` (`ip`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaigns_id` (`campaigns_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_hash` (`token`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `reserved`
--
ALTER TABLE `reserved`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_id` (`token_id`),
  ADD KEY `author_id` (`token_id`),
  ADD KEY `image` (`image`),
  ADD KEY `category_id` (`campaigns_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `username` (`status`),
  ADD KEY `role` (`role`);

--
-- Indexes for table `users_reporteds`
--
ALTER TABLE `users_reporteds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user_id`,`id_reported`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `publicacion_id` (`campaigns_id`),
  ADD KEY `usr_id` (`user_id`),
  ADD KEY `ip` (`ip`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_settings`
--
ALTER TABLE `admin_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reserved`
--
ALTER TABLE `reserved`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users_reporteds`
--
ALTER TABLE `users_reporteds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
