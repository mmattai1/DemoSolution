using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.ComponentModel;            // ODS
using eRestaurantSystem.DAL;            // Context class
using eRestaurantSystem.Data.Entities;  // Entity classes
using eRestaurantSystem.Data.POCOs;     // POCO classes
using eRestaurantSystem.Data.DTOs;      // DTO classes
#endregion

namespace eRestaurantSystem.BLL
{
    [DataObject]
    public class ItemsController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<MenuCategoryFoodItemsDTO> MenuCategoryFoodItemDTO_Get()
        {
            using (var context = new eRestaurantContext())
            {
                var results = from food in context.Items
                    group food by new { food.MenuCategory.Description } into tempDataset
                    select new MenuCategoryFoodItemsDTO
                    {
                        //Native
                        MenuCategoryDescription = tempDataset.Key.Description,
                        //Collection of records
                        FoodItems = (from x in tempDataset
                            select new FoodItem
                            {
                                ItemID = x.ItemID,
                                FoodDescription = x.Description,
                                CurrentPrice = x.CurrentPrice,
                                TimesServed = x.BillItems.Count()
                            }).ToList()
                    };
                return results.ToList();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<MenuCategoryFoodItemsPOCO> MenuCategoryFoodItemPOCO_Get()
        {
            using (var context = new eRestaurantContext())
            {
                var results = from food in context.Items
                    orderby food.MenuCategory.Description
                    select new MenuCategoryFoodItemsPOCO
                    {
                        MenuCategoryDescription = food.MenuCategory.Description,
                        ItemID = food.ItemID,
                        FoodDescription = food.Description,
                        CurrentPrice = food.CurrentPrice,
                        TimesServed = food.BillItems.Count()
                    };
                return results.ToList();
            }
        }
    }
}
