#!/usr/bin/r -t
#
# Copyright (C) 2016 Daniel C. Dillon
#
# This file is part of RcppHoney.
#
# RcppHoney is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# RcppHoney is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with RcppHoney.  If not, see <http://www.gnu.org/licenses/>.

.setUp <- RcppHoney:::unit_test_setup("operators.cpp", "RcppHoney")

pow <- function(x, y) {x ^ y}
test.hooked.and.scalar <- function() {
    v <- 1:100
    s <- 15
    checkEquals(v + s, test_hooked_plus_scalar(v, s))
    checkEquals(s + v, test_scalar_plus_hooked(s, v))
}

test.hooked.and.hooked <- function() {
    v <- 1:100
    checkEquals(v + v, test_hooked_plus_hooked(v, v))
    checkEquals(v + v, test_hooked_plus_other_hooked(v, v))
    checkEquals(v + v, test_other_hooked_plus_hooked(v, v))
}

test.operand.and.scalar <- function() {
    v <- 1:100
    s <- 15
    checkEquals((v + v) + s, test_operand_plus_scalar(v, v, s))
    checkEquals(s + (v + v), test_scalar_plus_operand(s, v, v))
}

test.operand.and.hooked <- function() {
    v <- 1:100
    checkEquals((v + v) + v, test_operand_plus_hooked(v, v, v))
    checkEquals(v + (v + v), test_hooked_plus_operand(v, v, v))
}

test.operand.and.operand <- function() {
    v <- 1:100
    checkEquals((v + v) + (v + v), test_operand_plus_operand(v, v))
}

test.unary.operator <- function() {
    v <- 1:100
    checkEquals(-v, test_unary_operator_hooked(v))
    checkEquals(-(v + v), test_unary_operator_operand(v))
}

test.unary.function <- function() {
    v <- 1:100
    checkEquals(log(v), test_unary_function_hooked(v))
    checkEquals(log(v + v), test_unary_function_operand(v))
}

test.binary.function.hooked.and.scalar <- function() {
    v <- 1:5
    s <- 2
    checkEquals(pow(v, s), test_binary_function_hooked_scalar(v, s))
    checkEquals(pow(s, v), test_binary_function_scalar_hooked(s, v))
}

test.binary.function.hooked.and.hooked <- function() {
    v <- 1:5
    checkEquals(pow(v, v), test_binary_function_hooked_hooked(v, v))
    checkEquals(pow(v, v), test_binary_function_hooked_other_hooked(v, v))
    checkEquals(pow(v, v), test_binary_function_other_hooked_hooked(v, v))
}

test.binary.function.operand.and.scalar <- function() {
    v <- 1:5
    s <- 2
    checkEquals(pow((v + v), s), test_binary_function_operand_scalar(v, v, s))
    checkEquals(pow(s, (v + v)), test_binary_function_scalar_operand(s, v, v))
}

test.binary.function.operand.and.hooked <- function() {
    v <- 1:5
    checkEquals(pow((v + v), v), test_binary_function_operand_hooked(v, v, v))
    checkEquals(pow(v, (v + v)), test_binary_function_hooked_operand(v, v, v))
}

test.binary.function.operand.and.operand <- function() {
    v <- 1:4
    checkEquals(pow(v + v, v + v), test_binary_function_operand_operand(v, v))
}


test.na.hooked.and.scalar <- function() {
    v <- 1:100
    v <- c(v, NA)
    s <- 15
    checkEquals(v + s, test_hooked_plus_scalar(v, s))
    checkEquals(s + v, test_scalar_plus_hooked(s, v))
}

test.na.hooked.and.hooked <- function() {
    v <- 1:100
    v <- c(v, NA)
    checkEquals(v + v, test_hooked_plus_hooked(v, v))
    checkEquals(v + v, test_hooked_plus_other_hooked(v, v))
    checkEquals(v + v, test_other_hooked_plus_hooked(v, v))
}

test.na.operand.and.scalar <- function() {
    v <- 1:100
    v <- c(v, NA)
    s <- 15
    checkEquals((v + v) + s, test_operand_plus_scalar(v, v, s))
    checkEquals(s + (v + v), test_scalar_plus_operand(s, v, v))
}

test.na.operand.and.hooked <- function() {
    v <- 1:100
    v <- c(v, NA)
    checkEquals((v + v) + v, test_operand_plus_hooked(v, v, v))
    checkEquals(v + (v + v), test_hooked_plus_operand(v, v, v))
}

test.na.operand.and.operand <- function() {
    v <- 1:100
    v <- c(v, NA)
    checkEquals((v + v) + (v + v), test_operand_plus_operand(v, v))
}

test.na.unary.operator <- function() {
    v <- 1:100
    v <- c(v, NA)
    checkEquals(-v, test_unary_operator_hooked(v))
    checkEquals(-(v + v), test_unary_operator_operand(v))
}

test.na.unary.function <- function() {
    v <- 1:100
    v <- c(v, NA)
    checkEquals(log(v), test_unary_function_hooked(v))
    checkEquals(log(v + v), test_unary_function_operand(v))
}

test.na.binary.function.hooked.and.scalar <- function() {
    v <- 1:5
    v <- c(v, NA)
    s <- 2
    checkEquals(pow(v, s), test_binary_function_hooked_scalar(v, s))
    checkEquals(pow(s, v), test_binary_function_scalar_hooked(s, v))
}

test.na.binary.function.hooked.and.hooked <- function() {
    v <- 1:5
    v <- c(v, NA)
    checkEquals(pow(v, v), test_binary_function_hooked_hooked(v, v))
    checkEquals(pow(v, v), test_binary_function_hooked_other_hooked(v, v))
    checkEquals(pow(v, v), test_binary_function_other_hooked_hooked(v, v))
}

test.na.binary.function.operand.and.scalar <- function() {
    v <- 1:5
    v <- c(v, NA)
    s <- 2
    checkEquals(pow((v + v), s), test_binary_function_operand_scalar(v, v, s))
    checkEquals(pow(s, (v + v)), test_binary_function_scalar_operand(s, v, v))
}

test.na.binary.function.operand.and.hooked <- function() {
    v <- 1:5
    v <- c(v, NA)
    checkEquals(pow((v + v), v), test_binary_function_operand_hooked(v, v, v))
    checkEquals(pow(v, (v + v)), test_binary_function_hooked_operand(v, v, v))
}

test.na.binary.function.operand.and.operand <- function() {
    v <- 1:4
    v <- c(v, NA)
    checkEquals(pow(v + v, v + v), test_binary_function_operand_operand(v, v))
}