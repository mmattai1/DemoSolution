﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using eRestaurantSystem.Data.POCOs;
#endregion

namespace eRestaurantSystem.Data.DTOs
{
    public class MenuCategoryFoodItemsDTO
    {
        public string MenuCategoryDescription { get; set; }
        public List<FoodItem> FoodItems { get; set; }
    }
}
