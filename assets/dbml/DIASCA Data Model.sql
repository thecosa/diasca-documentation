CREATE TABLE `Enterprises` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `type` varchar(255),
  `contact_information` text
);

CREATE TABLE `Sites` (
  `id` integer PRIMARY KEY,
  `enterprise_id` integer,
  `name` varchar(255),
  `latitude` float,
  `longitude` float,
  `altitude` float,
  `geojson` text,
  `size` float,
  `type` varchar(255),
  `address` text
);

CREATE TABLE `SiteParameters` (
  `id` integer PRIMARY KEY,
  `site_id` integer,
  `key` varchar(255),
  `value` text,
  `observation_date` date
);

CREATE TABLE `Plots` (
  `id` integer PRIMARY KEY,
  `site_id` integer,
  `name` varchar(255),
  `latitude` float,
  `longitude` float,
  `altitude` float,
  `geojson` text,
  `size` float,
  `soil_type` varchar(255),
  `crop_history` text,
  `primary_land_use` varchar(255),
  `description` text
);

CREATE TABLE `PlotParameters` (
  `id` integer PRIMARY KEY,
  `plot_id` integer,
  `key` varchar(255),
  `value` text,
  `observation_date` date
);

CREATE TABLE `People` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `role` varchar(255),
  `contact_information` text,
  `associated_enterprise_id` integer
);

CREATE TABLE `PeopleParameters` (
  `id` integer PRIMARY KEY,
  `person_id` integer,
  `key` varchar(255),
  `value` text,
  `observation_date` date
);

CREATE TABLE `Products` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `type` varchar(255),
  `description` text,
  `unit_of_measure` varchar(255)
);

CREATE TABLE `Batches` (
  `id` integer PRIMARY KEY,
  `product_id` integer,
  `origin_plot_id` integer,
  `quantity` float,
  `production_date` date,
  `expiry_date` date
);

CREATE TABLE `Transactions` (
  `id` integer PRIMARY KEY,
  `type` varchar(255),
  `date_of_contract` date,
  `seller_enterprise_id` integer,
  `buyer_enterprise_id` integer,
  `batch_id` integer,
  `quantity` float,
  `price` float
);

CREATE TABLE `TransactionParameters` (
  `id` integer PRIMARY KEY,
  `transaction_id` integer,
  `key` varchar(255),
  `value` text,
  `observation_date` date
);

CREATE TABLE `Events` (
  `id` integer PRIMARY KEY,
  `type` varchar(255),
  `date` date,
  `site_id` integer,
  `plot_id` integer,
  `batch_id` integer,
  `person_id` integer,
  `description` text,
  `attachments` text
);

CREATE UNIQUE INDEX `SiteParameters_index_0` ON `SiteParameters` (`site_id`, `observation_date`, `key`);

CREATE UNIQUE INDEX `PlotParameters_index_1` ON `PlotParameters` (`plot_id`, `observation_date`, `key`);

CREATE UNIQUE INDEX `PeopleParameters_index_2` ON `PeopleParameters` (`person_id`, `observation_date`, `key`);

CREATE UNIQUE INDEX `TransactionParameters_index_3` ON `TransactionParameters` (`transaction_id`, `observation_date`, `key`);

ALTER TABLE `Sites` ADD FOREIGN KEY (`enterprise_id`) REFERENCES `Enterprises` (`id`);

ALTER TABLE `SiteParameters` ADD FOREIGN KEY (`site_id`) REFERENCES `Sites` (`id`);

ALTER TABLE `Plots` ADD FOREIGN KEY (`site_id`) REFERENCES `Sites` (`id`);

ALTER TABLE `PlotParameters` ADD FOREIGN KEY (`plot_id`) REFERENCES `Plots` (`id`);

ALTER TABLE `People` ADD FOREIGN KEY (`associated_enterprise_id`) REFERENCES `Enterprises` (`id`);

ALTER TABLE `PeopleParameters` ADD FOREIGN KEY (`person_id`) REFERENCES `People` (`id`);

ALTER TABLE `Batches` ADD FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`);

ALTER TABLE `Batches` ADD FOREIGN KEY (`origin_plot_id`) REFERENCES `Plots` (`id`);

ALTER TABLE `Transactions` ADD FOREIGN KEY (`seller_enterprise_id`) REFERENCES `Enterprises` (`id`);

ALTER TABLE `Transactions` ADD FOREIGN KEY (`buyer_enterprise_id`) REFERENCES `Enterprises` (`id`);

ALTER TABLE `Transactions` ADD FOREIGN KEY (`batch_id`) REFERENCES `Batches` (`id`);

ALTER TABLE `TransactionParameters` ADD FOREIGN KEY (`transaction_id`) REFERENCES `Transactions` (`id`);

ALTER TABLE `Events` ADD FOREIGN KEY (`site_id`) REFERENCES `Sites` (`id`);

ALTER TABLE `Events` ADD FOREIGN KEY (`plot_id`) REFERENCES `Plots` (`id`);

ALTER TABLE `Events` ADD FOREIGN KEY (`batch_id`) REFERENCES `Batches` (`id`);

ALTER TABLE `Events` ADD FOREIGN KEY (`person_id`) REFERENCES `People` (`id`);
