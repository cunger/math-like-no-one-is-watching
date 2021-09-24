module Polynomials

export add, multiply

# Polynomials are represented as arrays of their coefficients
# in increasing order, i.e. from term with exponent 0 to n.
# For example, the polynomial
#     x^4 + x^3 + x - 1
# is ordered as
#     -1*x^0 + 1*x^1 + 0*x^2 + 1*x^3 + 1*x^4
# and thus represented as
#     [-1, 1, 0, 1, 1].

function degree(polynomial::Array{Int64,1})
  return length(polynomial) - 1;
end

function to_degree(deg::Int64, polynomial::Array{Int64,1})
  while degree(polynomial) < deg
    push!(polynomial, 0);
  end
end

function add(p1::Array{Int64,1}, p2::Array{Int64,1})
  deg = max(degree(p1), degree(p2));
  to_degree(deg, p1);
  to_degree(deg, p2);

  return p1 + p2;
end

function multiply(p1::Array{Int64,1}, p2::Array{Int64,1})
  n = degree(p1);
  m = degree(p2);

  coefficients = Array{Int64,1}();

  for k = 0:(n + m)
    c = 0;
    for i = max(0, k - m) : min(n, k)
      c += p1[i + 1] * p2[k - i + 1];
    end

    push!(coefficients, c);
  end

  return coefficients;
end

end
