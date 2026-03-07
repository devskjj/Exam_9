INSERT INTO roles(name)
VALUES ('USER');

INSERT
INTO service_providers (name)
VALUES ('Beeline');
INSERT INTO service_providers (name)
VALUES ('Megacom');
INSERT INTO service_providers (name)
VALUES ('O!');
INSERT INTO service_providers (name)
VALUES ('Электричество');
INSERT INTO service_providers (name)
VALUES ('Водоканал');

INSERT INTO provider_accounts (provider_id, phone_number, account_number, balance)
VALUES ((SELECT id FROM service_providers WHERE name = 'Beeline'), '0550123456', 'BL770012', 1500.0);

INSERT INTO provider_accounts (provider_id, phone_number, account_number, balance)
VALUES ((SELECT id FROM service_providers WHERE name = 'Beeline'), '0550789012', 'BL773456', 2300.0);

INSERT INTO provider_accounts (provider_id, phone_number, account_number, balance)
VALUES ((SELECT id FROM service_providers WHERE name = 'Megacom'), '0999123456', 'MG550123', 800.0);

INSERT INTO provider_accounts (provider_id, phone_number, account_number, balance)
VALUES ((SELECT id FROM service_providers WHERE name = 'Megacom'), '0999789012', 'MG554567', 1200.0);

INSERT INTO provider_accounts (provider_id, phone_number, account_number, balance)
VALUES ((SELECT id FROM service_providers WHERE name = 'O!'), '0700123456', 'OI990123', 500.0);

INSERT INTO provider_accounts (provider_id, phone_number, account_number, balance)
VALUES ((SELECT id FROM service_providers WHERE name = 'Электричество'), '996123456789', 'EL12345678', 3500.0);

INSERT INTO provider_accounts (provider_id, phone_number, account_number, balance)
VALUES ((SELECT id FROM service_providers WHERE name = 'Водоканал'), '996987654321', 'VD87654321', 2800.0);