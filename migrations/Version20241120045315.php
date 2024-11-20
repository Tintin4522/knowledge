<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20241120045315 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE user_courses DROP FOREIGN KEY FK_F1A8444696EF99BF');
        $this->addSql('ALTER TABLE user_courses DROP FOREIGN KEY FK_F1A844469D86650F');
        $this->addSql('ALTER TABLE user_lessons DROP FOREIGN KEY FK_674F06D39D86650F');
        $this->addSql('ALTER TABLE user_lessons DROP FOREIGN KEY FK_674F06D3CDF80196');
        $this->addSql('DROP TABLE user_courses');
        $this->addSql('DROP TABLE user_lessons');
        $this->addSql('ALTER TABLE order_items CHANGE total total NUMERIC(10, 2) DEFAULT \'0\' NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE user_courses (id INT AUTO_INCREMENT NOT NULL, user_id_id INT NOT NULL, course_id_id INT NOT NULL, status VARCHAR(20) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, date_achat DATETIME NOT NULL, INDEX IDX_F1A844469D86650F (user_id_id), INDEX IDX_F1A8444696EF99BF (course_id_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('CREATE TABLE user_lessons (id INT AUTO_INCREMENT NOT NULL, user_id_id INT NOT NULL, lesson_id INT NOT NULL, status VARCHAR(20) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, date_achat DATETIME NOT NULL, INDEX IDX_674F06D39D86650F (user_id_id), INDEX IDX_674F06D3CDF80196 (lesson_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE user_courses ADD CONSTRAINT FK_F1A8444696EF99BF FOREIGN KEY (course_id_id) REFERENCES courses (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE user_courses ADD CONSTRAINT FK_F1A844469D86650F FOREIGN KEY (user_id_id) REFERENCES users (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE user_lessons ADD CONSTRAINT FK_674F06D39D86650F FOREIGN KEY (user_id_id) REFERENCES users (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE user_lessons ADD CONSTRAINT FK_674F06D3CDF80196 FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE order_items CHANGE total total NUMERIC(10, 2) DEFAULT \'0.00\' NOT NULL');
    }
}
