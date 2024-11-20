<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20241120065538 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE course_completion (completion_id INT AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, course_id INT NOT NULL, is_completed TINYINT(1) NOT NULL, INDEX IDX_E73479FDA76ED395 (user_id), INDEX IDX_E73479FD591CC992 (course_id), PRIMARY KEY(completion_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE course_completion ADD CONSTRAINT FK_E73479FDA76ED395 FOREIGN KEY (user_id) REFERENCES users (id)');
        $this->addSql('ALTER TABLE course_completion ADD CONSTRAINT FK_E73479FD591CC992 FOREIGN KEY (course_id) REFERENCES courses (id)');
        $this->addSql('ALTER TABLE order_items CHANGE total total NUMERIC(10, 2) DEFAULT \'0\' NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE course_completion DROP FOREIGN KEY FK_E73479FDA76ED395');
        $this->addSql('ALTER TABLE course_completion DROP FOREIGN KEY FK_E73479FD591CC992');
        $this->addSql('DROP TABLE course_completion');
        $this->addSql('ALTER TABLE order_items CHANGE total total NUMERIC(10, 2) DEFAULT \'0.00\' NOT NULL');
    }
}
