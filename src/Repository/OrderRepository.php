<?php

namespace App\Repository;

use App\Entity\Order;
use App\Entity\Users;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Order>
 */
class OrderRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Order::class);
    }

    public function findPurchasedItemsForUser(Users $user): array
    {
        $qb = $this->createQueryBuilder('o')
            ->select('o.course_id, o.lesson_id')
            ->where('o.user_id = :user')
            ->setParameter('user', $user);
    
        return $qb->getQuery()->getResult();
    }

    //    public function findOneBySomeField($value): ?Order
    //    {
    //        return $this->createQueryBuilder('o')
    //            ->andWhere('o.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
