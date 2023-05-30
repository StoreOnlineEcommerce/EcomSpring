package com.spring.ecomspring.util;

import org.springframework.data.domain.Sort;

public class SortingCriteria<T> {
    private String property;
    private Sort.Direction direction;

    public SortingCriteria(String property, Sort.Direction direction) {
        this.property = property;
        this.direction = direction;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public Sort.Direction getDirection() {
        return direction;
    }

    public void setDirection(Sort.Direction direction) {
        this.direction = direction;
    }
}
