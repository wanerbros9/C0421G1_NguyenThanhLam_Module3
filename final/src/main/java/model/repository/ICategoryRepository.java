package model.repository;

import java.util.List;

public interface ICategoryRepository<E> {
    List<E> showAll();
}
