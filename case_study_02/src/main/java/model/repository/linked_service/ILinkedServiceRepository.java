package model.repository.linked_service;

import java.util.List;

public interface ILinkedServiceRepository<E> {
    List<E> ShowAll();
}
