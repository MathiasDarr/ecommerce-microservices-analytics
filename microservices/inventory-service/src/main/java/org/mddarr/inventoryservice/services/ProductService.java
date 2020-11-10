package org.mddarr.inventoryservice.services;



import org.mddarr.inventoryservice.dto.Product;
import org.mddarr.inventoryservice.repository.ProductRepository;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository){
        this.productRepository = productRepository;
    }

//    @CacheEvict(value="product-cache",key="'ProductCache'+#brand+#productName", beforeInvocation = true)
//    @Cacheable(value="product-cache",key="'ProductCache'+#brand+#productName")

    @Cacheable(value="ten-second-cache", key="'ProductCache'+#brand+#productName", condition = "#isCacheable != null && #isCacheable" )
    public Optional<Product> getProduct(String brand, String productName, boolean isCacheable){
        return productRepository.get(brand, productName).map(ProductService::map);
    }

    public List<Product> fetchAllProducts() {
        return productRepository.fetchAllProducts().stream().map(ProductService::map).collect(Collectors.toList());
    }

    public List<Product> fetchAllProductsByBrand(String brand){
        return productRepository.fetchAllProductsByBrand(brand).stream().map(ProductService::map).collect(Collectors.toList());
    }

    private static Product map(ProductRepository.ProductEntity entity) {
        return new Product(entity.getBrandID(), entity.getProductName(), entity.getPrice(), entity.getImageURL());
    }

}
