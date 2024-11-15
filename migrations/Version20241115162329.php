<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20241115162329 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE certifications (certification_id INT AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, theme_id INT NOT NULL, date_obtained DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_3B0D76D5A76ED395 (user_id), INDEX IDX_3B0D76D559027487 (theme_id), PRIMARY KEY(certification_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE courses (id INT AUTO_INCREMENT NOT NULL, theme_id INT NOT NULL, name VARCHAR(255) NOT NULL, price DOUBLE PRECISION NOT NULL, description LONGTEXT NOT NULL, INDEX IDX_A9A55A4C59027487 (theme_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE lesson_completion (completion_id INT AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, lesson_id INT NOT NULL, is_completed TINYINT(1) NOT NULL, INDEX IDX_35DF7EAFA76ED395 (user_id), INDEX IDX_35DF7EAFCDF80196 (lesson_id), PRIMARY KEY(completion_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE lessons (lesson_id INT AUTO_INCREMENT NOT NULL, courses_id_id INT NOT NULL, name VARCHAR(255) NOT NULL, price DOUBLE PRECISION NOT NULL, content LONGTEXT DEFAULT NULL, INDEX IDX_3F4218D95359E06E (courses_id_id), PRIMARY KEY(lesson_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE `order` (order_id INT AUTO_INCREMENT NOT NULL, user_id_id INT NOT NULL, created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', total_amount NUMERIC(2, 2) NOT NULL, INDEX IDX_F52993989D86650F (user_id_id), PRIMARY KEY(order_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE order_items (order_item_id INT AUTO_INCREMENT NOT NULL, order_id INT NOT NULL, lesson_id INT DEFAULT NULL, course_id INT DEFAULT NULL, item_type VARCHAR(20) NOT NULL, quantity INT NOT NULL, price DOUBLE PRECISION NOT NULL, total DOUBLE PRECISION NOT NULL, INDEX IDX_62809DB08D9F6D38 (order_id), INDEX IDX_62809DB0CDF80196 (lesson_id), INDEX IDX_62809DB0591CC992 (course_id), PRIMARY KEY(order_item_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE themes (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, description LONGTEXT DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE certifications ADD CONSTRAINT FK_3B0D76D5A76ED395 FOREIGN KEY (user_id) REFERENCES users (id)');
        $this->addSql('ALTER TABLE certifications ADD CONSTRAINT FK_3B0D76D559027487 FOREIGN KEY (theme_id) REFERENCES themes (id)');
        $this->addSql('ALTER TABLE courses ADD CONSTRAINT FK_A9A55A4C59027487 FOREIGN KEY (theme_id) REFERENCES themes (id)');
        $this->addSql('ALTER TABLE lesson_completion ADD CONSTRAINT FK_35DF7EAFA76ED395 FOREIGN KEY (user_id) REFERENCES users (id)');
        $this->addSql('ALTER TABLE lesson_completion ADD CONSTRAINT FK_35DF7EAFCDF80196 FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id)');
        $this->addSql('ALTER TABLE lessons ADD CONSTRAINT FK_3F4218D95359E06E FOREIGN KEY (courses_id_id) REFERENCES courses (id)');
        $this->addSql('ALTER TABLE `order` ADD CONSTRAINT FK_F52993989D86650F FOREIGN KEY (user_id_id) REFERENCES users (id)');
        $this->addSql('ALTER TABLE order_items ADD CONSTRAINT FK_62809DB08D9F6D38 FOREIGN KEY (order_id) REFERENCES `order` (order_id)');
        $this->addSql('ALTER TABLE order_items ADD CONSTRAINT FK_62809DB0CDF80196 FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id)');
        $this->addSql('ALTER TABLE order_items ADD CONSTRAINT FK_62809DB0591CC992 FOREIGN KEY (course_id) REFERENCES courses (id)');
        $this->addSql('ALTER TABLE users DROP user_id');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE certifications DROP FOREIGN KEY FK_3B0D76D5A76ED395');
        $this->addSql('ALTER TABLE certifications DROP FOREIGN KEY FK_3B0D76D559027487');
        $this->addSql('ALTER TABLE courses DROP FOREIGN KEY FK_A9A55A4C59027487');
        $this->addSql('ALTER TABLE lesson_completion DROP FOREIGN KEY FK_35DF7EAFA76ED395');
        $this->addSql('ALTER TABLE lesson_completion DROP FOREIGN KEY FK_35DF7EAFCDF80196');
        $this->addSql('ALTER TABLE lessons DROP FOREIGN KEY FK_3F4218D95359E06E');
        $this->addSql('ALTER TABLE `order` DROP FOREIGN KEY FK_F52993989D86650F');
        $this->addSql('ALTER TABLE order_items DROP FOREIGN KEY FK_62809DB08D9F6D38');
        $this->addSql('ALTER TABLE order_items DROP FOREIGN KEY FK_62809DB0CDF80196');
        $this->addSql('ALTER TABLE order_items DROP FOREIGN KEY FK_62809DB0591CC992');
        $this->addSql('DROP TABLE certifications');
        $this->addSql('DROP TABLE courses');
        $this->addSql('DROP TABLE lesson_completion');
        $this->addSql('DROP TABLE lessons');
        $this->addSql('DROP TABLE `order`');
        $this->addSql('DROP TABLE order_items');
        $this->addSql('DROP TABLE themes');
        $this->addSql('ALTER TABLE users ADD user_id INT NOT NULL');
    }
}
