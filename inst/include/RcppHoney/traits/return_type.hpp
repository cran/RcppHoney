// Copyright (C) 2017 Daniel C. Dillon
//
// This file is part of RcppHoney.
//
// RcppHoney is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 2 of the License, or
// (at your option) any later version.
//
// RcppHoney is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with RcppHoney.  If not, see <http://www.gnu.org/licenses/>.

#include "widest_numeric_type.hpp"

namespace RcppHoney {
namespace traits {
    
template< typename LHS_ITER, typename RHS_ITER >
struct natural_return_type
{
private:
    typedef typename std::iterator_traits< LHS_ITER >::value_type lhs_type;
    typedef typename std::iterator_traits< RHS_ITER >::value_type rhs_type;
    
public:
    typedef typename widest_numeric_type< lhs_type, rhs_type >::type;
};

template< typename LHS_ITER, typename RHS_ITER,
    typename COERCE_TYPE = 
    
} // namespace traits
} // napespace RcppHoney