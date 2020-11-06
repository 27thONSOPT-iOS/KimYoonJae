
### 뷰 자체는 2주차와 같다. 


## 1. Header Section

Collection Reusable View를 사용해서 구현. 안에 이미지뷰를 넣고 레이아웃을 잡았다.

아래의 코드를 추가해주면 Collection Reusable View를 header view로 사용할 수 있음.


``` swift
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "reusableView", for: indexPath)
            
            return headerView
            
        default:
            assert(false)
        }
        
    }
```


## 2. Stretchy Header Section

<img src="../readmeImages/3rd/1.gif"  width="400" height = "700"/>

아래의 class 를 추가해주고, 이를 Collection View Flow layout 에 연결시켜주면 가능.


```swift
class ProflieCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }


    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        guard let offset = collectionView?.contentOffset, let stLayoutAttributes = layoutAttributes else {
            return layoutAttributes
        }
        if offset.y < 0 {

            for attributes in stLayoutAttributes {

                if let elmKind = attributes.representedElementKind, elmKind == UICollectionView.elementKindSectionHeader {

                    let diffValue = abs(offset.y)
                    var frame = attributes.frame
                    frame.size.height = max(0, 420.0 + diffValue)
                    frame.origin.y = frame.minY - diffValue
                    attributes.frame = frame
                }
            }
        }
        return layoutAttributes
    }


}
```
