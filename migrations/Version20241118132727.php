<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20241118132727 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE user_courses (id INT AUTO_INCREMENT NOT NULL, user_id_id INT NOT NULL, course_id_id INT NOT NULL, status VARCHAR(20) NOT NULL, date_achat DATETIME NOT NULL, INDEX IDX_F1A844469D86650F (user_id_id), INDEX IDX_F1A8444696EF99BF (course_id_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user_lessons (id INT AUTO_INCREMENT NOT NULL, user_id_id INT NOT NULL, lesson_id INT NOT NULL, status VARCHAR(20) NOT NULL, date_achat DATETIME NOT NULL, INDEX IDX_674F06D39D86650F (user_id_id), INDEX IDX_674F06D3CDF80196 (lesson_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE user_courses ADD CONSTRAINT FK_F1A844469D86650F FOREIGN KEY (user_id_id) REFERENCES users (id)');
        $this->addSql('ALTER TABLE user_courses ADD CONSTRAINT FK_F1A8444696EF99BF FOREIGN KEY (course_id_id) REFERENCES courses (id)');
        $this->addSql('ALTER TABLE user_lessons ADD CONSTRAINT FK_674F06D39D86650F FOREIGN KEY (user_id_id) REFERENCES users (id)');
        $this->addSql('ALTER TABLE user_lessons ADD CONSTRAINT FK_674F06D3CDF80196 FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE user_courses DROP FOREIGN KEY FK_F1A844469D86650F');
        $this->addSql('ALTER TABLE user_courses DROP FOREIGN KEY FK_F1A8444696EF99BF');
        $this->addSql('ALTER TABLE user_lessons DROP FOREIGN KEY FK_674F06D39D86650F');
        $this->addSql('ALTER TABLE user_lessons DROP FOREIGN KEY FK_674F06D3CDF80196');
        $this->addSql('DROP TABLE user_courses');
        $this->addSql('DROP TABLE user_lessons');
    }
}
