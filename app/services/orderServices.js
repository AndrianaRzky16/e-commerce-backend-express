import { getCityById } from "../api/rajaOngkir.js"
import { prisma } from "../config/prisma.js"
import { ORDER_STATUS } from "../constants/order.js"

const getOrders = async () => {
  return await prisma.order.findMany()
}

const getOrderById = async (id) => {
  return await prisma.order.findUnique({
    where: { id },
    include: {
      orderItem: true
    }
  })
}

const getOrderByIdAndUserId = async (id, userId) => {
  return await prisma.order.findUnique({
    where: { id, userId },
    include: {
      orderItem: true
    }
  })
}

const createOrderTransaction = async (
  selectedCarts,
  destination,
  totalOngkir,
  userId
) => {
  const ordersData = await getOrders()

  let invoiceNumber = 0

  if (ordersData.length === 0) {
    invoiceNumber = 1
  } else {
    ordersData.sort((a, b) => b.id - a.id)

    const lastOrderId = ordersData[0].id
    invoiceNumber = lastOrderId + 1
  }

  const destinationCity = await getCityById(destination)

  const totalOrder = selectedCarts.reduce((total, cart) => {
    return total + cart.total
  }, 0)

  const grandTotal = totalOrder + totalOngkir

  return await prisma.$transaction(async (tx) => {
    const order = await tx.order.create({
      data: {
        invoice: String(invoiceNumber),
        date: new Date(),
        userId: userId,
        destination,
        totalOrder,
        totalOngkir,
        grandTotal,
        status: ORDER_STATUS.WAITING_FOR_PAYMENT
      }
    })

    if (!order) {
      throw new Error("Failed to create order")
    }

    const orderItemsData = selectedCarts.map((cart) => {
      return {
        productId: cart.productId,
        orderId: order.id,
        quantity: cart.quantity,
        total: cart.total,
        price: cart.Product.price
      }
    })

    const orderItems = await tx.orderItem.createMany({ data: orderItemsData })

    if (!orderItems) {
      throw new Error("Failed to create order items")
    }

    const orderItemsList = await tx.orderItem.findMany({
      where: {
        orderId: order.id
      }
    })

    for (const item of orderItemsList) {
      const updatedItem = await tx.product.updateMany({
        where: {
          id: item.productId
        },
        data: {
          quantity: {
            decrement: item.quantity
          }
        }
      })
      if (updatedItem.count === 0) {
        throw new Error("Failed to update product quantity")
      }
    }

    const deletedCarts = await tx.cart.deleteMany({
      where: {
        userId,
        id: {
          in: selectedCarts.map((cart) => cart.id)
        }
      }
    })

    if (deletedCarts.count !== selectedCarts.length) {
      throw new Error("Failed to delete items in cart")
    }

    return { ...order, destination: destinationCity, orderItemsList }
  })
}

const getOrdersByUserId = async (userId) => {
  return await prisma.order.findMany({
    where: {
      userId
    },
    include: {
      orderItem: true
    },
    orderBy: {
      date: "desc"
    }
  })
}

const getAllAdminOrders = async ({ skip = 0, take = 10 }) => {
  return await prisma.order.findMany({
    orderBy: {
      date: "desc"
    },
    skip,
    take,
    include: {
      User: {
        select: {
          firstName: true,
          lastName: true,
          address: true
        }
      },
      orderItem: true
    }
  })
}

const updateStatusOrder = async (id, status) => {
  try {
    if (!id) {
      throw new Error("ID order tidak tersedia")
    }

    // Memeriksa apakah pesanan dengan ID yang diberikan ada dalam basis data
    const existingOrder = await prisma.order.findUnique({
      where: {
        id: id
      }
    })

    if (!existingOrder) {
      throw new Error("Pesanan tidak ditemukan")
    }

    // Jika pesanan ditemukan, maka lakukan pembaruan status
    const updatedOrder = await prisma.order.update({
      where: {
        id: id
      },
      data: {
        status
      }
    })

    return updatedOrder
  } catch (error) {
    throw new Error(`Gagal memperbarui status order: ${error.message}`)
  }
}

async function findOrderById(id) {
  // Memanggil fungsi findFirst dengan id sebagai filter
  return prisma.order.findUnique({
    where: { id }
  })
}

export {
  getOrders,
  createOrderTransaction,
  getOrdersByUserId,
  getAllAdminOrders,
  updateStatusOrder,
  findOrderById,
  getOrderById,
  getOrderByIdAndUserId
}
