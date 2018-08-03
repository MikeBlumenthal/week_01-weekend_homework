def pet_shop_name(shop)

  return shop[:name]

end


def total_cash(shop)

  return shop[:admin][:total_cash]

end


def add_or_remove_cash(shop, amount)

  return shop[:admin][:total_cash] += amount

end


def pets_sold(shop)

  return shop[:admin][:pets_sold]

end


def increase_pets_sold(shop, number_pets_sold)

  return shop[:admin][:pets_sold] += number_pets_sold

end


def stock_count(shop)

  return shop[:pets].length

end


def pets_by_breed(shop, pet_type)

  pets_of_breed = []

  for pet in shop[:pets]

    if pet[:breed] == pet_type
      pets_of_breed << pet
    end

  end
  return pets_of_breed

end


def find_pet_by_name(shop, name)

  for pet in shop[:pets]

    if pet[:name] == name

      result = pet

    end
  end

  return result

end


def remove_pet_by_name(shop, name)

  shop[:pets].delete_if { |pet| pet[:name] == name }

end


def add_pet_to_stock(shop, new_pet)

  shop[:pets] << new_pet

end


def customer_cash(customer)

  cash = customer[:cash]
  return cash

end


def remove_customer_cash(customer, amount)

  return customer[:cash] -= amount

end


def customer_pet_count(customer)

  return customer[:pets].length

end


def add_pet_to_customer(customer, new_pet)

  customer[:pets] << new_pet

end


def customer_can_afford_pet(customer, pet)

  cash = customer_cash(customer)
  cost = pet[:price]

  if cash >= cost
    return true

  else
    return false

  end
end


def sell_pet_to_customer(shop, pet, customer)
  unless pet == nil
    if customer_can_afford_pet(customer, pet)

      add_pet_to_customer(customer, pet)
      increase_pets_sold(shop, 1)
      remove_customer_cash(customer, pet[:price])
      add_or_remove_cash(shop, pet[:price])

    end
  end
end
