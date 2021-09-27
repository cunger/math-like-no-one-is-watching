module Polynomials

export add, subtract, multiply, euclidian_division, to_string

# Polynomials are represented as arrays of their coefficients
# in increasing order, i.e. from term with exponent 0 to n.
# For example, the polynomial
#     x^4 + x^3 + x - 1
# is ordered as
#     -1*x^0 + 1*x^1 + 0*x^2 + 1*x^3 + 1*x^4
# and thus represented as
#     [-1, 1, 0, 1, 1].

function degree(polynomial::Array{Float64,1})
  if isempty(polynomial) return 0 end;
  if last(polynomial) != 0
    return length(polynomial) - 1;
  end

  return degree(polynomial[1:(length(polynomial) - 1)]);
end

function leading_coefficient(polynomial::Array{Float64,1})
  for i=length(polynomial):-1:1
    if polynomial[i] != 0
      return polynomial[i];
    end
  end

  return 0.0;
end

function add(p1::Array{Float64,1}, p2::Array{Float64,1})
  align!(p1, p2);
  return p1 + p2;
end

function subtract(p1::Array{Float64,1}, p2::Array{Float64,1})
  align!(p1, p2);
  return p1 - p2;
end

function multiply(p1::Array{Float64,1}, p2::Array{Float64,1})
  n = degree(p1);
  m = degree(p2);

  coefficients = Array{Float64,1}();

  for k = 0:(n + m)
    c = 0;
    for i = max(0, k - m) : min(n, k)
      c += p1[i + 1] * p2[k - i + 1];
    end

    push!(coefficients, c);
  end

  return coefficients;
end

# Determines quotient q and remainder r, such that p1 = p2 * q + r.
function euclidian_division(p1::Array{Float64,1}, p2::Array{Float64,1})
  if degree(p1) < degree(p2) return euclidian_division(p2, p1) end;

  q = zeros(Float64, 1);
  r = p1;
  d = degree(p2);
  c = leading_coefficient(p2);

  while degree(r) >= d
    t = zeros(Float64, degree(p1) + 1);
    t[degree(r) - d + 1] = leading_coefficient(r)/c;
    q = add(q, t);
    r = subtract(r, multiply(t, p2));
  end

  return (q, r);
end

function gcd(p1::Array{Float64,1}, p2::Array{Float64,1})
  println(to_string(p1) * " = q(" * to_string(p2) * ") + r");

  (q, r) = euclidian_division(p1, p2);
  # p1 = q * p2 + r

  println(" q = " * to_string(q));
  println(" r = " * to_string(r));

  if (iszero(r)) return q end;

  return gcd(r, q);
end

function iszero(polynomial::Array{Float64,1})
  return all(c -> c == 0, polynomial);
end

function align!(p1::Array{Float64,1}, p2::Array{Float64,1})
  l = max(length(p1), length(p2));
  while (length(p1) < l) push!(p1, 0.0) end;
  while (length(p2) < l) push!(p2, 0.0) end;
end

function to_string(polynomial::Array{Float64,1})
  terms = Array{String,1}();

  for i=1:length(polynomial)
    exponent = i - 1;
    coefficient = polynomial[i];
    if (coefficient == 0)
      continue
    end
    if exponent == 0
      push!(terms, coefficient == 0 ? "" : string(coefficient))
    elseif exponent == 1
      push!(terms, coefficient_string(coefficient) * "x")
    else
      push!(terms, coefficient_string(coefficient) * "x^" * string(exponent))
    end
  end

  if length(terms) == 0
    return "0"
  else
    return reverse(terms) |> ts -> join(ts, " + ") |> s -> replace(s, "+ -" => "- ");
  end
end

function coefficient_string(coefficient)
  if coefficient == 1
    return "";
  elseif coefficient == -1
    return "-";
  else
    return string(coefficient);
  end
end

end
