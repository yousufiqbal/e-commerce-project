import * as yup from 'yup'

yup.addMethod(yup.mixed, 'ne', function () {
  return this.transform(value => {
    if (value == '' || value == "") return undefined
    return value
  })
})

yup.setLocale({ mixed: { 'required': 'Required' } })

export const extractYupErrors = err => {
  return err.inner.reduce((acc, err) => {
    return { ...acc, [err.path]: err.message };
  }, {});
}

// Parent
export const parentSchema = yup.object({
  name: yup.string().min(3).max(50).required(),
}).noUnknown(true);

// Brand
export const brandSchema = yup.object({
  name: yup.string().min(3).max(50).required(),
}).noUnknown(true);

// Child
export const childSchema = yup.object({
  parent_id: yup.number().required(),
  name: yup.string().min(3).max(50).required(),
}).noUnknown(true);

// Brand
export const constantSchema = yup.object({
  name: yup.string().min(1).max(50).required(),
  value: yup.string().min(1).max(50).required(),
}).noUnknown(true);

// Product
export const makeProductSchema = (categories, brands) => {
  return yup.object({
    category_id: yup.number().oneOf(categories.map(category => category.category_id), 'Invalid Category').nullable().required(),
    brand_id: yup.number().oneOf(brands.map(brand => brand.brand_id), 'Invalid Brand').nullable().required(),
    name: yup.string().min(3).max(50).required(),
    sku: yup.string().min(1).max(50).required(),
    stock: yup.number().moreThan(1).required(),
    unit_cost: yup.number().moreThan(1).required(),
    price: yup.number().moreThan(1).required(),
    fair_quantity: yup.number().moreThan(1).required(),
    description: yup.string().optional(),
  }).noUnknown(true);
}