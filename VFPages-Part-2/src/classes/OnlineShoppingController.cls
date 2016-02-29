public class OnlineShoppingController {
        public List<PurchaseOrderLineItems__c> productsInCart {get;set;}
        public Set<ID> productIdsInCart {get;set;} 
        public String selectedProductId {get;set;}
        public PurchaseOrder__c order {get;set;}
        public Date deliveryDate {get;set;}
        public boolean productsPopUp {get;set;}
        public boolean purchaseOrderLineItemsdisplayPopUp {get; set;}  
        public boolean cartDisplayPopUp {get; set;}  
        public boolean purchaseOrderdisplayPopUp {get; set;} 
        public boolean productsDisplayPopUp {get; set;} 
        public boolean noRecordMessagePopUp{get; set;} 
        public boolean personalInfoDisplayPopUp {get; set;} 
        public ApexPages.StandardSetController productSetController {get; set;}
        public String query;
        public Integer totalPages {get;set;}
        Decimal dtotalPages;
        Integer recordsPerPage = 5;   
        //list of products
        public List<Product2> Products {
            get{
                return (List<Product2>) productSetController.getRecords();
            }set;
        }   

        public OnlineShoppingController(){
            productsPopUp = true;
            cartDisplayPopUp = true;
            purchaseOrderLineItemsdisplayPopUp = false;
            personalInfoDisplayPopUp = false;
            purchaseOrderdisplayPopUp = false;
            order = new PurchaseOrder__c();
            productsInCart = new List<PurchaseOrderLineItems__c>();
            productIdsInCart = new Set<ID>();
            retrieveProducts(); 
        }
    
        //To retrive products 
        public void retrieveProducts(){
            query = 'SELECT id,name,price__c FROM Product2 ';
            productSetController = new ApexPages.StandardSetController(Database.getQueryLocator(query));
            productSetController.setPageSize(recordsPerPage);
            dtotalPages = (productSetController.getResultSize() / productSetController.getPageSize());
            dtotalPages = dtotalPages + ((Math.mod(productSetController.getResultSize(), recordsPerPage)>0) ? 1 : 0);
            totalPages = Integer.valueOf(dtotalPages);
        }
    
        //To add selected product in cart
        public Void addToCart(){
            purchaseOrderLineItemsdisplayPopUp = true;
            if(productIdsInCart.contains(selectedProductId)){
                for(PurchaseOrderLineItems__c product : productsInCart){
                    if(product.Product__c == selectedProductId){
                        product.Quantity__c = ++product.Quantity__c;
                    }
                }   
            }
            else{
                System.debug(selectedProductId);
                Product2 productToPurchase = [Select name,price__c from Product2 where id=:selectedProductId];
                PurchaseOrderLineItems__c lineItem = new PurchaseOrderLineItems__c();
                lineItem.Name = productToPurchase.Name;
                lineItem.Product__c = productToPurchase.id;
                lineItem.Quantity__c = 1;
                lineItem.TotalPrice__c=productToPurchase.Price__c;
                insert lineItem;
                ID lineItemId = lineItem.id;
                PurchaseOrderLineItems__c newProduct = [Select name,Product__c,Quantity__c,TotalPrice__c from PurchaseOrderLineItems__c where id=:lineItemId];
                productsInCart.add(newProduct);
                productIdsInCart.add(newProduct.Product__c);
            }
        }
    
        //To remove product from cart
        public Void removeFromCart(){
            PurchaseOrderLineItems__c productToRemove = [Select name,Quantity__c,TotalPrice__c from PurchaseOrderLineItems__c where id=:selectedProductId];
            Integer index = 0;
            for(PurchaseOrderLineItems__c product : productsInCart){
                if(product.Id == productToRemove.Id){
                    break;
                }
                index++;
            }
            productsInCart.remove(index);
            if(productsInCart.size() > 0){
                purchaseOrderLineItemsdisplayPopUp = true;
            }
            else{
                purchaseOrderLineItemsdisplayPopUp = false;
            }
            Delete productToRemove;
        }
    
        //To proceed for payment
        public void proceedToPay(){  
            Decimal totalPrice = 0;
            System.debug('hello');
            for(PurchaseOrderLineItems__c purchaseOrder : productsInCart){
                System.debug('purchaseOrder.TotalPrice__c'+ purchaseOrder.TotalPrice__c);
                totalPrice += (purchaseOrder.TotalPrice__c * purchaseOrder.Quantity__c);
                 System.debug('totalPrice'+ totalPrice);
            }
            order.TotalPrice__c = totalPrice;
            productsPopUp = false;
            cartDisplayPopUp = false;
            personalInfoDisplayPopUp = true;
            purchaseOrderLineItemsdisplayPopUp = false;
            totalPages = 0;
        }
    
        //To create order and provide info of delievery of product to user
        public void pay(){
            insert order;
            Id orderId = order.Id;
            for(PurchaseOrderLineItems__c purchaseOrder : productsInCart){
                purchaseOrder.PurchaseOrder__c = orderId;
            }
            Update productsInCart;
            deliveryDate = (Date.today()).addDays(9);
            personalInfoDisplayPopUp  = false;
            purchaseOrderdisplayPopUp = true;
        }
    }